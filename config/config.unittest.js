'use strict';

module.exports = appInfo => {
  const config = exports = {};
  config.ipHeaders = undefined

  config.redis = {
    client: {
      port: 6379,
      host: 'localhost',
      password: null,
      db: 2,
    },
    agent: true,
  };

  config.mysql = {
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: '123',
      database: 'halo_test',
    },
    app: true,
    agent: false,
  };


  return config;
};
