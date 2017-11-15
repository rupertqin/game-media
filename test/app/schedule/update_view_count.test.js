'use strict';

const mm = require('egg-mock');
const assert = require('assert');

it('should view count from redis to mysql', async () => {
  const app = mm.app();
  await app.ready();

  console.log(app.mysql.beginTransaction());
  await app.runSchedule('update_view_count');
  let o = await app.redis.hgetall('update_view_count');
  console.log(o);
  assert(o);
});
