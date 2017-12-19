'use strict'

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      const query = Object.assign({}, { page: 1, limit: 7, type: 'recommend' }, this.ctx.query)

      // 不能大于20
      if (query.limit > 20)query.limit = 20
      const games = await this.ctx.service.choose.find(query)
      const paginator = this.ctx.helper.paginator(query.limit, this.app.gameLen, query.page || 1)
      await this.ctx.render('choose.tpl', { games, paginator, query });
    }
  }
  return ChooseController;
};
