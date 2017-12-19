'use strict';

const utils = require('utility')
const uaParser = require('../extend/ua-parser');

module.exports = app => {
  class Main extends app.Service {
    async getUserIncome() {
      const userID = this.ctx.session.user.id
      let sumup = await this.app.redis.get(`SUM_INCOME:USER_${userID}`)
      sumup = sumup ? JSON.parse(sumup) : 0
      if (!sumup) {
        const today = utils.YYYYMMDD(new Date())

        // 一小时算一遍
        const expTime = 3600
        const [{ 'SUM(price)': sumAllDay }] = await this.app.mysql.query('SELECT SUM(price) FROM pay_order WHERE account_id=?', [ userID ])
        const [{ 'SUM(price)': sumToday }] = await this.app.mysql.query('SELECT SUM(price) FROM `pay_order` WHERE `account_id`=? AND `pay_at`>=?', [ userID, today ])
        sumup = {
          sumAllDay: sumAllDay || 0,
          sumToday: sumToday || 0,
        }
        await this.app.redis.set(`SUM_INCOME:USER_${userID}`, JSON.stringify(sumup))
        await this.app.redis.expire(`SUM_INCOME:USER_${userID}`, expTime)
      }
      return sumup
    }

    async promote() {
      let games = [];
      const admin_user_id = this.ctx.session.user.id;
      const promotelinks = await this.app.mysql.select('promote_link', { where: { admin_user_id } });
      if (promotelinks.length > 0) {
        const promotelinksIDs = promotelinks.map(cg => cg.app_id);
        games = await this.app.mysql.query('SELECT * FROM pay_client_app WHERE id IN (?) ORDER BY field(id,?)',
          [ promotelinksIDs, promotelinksIDs ]);
        for (let i = 0; i < games.length; i++) {
          games[i].hashid = this.ctx.helper.hashids_encode(promotelinks[i].id);
          // games[i].media_id = promotelinks[i].media_id
        }
      }
      return games
    }

    async enjoy(app_id, promotelink_id, udid, app_store_id) {

      // set cookie
      this.ctx.cookies.set('ag_activate:', promotelink_id, {
        httpOnly: false,
        signed: true,
        encrypt: true,
      })

      // mysql record promote_click
      const user_agent = this.ctx.header['user-agent'];
      const ua = uaParser(user_agent);
      const model = ua.device.model || '';
      const ip = this.ctx.ip
      await app.mysql.insert('promote_click', {
        pid: promotelink_id,
        model,
        app_id,
        app_store_id,
        user_agent,
        idfa: udid,
        ip: this.ctx.helper.ipToInt(ip) || 0,
        ts: (+new Date()).toString().slice(0, -3), // 时间戳，精确到秒
      });


      // increase promotelink view count
      await app.redis.hincrby('enjoy_view_count', promotelink_id, 1);

      // increase game view count
      let games = await app.redis.get('game')
      games = JSON.parse(games)
      let game_view_count = games[app_id].view_count || 0
      games[app_id].view_count = ++game_view_count
      await app.redis.set('game', JSON.stringify(games))

      await app.redis.hset(`trace:common:${app_id}`, `${model}@${ip}`, promotelink_id)
      // 如果有 udid
      if (udid) {
        await app.redis.hset(`trace:udid:${app_id}`, `${udid}`, promotelink_id)
      }
    }

  }
  return Main;
};
