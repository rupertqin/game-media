'use strict';

module.exports = app => {
  class HomeController extends app.Controller {
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
        this.ctx.request.user = account;
        this.ctx.session.user = account;
      }
      this.ctx.redirect('back');
    }

    async logout() {
      this.ctx.session.user = null;
      this.ctx.redirect('/');
    }

    async enjoy() {
      const link = await this.app.mysql.get('promote_link', { url: this.ctx.params.id });
      // const [ id ] = this.ctx.helper.decode(link.url);
      const game = await this.app.mysql.get('game', { app_id: link.app_id });
      this.ctx.locals.game = game;
      await this.ctx.render('enjoy.tpl');
    }
  }
  return HomeController;
};
