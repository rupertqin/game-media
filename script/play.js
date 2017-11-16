'use strict';

const Redis = require('ioredis')
const mysql = require('mysql');
const redis = new Redis()
const fs = require('fs')

const [ , , name = 'hxh' ] = process.argv

console.log(name)

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123',
  database: 'halo',
});
connection.connect();

(async function play(params) {
  const info = await redis.set('play_foo', 'bar3')
  const info2 = await redis.get('play_foo')
  console.log(info2)
  const evCount = await redis.hgetall('enjoy_view_count');
  const text = JSON.stringify(evCount) + (+new Date())
  console.log(text)
  console.log( fs.writeFileSync(`${name}.txt`, text), function() {
  })

  if (Object.getOwnPropertyNames(evCount).length !== 0) {
    connection.query('SELECT 1 + 1 AS solution', function(error, results, fields) {
      if (error) throw error;
      console.log('The solution is: ', results[0].solution);
    });
    for (const k in evCount) {
      // 缓存里的数值添加到数据库
      await connection.query(`update promote_link set view_count=view_count+${evCount[k]} where id = ${k}`);
    }

    // await this.app.redis.del('enjoy_view_count');
  }
  connection.end();
  // process.exit(1);
})()

