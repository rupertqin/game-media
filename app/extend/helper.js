'use strict';

const crypto = require('crypto');

function md5(text) {
  return crypto.createHash('md5').update(text).digest('hex');
}

module.exports = {
  foo(param) {
    // this 是 helper 对象，在其中可以调用其他 helper 方法
    // this.ctx => context 对象
    // this.app => application 对象
  },

  async checkLogin(name, pwd) {
    pwd = md5(pwd);
    const account = await this.app.mysql.get('account', { username: name });
    const isMember = pwd === account.password;
    return { isMember, account: isMember ? account : null };
  },

  genSession(name, account) {
    const session = md5(name);
    this.app.redis.set(session, JSON.stringify(account));
    return session;
  },
};
