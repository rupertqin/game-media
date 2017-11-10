'use strict';

module.exports = () => {
  return function* (next) {
    if (this.request.url !== '/' && (!this.session || !this.session.user)) {
      this.redirect('/');
    }
    yield next;
  };
};
