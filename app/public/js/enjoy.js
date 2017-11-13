'use strict';

const clip = new Clipboard('.copy', {
  text() {
    const [, id] = window.location.pathname.match(/\/([a-z0-9]+)$/);
    return 'ag_activate:' + id;
  },
});

$$('.copy').on('click', function() {
  weixinMask();
});
