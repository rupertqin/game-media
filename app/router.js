'use strict';

module.exports = app => {
  app.get('/', 'main.index');
  app.get('/choose', 'choose.index');

  // login
  app.post('/login', 'main.login');
  app.get('/logout', 'main.logout');

  // ajax
  app.post('/api/choosegame', 'api.choosegame');


};
