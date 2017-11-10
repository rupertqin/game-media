'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const games = await this.app.mysql.select('game');
      if (this.ctx.session.user) {
        const admin_user_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('promote_link', { admin_user_id });
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
