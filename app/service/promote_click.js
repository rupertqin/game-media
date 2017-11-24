'use strict';

const uaParser = require('../extend/ua-parser');

module.exports = app => {
  class Main extends app.Service {
    async record(urlId) {
      const user_agent = this.ctx.header['user-agent'];
      const ua = uaParser(user_agent);
      const model = ua.device.model || '';
      const promoteLink = await app.mysql.get('promote_link', { id: urlId });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      const idfa = `${model}@${this.ctx.ip}`;
      await app.mysql.insert('promote_click', {
        pid: urlId.toString(),
        model,
        app_id: game.id,
        app_store_id: game.app_store_id,
        user_agent,
        idfa: this.ctx.query.udid,
        ip: this.ctx.helper.ipToInt(this.ctx.ip),
        ts: (+new Date()).toString().slice(0, -3), // 时间戳，精确到秒
      });

      await app.redis.hset('ENJOY_IDFA', `${idfa}@${game.id}`, urlId);
      // increase view count
      await app.redis.hincrby('ENJOY_VIEW_COUNT', urlId, 1);
      // 如果有 udid
      if (this.ctx.query.udid) {
        await this.app.redis.hincrby('ENJOY_UDID_COUNT', `${this.ctx.query.udid}`, 1);
      }

    }

    async decode() {
      console.log('');
    }
  }
  return Main;
};
