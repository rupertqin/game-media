'use strict';

const uaParser = require('ua-parser-js');

module.exports = app => {
  class Main extends app.Service {
    async record(urlId) {
      const user_agent = this.ctx.header['user-agent'];
      const ua = uaParser(user_agent);
      const model = ua.device.model || '';
      const promoteLink = await app.mysql.get('promote_link', { id: urlId });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      const idfa = `${this.ctx.ip}-${model}`;
      await app.mysql.insert('promote_click', {
        pid: urlId.toString(),
        model,
        app_store_id: game.app_store_id,
        user_agent,
        idfa: this.ctx.query.udid,
        ip: this.ctx.helper.ipToInt(this.ctx.ip),
        ts: (+new Date()).toString().slice(0, -3), // 时间戳，精确到秒
      });

      // @TODO
      await app.redis.lpush(`enjoy:${idfa}`, urlId);
      // increase view count
      await app.redis.hincrby('enjoy_view_count', urlId, 1);
      // 如果有 udid
      if (this.ctx.query.udid) {
        await this.app.redis.hincrby('enjoy_udid_count', `${this.ctx.query.udid}`, 1);
      }

    }

    async decode() {
      console.log('');
    }
  }
  return Main;
};
