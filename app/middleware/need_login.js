'use strict';

module.exports = () => {
  return function* (next) {
    if (!this.session || !this.session.user) {
      return this.redirect('/');
    }
    yield next;
  };
};
