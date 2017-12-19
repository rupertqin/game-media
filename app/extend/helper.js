'use strict';

const crypto = require('crypto');
const Hashids = require('hashids');

const Paginator = require('./paginator')


function md5(text) {
  return crypto.createHash('md5').update(text).digest('hex');
}

let getHashids = function() {
  const hashids = new Hashids(this.config.keys);
  getHashids = function() {
    return hashids;
  };
  return getHashids();
};

let paginatorBuild = function(perPage, ...arg) {
  const paginator = new Paginator(perPage, 7)
  paginatorBuild = function(perPage2, ...arg2) {
    return paginator.build(...arg2)
  }
  return paginatorBuild(perPage, ...arg)
}

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

  ipToInt(IP) {
    if (!IP) return ''
    return parseInt(IP.replace(/\d+\.?/ig, function(a) {
      a = parseInt(a);
      return (a > 15 ? '' : '0') + a.toString(16);
    }), 16);
  },

  intToIp(INT) {
    if (INT < 0 || INT > 0xFFFFFFFF) {
      throw ('The number is not normal!');
    }
    return (INT>>>24) + '.' + (INT>>16 & 0xFF) + '.' + (INT>>8 & 0xFF) + '.' + (INT & 0xFF);
  },

  price() {
    return 'oneone'
  },

  paginator: paginatorBuild,
};
