'use strict';


const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/controller/main.test.js', () => {
  let app
  let ctx
  const user_id = 1
  const username = '18055855754'
  before(() => {
    app = mock.app();
    return app.ready();

    // 模拟登录
    // app.mockSession({
    //   user: {
    //     id: user_id,
    //     username,
    //   },
    // });
  });

  // afterEach(mock.restore);
  after(() => app.close());


  it('should GET /choose redirect to home', async function() {
    app.mockSession({
      user: null,
    });
    const response = await app.httpRequest()
      .get('/choose')
      .expect(302);
    assert(response.header.location === '/')
  });

  it('should POST /login fail', async function() {
    const r = await app.httpRequest()
      .post('/login')
      .send({
        name: '18055855754',
        password: 'null',
      })
      .expect(401);
  });

  it('should GET /login success', async function() {
    await app.httpRequest()
      .post('/login')
      .send({
        name: '18055855754',
        password: 'aaaa',
      })
      .expect(200);

  });

  it('should GET /logout success', async function() {
    ctx = app.mockContext({
      request: {
        header: {
          referer: 'http://localhost:7001/aa'
        },
      },
      haha: 'bibi',
    });
    console.log(ctx, '===========')
    await app.httpRequest()
      .get('/logout')
      .expect(302);

  });

  it('should GET /enjoy fail', async function() {
    await app.httpRequest()
      .get('/enjoy/666')
      .expect(404);
  });

  it('should GET /enjoy sucess', async function() {
    const response = await app.httpRequest()
      .get('/enjoy/LJ')
      .expect(200)
      .expect(/乱世王者/)
  });

});
