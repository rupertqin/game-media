'use strict';

module.exports = () => {
  return function* (next) {
    const startTime = Date.now();
    yield next;
    // 上报请求时间
    console.log(Date.now() - startTime);
  };
};
