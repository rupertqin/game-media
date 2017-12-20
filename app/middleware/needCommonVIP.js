'use strict';

module.exports = () => {
  return function* (next) {
    if (!this.session || !this.session.user || this.session.user.isAP === true) {
      return this.redirect('/');
    }
    yield next;
  };
};
