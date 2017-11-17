'use strict';

const utils = require('utility')


module.exports = app => {
  class IncomeController extends app.Controller {
    async index() {

      const perPage = 10
      const page = this.ctx.query.p || 1

      // get income sumup
      const income = await this.ctx.service.main.getUserIncome()

      // get all game
      let allGame = await this.app.redis.get('game')
      allGame = JSON.parse(allGame)

      // get pay orders
      const payOrders = await this.app.mysql.select('pay_order', { where: { account_id: this.ctx.session.user.id } });

      // add game name to orders
      for (const p of payOrders) {
        p.app_name = allGame[p.app_id].app_name
        p.pay_at = utils.YYYYMMDD(p.pay_at)
      }
      this.ctx.locals.income = income
      this.ctx.locals.paginator = this.ctx.helper.paginator(perPage, payOrders.length, page || 1)
      this.ctx.locals.payOrders = payOrders.slice(perPage * (page - 1), perPage * page)
      await this.ctx.render('income.tpl');
    }
  }
  return IncomeController;
};
