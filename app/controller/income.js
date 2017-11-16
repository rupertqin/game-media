'use strict';

module.exports = app => {
  class IncomeController extends app.Controller {
    async index() {
      let games;
      if (this.ctx.session.user) {
        const account_id = this.ctx.session.user.id;
        let allGame = await this.app.redis.get('game')
        allGame = JSON.parse(allGame)

        games = await this.app.mysql.select('pay_order', { account_id });
        for (const g of games) {
          g.app_name = allGame[g.app_id].app_name
        }
      }
      this.ctx.locals.games = games;
      await this.ctx.render('income.tpl');
    }
  }
  return IncomeController;
};
