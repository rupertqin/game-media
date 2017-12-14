'use strict';

const uaParser = require('../extend/ua-parser');

module.exports = app => {
  class Main extends app.Service {
    async record(promotelink_id, media_id) {
      const user_agent = this.ctx.header['user-agent'];
      const ua = uaParser(user_agent);
      const model = ua.device.model || '';
      const promoteLink = await app.mysql.get('promote_link', { id: promotelink_id });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      const ip = this.ctx.request.header['X-Forwarded-For'] || this.ctx.request.header['X-Real-IP'] || this.ctx.ip
      await app.mysql.insert('promote_click', {
        pid: promotelink_id.toString(),
        model,
        app_id: game.id,
        app_store_id: game.app_store_id,
        user_agent,
        idfa: this.ctx.query.udid,
        ip: this.ctx.helper.ipToInt(ip) || 0,
        ts: (+new Date()).toString().slice(0, -3), // 时间戳，精确到秒
      });


      // increase view count
      await app.redis.hincrby('enjoy_view_count', promotelink_id, 1);

      await app.redis.hset(`trace:common:${promoteLink.app_id}`, `${model}@${ip}`, promotelink_id)
      // 如果有 udid
      if (this.ctx.query.udid) {
        await app.redis.hset(`trace:udid:${promoteLink.app_id}`, `${this.ctx.query.udid}`, promotelink_id)
      }

    }

    async decode() {
      console.log('');
    }
  }
  return Main;
};
