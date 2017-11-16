'use strict';

const utils = require('utility')


module.exports = app => {
  class IncomeController extends app.Controller {
    async index() {
      const perPage = 10
      const page = this.ctx.query.p || 1
      let payOrders;
      if (this.ctx.session.user) {
        const account_id = this.ctx.session.user.id;

        // get all game
        let allGame = await this.app.redis.get('game')
        allGame = JSON.parse(allGame)

        // get pay orders
        payOrders = await this.app.mysql.select('pay_order', { account_id });

        // add game name to orders
        for (const p of payOrders) {
          p.app_name = allGame[p.app_id].app_name
          p.pay_at = utils.YYYYMMDD(p.pay_at)
        }
      }
      const gameLen = payOrders.length
      this.ctx.locals.payOrders = payOrders.slice(perPage * (page - 1), perPage * page)
      this.ctx.locals.paginator = this.ctx.helper.paginator(perPage, gameLen, page || 1)
      await this.ctx.render('income.tpl');
    }
  }
  return IncomeController;
};
