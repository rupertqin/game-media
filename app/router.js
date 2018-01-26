'use strict';

module.exports = app => {
  const needLogin = app.middlewares.needLogin();
  const needCommonVIP = app.middlewares.needCommonVIP();
  const needAPVIP = app.middlewares.needAPVIP();
  const renderView = app.middlewares.renderView();

  // main
  app.get('/', renderView, 'main.index');
  app.get('choose', '/choose', needCommonVIP, renderView, 'choose.index');
  app.get('promote', '/promote', needCommonVIP, renderView, 'promote.index');
  app.get('income', '/income', needCommonVIP, renderView, 'income.index');
  app.get('app-report', '/app-report', needAPVIP, renderView, 'appReport.index');
  app.get('enjoy', '/enjoy/:id', renderView, 'main.enjoy');
  app.get('contact', '/contact', renderView, 'main.contact');
  app.get('about', '/about', renderView, 'main.about');

  // login
  app.post('/login', 'main.login');
  app.post('/login-ap', 'main.loginAP');
  app.get('/logout', 'main.logout');

  // APIs
  app.post('/api/choosegame', needLogin, 'api.choosegame');


};
