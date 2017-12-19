'use strict';

const { URL } = require('url')

module.exports = app => {
  class MainController extends app.Controller {
    async index() {
      const dataList = {
        list: [ ],
      };

      const account = await this.app.mysql.get('account', { id: 1 });
      if (account && account.username) {
        dataList.list.push({
          title: account.username, url: account.username,
        });
      }

      const day = await this.app.redis.get('day');
      dataList.list.push({
        title: day, url: day,
      });
      await this.ctx.render('index.tpl', dataList);
    }

    async login() {
      const { name, pwd } = this.ctx.request.body;
      const { isMember, account } = await this.ctx.helper.checkLogin(name, pwd);
      if (isMember) {
        // const ssid = this.ctx.helper.genSession(name, account);
        // this.ctx.cookies.set('ssid', ssid);
        const myURL = new URL(this.ctx.request.header.referer)
        this.ctx.request.user = account;
        this.ctx.session.user = account;
        this.ctx.body = { ok: true };
        this.ctx.redirect(myURL.pathname);
      } else {
        this.ctx.status = 401
      }
    }

    async logout() {
      this.ctx.session.user = null;
      const myURL = new URL(this.ctx.request.header.referer)
      this.ctx.redirect(myURL.pathname);
    }

    async enjoy() {
      const [ promotelink_id ] = this.ctx.helper.hashids_decode(this.ctx.params.id)
      if (!promotelink_id) {
        this.ctx.throw(404, 'page not founded')
      }
      const promoteLink = await app.mysql.get('promote_link', { id: promotelink_id });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      this.service.main.enjoy(promoteLink.app_id, promotelink_id.toString(), this.ctx.quest.uuid, game.app_store_id)

      await this.ctx.render('enjoy.tpl', { game })
    }

    async contact() {
      await this.ctx.render('contact.tpl');
    }

  }
  return MainController;
}
