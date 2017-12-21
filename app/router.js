'use strict';

module.exports = app => {
  const needLogin = app.middlewares.needLogin();
  const needCommonVIP = app.middlewares.needCommonVIP();
  const needAPVIP = app.middlewares.needAPVIP();

  // main
  app.get('/', 'main.index');
  app.get('choose', '/choose', needCommonVIP, 'choose.index');
  app.get('promote', '/promote', needCommonVIP, 'promote.index');
  app.get('income', '/income', needCommonVIP, 'income.index');
  app.get('app-report', '/app-report', needAPVIP, 'appReport.index');
  app.get('enjoy', '/enjoy/:id', 'main.enjoy');
  app.get('contact', '/contact', 'main.contact');

  // login
  app.post('/login', 'main.login');
  app.post('/login-ap', 'main.loginAP');
  app.get('/logout', 'main.logout');

  // APIs
  app.post('/api/choosegame', needLogin, 'api.choosegame');


};
