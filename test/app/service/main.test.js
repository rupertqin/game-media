'use strict';


const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/service/main.test.js', () => {
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

  it('should getUserIncome sucess when already has data', async function() {
    await app.redis.set(`SUM_INCOME:USER_${user_id}`, JSON.stringify({
      sumToday: 999,
      sumAllDay: 999999,
    }))
    const { sumAllDay, sumToday } = await ctx.service.main.getUserIncome()
    assert(sumAllDay === 999999)
    assert(sumToday === 999)

  })

  it('should promote get games sucess', async function() {
    const games = await ctx.service.main.promote()
    assert(Array.isArray(games))
  })

  it('should getUserIncome sucess when has no data', async function() {
    await app.redis.del(`SUM_INCOME:USER_${user_id}`)
    const { sumAllDay: sumAllDay2, sumToday: sumToday2 } = await ctx.service.main.getUserIncome()
    let income = await app.redis.get(`SUM_INCOME:USER_${user_id}`)
    income = JSON.parse(income)
    assert(income.sumAllDay === sumAllDay2)
    assert(income.sumToday === sumToday2)
  })

  it('should enjoy record sucess', async function() {
    const promotelink_id = '18'
    const app_id = 211502
    const udid = 'myudid'
    const app_store_id = 111111

    // before
    const [{ ori_count }] = await app.mysql.query('SELECT COUNT(*) AS ori_count FROM promote_click')
    const ori_enjoy_view_count = await app.redis.hget('enjoy_view_count', promotelink_id)

    // 获取 view count
    let games = await app.redis.get('game')
    games = JSON.parse(games)
    const ori_game_view_count = games[app_id].view_count || 0

    // 执行
    await ctx.service.main.enjoy(app_id, promotelink_id, udid, app_store_id)

    // after
    const [{ count }] = await app.mysql.query('SELECT COUNT(*) AS count FROM promote_click')
    const enjoy_view_count = await app.redis.hget('enjoy_view_count', promotelink_id)

    // 获取 view count
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
