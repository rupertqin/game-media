'use strict';

const Subscription = require('egg').Subscription;
module.exports = app => {
  class Main extends Subscription {
    static get schedule() {
      return {
        interval: '1h',
        type: 'worker',
        disable: app.config.env === 'local',
        // immediate: true,
      };
    }

    async subscribe() {
      // 初始化事务
      const conn = await this.app.mysql.beginTransaction();
      try {
        const evCount = await this.app.redis.hgetall('enjoy_view_count');
        if (Object.getOwnPropertyNames(evCount).length === 0) return;
        for (const k in evCount) {
          // 缓存里的数值添加到数据库
          await conn.query('update promote_link set view_count=view_count+? where id = ?', [ evCount[k], k ]);
        }
        await conn.commit(); // 提交事务
      } catch (err) {
        // error, rollback
        await conn.rollback(); // 一定记得捕获异常后回滚事务！！
        return;
      }
      // 如果完成事务，清空缓存
      await this.app.redis.del('enjoy_view_count');
    }
  }

  return Main
}
