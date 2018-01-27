'use strict';

const url = require('url')

module.exports = app => {
  class MainController extends app.Controller {
    async index() {
      await this.ctx.render('index.tpl');
    }

    async login() {
      const { name, password } = this.ctx.request.body;
      const { isMember, account } = await this.ctx.helper.checkLogin(name, password);
      if (isMember) {
        this.ctx.request.user = account;
        this.ctx.session.user = account;
        this.ctx.status = 200
        this.ctx.body = { ok: true };
      } else {
        this.ctx.status = 401
      }
    }

    async loginAP() {
      const { name, password } = this.ctx.request.body;
      const { isMember, account } = await this.ctx.helper.checkAPLogin(name, password);
      if (isMember) {
        this.ctx.request.user = account;
        this.ctx.session.user = account;
        this.ctx.status = 200
        this.ctx.body = { ok: true };
      } else {
        this.ctx.throw(401, 'page not founded')
      }
    }

    async logout() {
      let targetUrl
      this.ctx.session.user = null;
      const refererUrl = this.ctx.request && this.ctx.request.header && this.ctx.request.header.referer
      if (refererUrl) {
        targetUrl = url.parse(refererUrl).pathname
      }
      this.ctx.redirect(targetUrl || '/');
    }

    async enjoy() {
      const [ promotelink_id ] = this.ctx.helper.hashids_decode(this.ctx.params.id)
      if (!promotelink_id) {
        this.ctx.throw(404, 'page not founded')
      }
      const promoteLink = await app.mysql.get('promote_link', { id: promotelink_id });
      const game = await app.mysql.get('pay_client_app', { id: promoteLink.app_id });
      this.service.main.enjoy(promoteLink.app_id, promotelink_id.toString(), this.ctx.query.uuid, game.app_store_id)

      await this.ctx.render('enjoy.tpl', { game })
    }

    async contact() {
      await this.ctx.render('contact_2.tpl');
    }
    async about() {
      await this.ctx.render('about.tpl');
    }

  }
  return MainController;
}
