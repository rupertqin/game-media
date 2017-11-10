'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const games = await this.app.mysql.select('game');
      if (this.ctx.session.user) {
        const account_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('chosen_game', { account_id });
        // check if chosen
        for (const g of games) {
          g.chosen = chosenGames.some(cg => cg.app_id === g.app_id);
        }
      }
      this.ctx.locals.games = games;
      await this.ctx.render('choose.tpl');
    }
  }
  return ChooseController;
};
