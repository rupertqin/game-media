'use strict';


const mock = require('egg-mock');
const assert = require('assert');

describe('test/app/controller/main.test.js', () => {
  let app;
  before(() => {
    app = mock.app();
    return app.ready();
  });

  afterEach(mock.restore);

  it('should GET /choose redirect to home', async function() {
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
        pwd: 'null',
      })
      .expect(401);
  });

  it('should GET /login success', async function() {
    await app.httpRequest()
      .post('/login')
      .send({
        name: '18055855754',
        pwd: 'aaaa',
      })
      .expect(302);

  });

  it('should GET /logout success', async function() {
    app.httpRequest()
      .get('/logout')
      .expect(302);

  });

  it('should GET /enjoy fail', async function() {
    app.httpRequest()
      .get('/enjoy/666')
      .expect(404);
  });

  it('should GET /enjoy sucess', async function() {
    app.httpRequest()
      .get('/enjoy/LJ')
      .expect(200);
  });

});
