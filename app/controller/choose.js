'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const account_id = this.ctx.session.user.id;
      const games = await this.app.mysql.select('game');
      const chosenGames = await this.app.mysql.select('chosen_game', { account_id });

      // check if chosen
      for (let chosen of chosenGames) {
        for (let g of games) {
          if (chosen.game_id === g.game_id) {
            g.chosen = true;
          } else {
            g.chosen = false;
          }
        }
      }

      this.ctx.locals.games = games;
      await this.ctx.render('choose.tpl');
    }
  }
  return ChooseController;
};
