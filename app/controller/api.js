'use strict';

module.exports = app => {
  class APIController extends app.Controller {
    async choosegame() {
      if (this.ctx.session.user && this.ctx.request.body) {
        const { app_id, name } = this.ctx.request.body;
        const backinfo = await this.app.mysql.insert('chosen_game', {
          app_id,
          name,
          account_id: this.ctx.session.user.id,
        });
        console.log(backinfo);
      }
      this.ctx.body = { name: 'hahahehe' };
    }
  }
  return APIController;
};
