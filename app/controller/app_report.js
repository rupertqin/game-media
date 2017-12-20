'use strict';

module.exports = app => {
  class IncomeController extends app.Controller {
    async index() {
      const { income, payOrders, paginator } = await this.ctx.service.main.income({
        limit: 10,
        page: this.ctx.query.page || 1,
      })

      await this.ctx.render('income.tpl', { income, payOrders, paginator });
    }
  }
  return IncomeController;
};
