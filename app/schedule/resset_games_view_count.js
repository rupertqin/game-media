'use strict';

const Subscription = require('egg').Subscription;

class Main extends Subscription {
  static get schedule() {
    return {
      cron: '0 0 0 * * *',
      type: 'worker',
      // disable: true,
      // immediate: true,
    };
  }

  async subscribe() {
    let games = await this.app.redis.get('game')
    games = JSON.parse(games)
    for (const k in games) {
      games[k].view_count = 0
    }
    await this.app.redis.set('game', JSON.stringify(games))
  }
}

module.exports = Main
