'use strict';

const uaParser = require('ua-parser-js');

module.exports = app => {
  class Main extends app.Service {
    async record(urlId) {
      const promoteLink = await app.mysql.get('promote_link', { id: urlId });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      await app.mysql.insert('promote_click', {
        pid: urlId.toString(),
        model: urlId,
        app_store_id: game.app_store_id,
        ts: (+new Date()).toString().slice(0, -3),
      });

      // @TODO
      const ua = uaParser(this.ctx.header['user-agent']);
      app.redis.hincrby('promote_click', `${this.ctx.ip}::${ua.device.model}::${urlId}`, 1);
    }

    async decode() {
      console.log('');
    }
  }
  return Main;
};
