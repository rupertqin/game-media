'use strict';

const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/service/choose.test.js', () => {
  let app;
  let ctx;
  const user_id = 1
  const username = '18055855754'
  beforeEach(async () => {
    app = mock.app();
    await app.ready();

    // 模拟登录
    app.mockSession({
      user: {
        id: user_id,
        username,
      },
    });
    ctx = app.mockContext();
  });

  afterEach(mock.restore)

  it('should get games limit, page, success', async function() {
    const games = await ctx.service.choose.find({
      limit: 4,
      type: 'new',
      page: 2,
    })
    const games2 = await ctx.service.choose.find({
      limit: 8,
      type: 'new',
      page: 1,
    })

    assert(Array.isArray(games))
    assert(games.length === 4)
    assert(games[3].id === games2[7].id)
  });

  it('should get games hot success', async function() {
    const games = await ctx.service.choose.find({
      limit: 4,
      type: 'hot',
      page: 2,
    })
    assert(games[0].view_count >= games[1].view_count)
  });

});
