'use strict';

module.exports = app => {
  class IncomeController extends app.Controller {
    async index() {
      let games;
      if (this.ctx.session.user) {
        const account_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('chosen_game', { account_id });
        const chosenGamesIDs = chosenGames.map(cg => cg.game_id);
        games = await this.app.mysql.select('game', { where: { game_id: chosenGamesIDs } });
      }
      this.ctx.locals.games = games;
      await this.ctx.render('income.tpl');
    }
  }
  return IncomeController;
};