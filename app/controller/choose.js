'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const games = await this.app.mysql.select('pay_client_app', { columns: [ 'id', 'app_store_id', 'app_name', 'icon', 'admin_user_id', 'apk' ] });
      if (this.ctx.session.user) {
        const admin_user_id = this.ctx.session.user.id;
        const chosenGames = await this.app.mysql.select('promote_link', { admin_user_id });
        // check if chosen
        for (const g of games) {
          g.chosen = chosenGames.some(cg => cg.app_id === g.id);
        }
      }
      this.ctx.locals.games = games;
      await this.ctx.render('choose.tpl');
    }
  }
  return ChooseController;
};
