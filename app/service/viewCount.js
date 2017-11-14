'use strict';

module.exports = app => {
  class ViewCount extends app.Service {
    async increase(urlId) {
      const { id } = await app.mysql.get('promote_link', { url: urlId });
      app.redis.hincrby('enjoy_view_count', id, 1);
    }

    async decode(str) {
    }
  }
  return ViewCount;
};
