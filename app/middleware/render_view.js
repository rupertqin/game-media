'use strict';

module.exports = () => {
  return function* (next) {
    this.state.config = this.app.config
    yield next;
  };
};
