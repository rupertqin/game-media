'use strict';


const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/service/main.test.js', () => {
  let app;
  let ctx;
  before(async () => {
    app = mock.app();
    await app.ready();
    ctx = app.mockContext();
  });

  afterEach(mock.restore);


  it('should enjoy record sucess', async function() {
    const promotelink_id = '18'
    const app_id = 211502
    const udid = 'myudid'

    // before
    const [{ ori_count }] = await app.mysql.query('SELECT COUNT(*) AS ori_count FROM promote_click')
    const ori_enjoy_view_count = await app.redis.hget('enjoy_view_count', promotelink_id)

    let games = await app.redis.get('game')
    games = JSON.parse(games)
    const ori_game_view_count = games[app_id].view_count || 0

    await ctx.service.main.enjoy(app_id, promotelink_id, udid, 11111)

    // after
    const [{ count }] = await app.mysql.query('SELECT COUNT(*) AS count FROM promote_click')
    const enjoy_view_count = await app.redis.hget('enjoy_view_count', promotelink_id)


    games = await app.redis.get('game')
    games = JSON.parse(games)
    const game_view_count = games[app_id].view_count || 0

    const after_promotelink_id = await app.redis.hget(`trace:common:${app_id}`, '@127.0.0.1')

    const has_udid_promotelink_id = await app.redis.hget(`trace:udid:${app_id}`, `${udid}`)

    assert(ori_count === count - 1)
    assert(+ori_enjoy_view_count === +enjoy_view_count - 1)
    assert(+ori_game_view_count === +game_view_count - 1)
    assert(promotelink_id === after_promotelink_id)
    assert(promotelink_id === has_udid_promotelink_id)
  });

});
