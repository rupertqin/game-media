'use strict';

module.exports = app => {
  class Main extends app.Service {
    async getUserIncome() {
      const [{ 'SUM(price)': sum }] = await this.app.mysql.query('SELECT SUM(price) FROM pay_order WHERE account_id=?', [ this.ctx.session.user.id ])
      console.log(sum)
    }
  }
  return Main;
};
