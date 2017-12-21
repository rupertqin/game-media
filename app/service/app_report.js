'use strict'

const Service = require('egg').Service

class Main extends Service {
  async find(query) {

    // order by
    let order
    if (query.type === 'hot') {
      order = [ 'app_name', 'asc' ]
    } else if (query.type === 'new') {
      order = [ 'id', 'desc' ]
    } else {
      order = [ 'id', 'desc' ]
    }

    let games = await this.app.mysql.select('pay_client_app', {
      limit: +query.limit,
      offset: query.limit * (query.page - 1),
      columns: [ 'id', 'app_store_id', 'app_name', 'icon', 'admin_user_id', 'apk' ],
      where: { status: 1 },
      orders: [ order ],
    });


    if (query.type === 'hot') {
      let gamesObj = await this.app.redis.get('game')
      gamesObj = JSON.parse(gamesObj)
      games = []
      for (const k in gamesObj) {
        games.push({
          id: gamesObj[k].id,
          app_store_id: gamesObj[k].app_store_id,
          app_name: gamesObj[k].app_name,
          icon: gamesObj[k].icon,
          admin_user_id: gamesObj[k].admin_user_id,
          apk: gamesObj[k].apk,
          view_count: gamesObj[k].view_count || 0,
        })
      }
      games.sort((a, b) => {
        return b.view_count - a.view_count
      })
      games = games.slice(query.limit * (query.page - 1), query.limit * query.page)
    }

    if (this.ctx.session.user) {
      const admin_user_id = this.ctx.session.user.id;
      const chosenGames = await this.app.mysql.select('promote_link', { where: { admin_user_id } });
      // check if chosen
      for (const g of games) {
        g.chosen = chosenGames.some(cg => cg.app_id === g.id);
      }
    }
    return games
  }
}

module.exports = Main
