'use strict';
const utils = require('utility')
module.exports = app => {
  class Main extends app.Service {
    async getUserIncome() {
      const userID = this.ctx.session.user.id
      let sumup = await this.app.redis.get(`SUM_INCOME:USER_${userID}`)
      sumup = sumup ? JSON.parse(sumup) : 0
      if (!sumup) {
        const today = utils.YYYYMMDD(new Date())
        const expTime = 3600
        const [{ 'SUM(price)': sumAllDay }] = await this.app.mysql.query('SELECT SUM(price) FROM pay_order WHERE account_id=?', [ userID ])
        const [{ 'SUM(price)': sumToday }] = await this.app.mysql.query('SELECT SUM(price) FROM `pay_order` WHERE `account_id`=? AND `pay_at`>=?', [ userID, today ])
        sumup = { sumAllDay, sumToday }
        await this.app.redis.set(`SUM_INCOME:USER_${userID}`, JSON.stringify(sumup))
        await this.app.redis.expire(`SUM_INCOME:USER_${userID}`, expTime)
      }
      return sumup
    }
  }
  return Main;
};
