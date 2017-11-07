'use strict';

module.exports = app => {
  app.get('/', 'home.index');
  app.post('/login', 'home.login');
  app.get('/choose', 'choose.index');
};
