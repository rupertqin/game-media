'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      this.ctx.body = 'choose';
      const dataList = {
        list: [
          { id: 1, title: 'this is news 1', url: '/news/1' },
          { id: 2, title: 'this is news 2', url: '/news/2' },
        ],
      };
      this.ctx.set('Content-Type', 'text/html');
      const day = await this.app.redis.get('day');
      dataList.list.push({
        title: day, url: day,
      });
      await this.ctx.render('choose/index.tpl', dataList);

    }
  }
  return ChooseController;
};
