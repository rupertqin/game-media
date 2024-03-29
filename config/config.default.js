'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1509849515376_3730';
  config.proxy = true
  config.ipHeaders = 'x-forwarded-for'

  // add your config here
  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };

  config.security = {
    csrf: false,
    ctoken: false,
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

  config.redis = {
    client: {
      port: 6379,
      host: '127.0.0.1',
      password: null,
      db: 0,
    },
    agent: true,
  };

  // relate to user: session => locals ect.
  config.middleware = [
    'user',
  ];
  // config.user = {
  //   yaha: 798,
  // };

  return config;
};
