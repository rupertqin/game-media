'use strict';

module.exports = () => {
  return function* (next) {
    if (this.session && this.session.user) {
      this.state.user = this.session.user;
      // Object.assign(this.state, this.session);
    }
    yield next;
  };
};
