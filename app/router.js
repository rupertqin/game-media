'use strict';

module.exports = app => {
  const checkLogin = app.middlewares.checkLogin();

  app.get('/', checkLogin, 'main.index');
  app.get('/choose', 'choose.index');
  app.get('/promote', checkLogin, 'promote.index');
  app.get('/income', checkLogin, 'income.index');
  app.get('/promotelink', 'main.promotelink');

  // login
  app.post('/login', 'main.login');
  app.get('/logout', 'main.logout');

  // ajax
  app.post('/api/choosegame', checkLogin, 'api.choosegame');


};
