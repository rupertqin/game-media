'use strict'

const Service = require('egg').Service

class Main extends Service {
  async find(query) {
    const { limit, page } = query
    const uid = this.ctx.session.user.id

    // tasks
    const tasks = []
    const sql = `SELECT DATE(o.created_at) as date, p.app_name, p.icon, p.id as app_id,
      COUNT(DISTINCT account_id) as recharge_num,
      SUM(price) / 100 as price 
      FROM pay_order o
      LEFT JOIN pay_client_app p ON o.app_id = p.id
      WHERE p.status = 1 AND o.client_id = ? AND o.status = 5
      GROUP BY DATE(o.created_at), o.app_id
      LIMIT ? OFFSET ?`
    tasks.push(this.app.mysql.query(sql, [ uid, limit, limit * (page - 1) ]))
    tasks.push(this.app.mysql.query(`select COUNT(DISTINCT DATE(created_at), app_id) as len
      from pay_order 
      WHERE client_id = ? AND status = 5
      `, [ uid ]))
    tasks.push(this.findAllRegNum())
    const [ items, [{ len }], regNumArr ] = await Promise.all(tasks)

    for (const item of items) {
      const regEl = regNumArr.find(el => el.app_id === item.app_id && +el.date === +item.date)
      if (regEl) {
        item.reg_num = regEl.reg_num
      }
    }

    const paginator = this.ctx.helper.paginator(limit, len, page)
    return { items, paginator }
  }

  async findAllRegNum() {
    const key = `APP_ACCOUNT_REG_NUM_ARR:${this.ctx.session.user.id}`
    let regNumArr = []
    regNumArr = await this.app.redis.get(key)
    if (!regNumArr) {
      const sql = `SELECT app_id, DATE(a.created_at) AS date, p.app_name, COUNT(*) AS reg_num FROM app_account a
        LEFT JOIN pay_client_app p ON a.app_id = p.id
        WHERE p.status = 1
        GROUP BY app_id, DATE(a.created_at)
        ORDER BY date DESC`
      regNumArr = await this.app.mysql.query(sql, [])
      this.app.redis.set(key, regNumArr)
      this.app.redis.expire(key, 3600)
    }
    return regNumArr
  }
}

module.exports = Main
