'use strict';

module.exports = app => {
  class APIController extends app.Controller {
    async choosegame() {
      let body;
      if (this.ctx.session.user && this.ctx.request.body) {
        const { app_id, name } = this.ctx.request.body;
        const account_id = this.ctx.session.user.id;
        try {
          const record = await this.app.mysql.get('chosen_game', { account_id, app_id });
          if (!record) {
            const backinfo2 = await this.app.mysql.insert('chosen_game', {
              app_id,
              name,
              account_id: this.ctx.session.user.id,
            });
            if (backinfo2.affectedRows === 1) {
              body = { ok: true };
            } else {
              body = { ok: false };
            }
          } else {
            body = { ok: false };
          }

        } catch (err) {
          throw err;
        }
      }
      this.ctx.body = body;
    }
  }
  return APIController;
};
