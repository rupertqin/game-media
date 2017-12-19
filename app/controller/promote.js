'use strict'

module.exports = app => {
  class PromoteController extends app.Controller {
    async index() {
      const games = await this.ctx.service.main.promote()
      await this.ctx.render('promote.tpl', { games });
    }
  }
  return PromoteController;
};
