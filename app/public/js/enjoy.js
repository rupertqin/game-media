'use strict';

weixinMask();

const clip = new Clipboard('body', {
  text() {
    const [ , id ] = window.location.pathname.match(/\/([a-zA-Z0-9]+)$/);
    return 'ag_activate:' + id;
  },
});

// $$('.btns .apple, .btns .android').on('click', function(e) {
//   e.preventDefault();

// });
