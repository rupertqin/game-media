'use strict';

module.exports = app => {
  class APIController extends app.Controller {
    async choosegame() {
      let body = { ok: false };
      if (this.ctx.session.user && this.ctx.request.body) {
        const { app_id } = this.ctx.request.body;
        const account_id = this.ctx.session.user.id;
        try {
          const chosenGame = await this.app.mysql.get('promote_link',
            { admin_user_id: account_id, app_id });
          if (!chosenGame) {
            const insertInfo = await this.app.mysql.insert('promote_link', {
              app_id,
              admin_user_id: this.ctx.session.user.id,
            });
            if (insertInfo.affectedRows === 1) {
              body = { ok: true };
            }
          }
        } catch (err) {
          body.msg = 'insert err';
        }
      }
      this.ctx.body = body;
    }
  }
  return APIController;
};
