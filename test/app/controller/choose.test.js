'use strict';

const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/controller/choose.test.js', () => {
  let app;
  let ctx;
  const user_id = 1
  const username = '18055855754'
  before(async () => {
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

  afterEach(mock.restore);

  it('should GET /choose limit, gameLen, page success', async function() {
    const limit = 10
    app.gameLen = 100
    const page = 3
    const type = 'new'
    const gamename = '王这农药'
    const games = [ ...Array(limit).keys() ].map(i => {
      return {
        id: 1111 + i,
        app_store_id: 1111 + i,
        app_name: gamename + i,
        icon: '',
        admin_user_id: '',
        apk: '',
        view_count: 1111 + i,
      }
    })
    app.mockService('choose', 'find', games)
    const response = await app.httpRequest()
      .get(`/choose?type=${type}&page=${page}`)
      .expect(200)

    assert(response.text.includes(`${gamename}${limit - 1}`))
    assert(response.text.includes(`<a href="/choose?page=${page}&amp;type=${type}" class="button pagination-link is-current">${page}</a>`))
  });

});
