'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const dataList = {
        list: [
          { id: 1, title: 'this is news 1', url: '/news/1' },
          { id: 2, title: 'this is news 2', url: '/news/2' },
        ],
      };

      const account = await this.app.mysql.get('account', { id: 1 });
      dataList.list.push({
        title: account.username, url: account.username,
      });

      const day = await this.app.redis.get('day');
      dataList.list.push({
        title: day, url: day,
      });

      await this.ctx.render('choose/index.tpl', dataList);
    }
  }
  return ChooseController;
};
