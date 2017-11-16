'use strict';

module.exports = app => {
  class PromoteController extends app.Controller {
    async index() {
      let games = [];
      if (this.ctx.session.user) {
        const admin_user_id = this.ctx.session.user.id;
        const promotelinks = await this.app.mysql.select('promote_link', { where: { admin_user_id } });
        if (promotelinks.length > 0) {
          const promotelinksIDs = promotelinks.map(cg => cg.app_id);
          games = await this.app.mysql.query('SELECT * FROM pay_client_app WHERE id IN (?) ORDER BY field(id,?)',
            [ promotelinksIDs, promotelinksIDs ]);
          for (let i = 0; i < games.length; i++) {
            games[i].hashid = this.ctx.helper.hashids_encode(promotelinks[i].id);
          }
        }
      }
      this.ctx.locals.games = games;
      await this.ctx.render('promote.tpl');
    }
  }
  return PromoteController;
};
