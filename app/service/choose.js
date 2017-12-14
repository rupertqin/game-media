'use strict'

const Service = require('egg').Service;

class ChooseService extends Service {
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

    const games = await this.app.mysql.select('pay_client_app', {
      limit: +query.limit,
      offset: query.limit * (query.page - 1),
      columns: [ 'id', 'app_store_id', 'app_name', 'icon', 'admin_user_id', 'apk' ],
      orders: [ order ],
    });
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

module.exports = ChooseService;
