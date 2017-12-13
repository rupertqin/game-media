'use strict';

module.exports = app => {

  app.beforeStart(function* () {
    // 应用会等待这个函数执行完成才启动
    app.cities = [ 'beijing', 'shanghai' ];
  });

  (async () => {
    const games = await app.mysql.select('pay_client_app')
    const game = {}
    app.gameLen = games.length
    for (const g of games) {
      game[g.id] = g
    }
    app.redis.set('game', JSON.stringify(game))
  })();

  // set redis session store
  // session store must have 3 methods
  // define sessionStore in `app.js` so you can access `app.redis`
  // app.sessionStore = {
  //   * get(key) {
  //     const res = yield app.redis.get(key);
  //     if (!res) return null;
  //     return JSON.parse(res);
  //   },

  //   * set(key, value, maxAge) {
  //     // maxAge not present means session cookies
  //     // we can't exactly know the maxAge and just set an appropriate value like one day
  //     if (!maxAge) maxAge = 24 * 60 * 60 * 1000;
  //     value = JSON.stringify(value);
  //     yield app.redis.set(key, value, 'PX', maxAge);
  //   },

  //   * destroy(key) {
  //     yield app.redis.del(key);
  //   },
  // };


  // session store can be a session store class
  // app.sessionStore = class Store {
  //   constructor(app) {
  //     this.app = app;
  //   }
  //   * get() {}
  //   * set() {}
  //   * destroy() {}
  // };


  // app.config.coreMiddleware.unshift('report');
  // app.config.coreMiddleware.unshift('user');
};
