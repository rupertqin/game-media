'use strict'

const Service = require('egg').Service

class Main extends Service {
  async find(query) {
    const { limit, page } = query
    const uid = this.ctx.session.user.id

    const sql = `SELECT DATE(o.created_at) as date, p.app_name, p.icon,
      COUNT(DISTINCT account_id) as recharge_num,
      SUM(price) / 100 as price 
      FROM pay_order o
      LEFT JOIN pay_client_app p ON o.app_id = p.id
      WHERE p.status =1 AND o.client_id = ?
      GROUP BY DATE(o.created_at),app_id
      LIMIT ? OFFSET ?`
    const items = await this.app.mysql.query(sql, [ uid, limit, limit * (page - 1) ])

    const [{ len }] = await this.app.mysql.query(`select COUNT(DISTINCT DATE(created_at), app_id) as len
      from pay_order WHERE  client_id = ?`, [ uid ])
    const paginator = this.ctx.helper.paginator(limit, len, page)
    return { items, paginator }
  }
}

module.exports = Main
