'use strict';

const crypto = require('crypto');
const Hashids = require('hashids');

function md5(text) {
  return crypto.createHash('md5').update(text).digest('hex');
}

let getHashids = function() {
  const hashids = new Hashids('*)*(sdfs2342342342sfwfwf');
  getHashids = function() {
    return hashids;
  };
  return getHashids();
};

module.exports = {
  foo() {
    // this 是 helper 对象，在其中可以调用其他 helper 方法
    // this.ctx => context 对象
    // this.app => application 对象
  },

  hashids_encode(id) {
    const hashids = getHashids.call(this);
    return hashids.encode(id);
  },

  hashids_decode(str) {
    const hashids = getHashids.call(this);
    return hashids.decode(str);
  },

  async checkLogin(name, pwd) {
    pwd = md5(pwd);
    const account = await this.app.mysql.get('account', { username: name });
    const isMember = !!account && (pwd === account.password);
    return { isMember, account: isMember ? account : null };
  },

  genSession(name, account) {
    const session = md5(name);
    this.app.redis.set(session, JSON.stringify(account));
    return session;
  },

  stringify(json) {
    return JSON.stringify(json);
  },
};
