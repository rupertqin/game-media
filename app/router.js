'use strict';

module.exports = app => {
  const checkLogin = app.middlewares.checkLogin();

  // main
  app.get('/', checkLogin, 'main.index');
  app.get('choose', '/choose', 'choose.index');
  app.get('/promote', checkLogin, 'promote.index');
  app.get('/income', checkLogin, 'income.index');
  app.get('enjoy', '/enjoy/:id', 'main.enjoy');
  app.get('contact', '/contact', 'main.contact');

  // login
  app.post('/login', 'main.login');
  app.get('/logout', 'main.logout');

  // APIs
  app.post('/api/choosegame', checkLogin, 'api.choosegame');


};
