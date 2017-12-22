'use strict';

module.exports = app => {
  class Main extends app.Controller {
    async index() {
      const query = Object.assign({}, { page: 1, limit: 10 }, this.ctx.query)

      // 不能大于20
      query.limit = +query.limit
      query.page = +query.page
      if (query.limit > 20)query.limit = 20
      const { items, paginator } = await this.ctx.service.appReport.find(query)
      await this.ctx.render('app_report.tpl', { items, paginator, query });
    }
  }
  return Main;
};
