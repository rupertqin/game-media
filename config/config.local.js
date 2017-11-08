'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1509849515376_3730';

  // add your config here

  config.redis = {
    client: {
      port: 6379,
      host: '127.0.0.1',
      password: 'redauth',
      db: 0,
    },
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

  config.middleware = [];

  return config;
};