'use strict';

module.exports = () => {
  return function* (next) {
    if (this.session && this.session.user) {
      if (this.state.user) {
        Object.assign(this.state.user, this.session.user);
      } else {
        this.state.user = this.session.user;
      }
    }
    yield next;
  };
};
