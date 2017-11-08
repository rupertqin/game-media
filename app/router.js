'use strict';

module.exports = app => {
  app.get('/', 'main.index');
  app.post('/login', 'main.login');
  app.get('/logout', 'main.logout');
  app.get('/choose', 'choose.index');
};
