'use strict';

module.exports = app => {
  class ChooseController extends app.Controller {
    async index() {
      await this.ctx.render('choose.tpl');
    }
  }
  return ChooseController;
};
