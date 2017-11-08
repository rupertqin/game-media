'use strict';

module.exports = app => {
  class HomeController extends app.Controller {
    async index() {
      const dataList = {
        list: [
          { id: 1, title: 'this is news 1', url: '/news/1' },
          { id: 2, title: 'this is news 2', url: '/news/2' },
        ],
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
        this.ctx.session.user = account;
      }
      this.ctx.redirect('/choose');
    }

    async logout() {
      this.ctx.session.user = null;
      this.ctx.redirect('/');
    }
  }
  return HomeController;
};
