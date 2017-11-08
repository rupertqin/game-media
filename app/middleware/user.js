'use strict';

module.exports = options => {
  return function* (next) {
    if (this.session.user) {
      this.state.user = this.session.user;
      // Object.assign(this.state, this.session);
    }
    yield next;
  };
};
