'use strict'

module.exports = app => {
  class PromoteController extends app.Controller {
    async index() {
      const { games, paginator } = await this.ctx.service.main.promote({
        limit: this.ctx.query.limit || 10,
        page: this.ctx.query.page || 1,
      })
      await this.ctx.render('promote.tpl', { games, paginator })
    }
  }
  return PromoteController;
};
