'use strict';

const Subscription = require('egg').Subscription;

class UpdateCache extends Subscription {
  // 通过 schedule 属性来设置定时任务的执行间隔等配置
  static get schedule() {
    return {
      interval: '1h', // 1 分钟间隔
      type: 'worker', // 指定所有的 worker 都需要执行
      // immediate: true,
    };
  }

  // subscribe 是真正定时任务执行时被运行的函数
  async subscribe() {
    const evCount = await this.app.redis.hgetall('enjoy_view_count');
    if (Object.getOwnPropertyNames(evCount).length === 0) return;
    for (const k in evCount) {
      await this.app.mysql.query('update promote_link set view_count=view_count+? where id = ?', [ evCount[k], k ]);
    }
    await this.app.redis.del('enjoy_view_count');
  }
}

module.exports = UpdateCache;
