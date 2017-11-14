'use strict';

const mm = require('egg-mock');
const assert = require('assert');

it('should view count from redis to mysql', async () => {
  const app = mm.app();
  await app.ready();
});
