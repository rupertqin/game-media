'use strict';

module.exports = app => {
  class HomeController extends app.Controller {
    async index() {
      this.ctx.body = 'hi, egg you do';
    }

    async login() {
      const { name, pwd } = this.ctx.request.body;
      const { isMember, account } = await this.ctx.helper.checkLogin(name, pwd);
      if (isMember) {
        // const ssid = this.ctx.helper.genSession(name, account);
        this.ctx.session.user = account;
        this.ctx.locals.user = account;
        // this.ctx.cookies.set('ssid', ssid);
      }
      this.ctx.redirect('/choose');
    }

    async logout() {
      
    }
  }
  return HomeController;
};
