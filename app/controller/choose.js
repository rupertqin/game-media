'use strict'

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const perPage = 2
      const page = this.ctx.query.p
      const games = await this.app.mysql.select('pay_client_app', {
        // limit: perPage,
        // offset: perPage * (page - 1),
        columns: [ 'id', 'app_store_id', 'app_name', 'icon', 'admin_user_id', 'apk' ],
      });
      if (this.ctx.session.user) {
        const admin_user_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('promote_link', { admin_user_id });
        // check if chosen
        for (const g of games) {
          g.chosen = chosenGames.some(cg => cg.app_id === g.id);
        }
      }
      const gameLen = games.length
      this.ctx.locals.games = games.slice(perPage * (page - 1), perPage * page);
      this.ctx.locals.paginator = this.ctx.helper.paginator(gameLen, page || 1)
      await this.ctx.render('choose.tpl');
    }
  }
  return ChooseController;
};
