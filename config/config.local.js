'use strict';

module.exports = appInfo => {
  const config = exports = {};

  config.redis = {
    client: {
      port: 6379,
      host: '127.0.0.1',
      password: null,
      db: 0,
    },
    agent: true,
  };

  config.mysql = {
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: '123',
      database: 'halo',
    },
    app: true,
    agent: false,
  };


  return config;
};
