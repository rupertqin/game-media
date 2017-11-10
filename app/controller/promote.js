'use strict';

module.exports = app => {
  class PromoteController extends app.Controller {
    async index() {
      let games;
      if (this.ctx.session.user) {
        const admin_user_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('promote_link', { admin_user_id });
        const chosenGamesIDs = chosenGames.map(cg => cg.app_id);
        games = await this.app.mysql.select('game', { where: { app_id: chosenGamesIDs } });
      }
      this.ctx.locals.games = games;
      await this.ctx.render('promote.tpl');
    }
  }
  return PromoteController;
};
