'use strict';

weixinMask();

const clip = new Clipboard('.button-group', {
  text() {
    const [ , id ] = window.location.pathname.match(/\/([a-z0-9]+)$/);
    return 'ag_activate:' + id;
  },
});

$$('.btns .apple, .btns .android').on('click', function(e) {
  e.preventDefault();

});
