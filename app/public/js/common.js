'use strict';

const $ = document.querySelectorAll.bind(document);
const $$ = document.querySelector.bind(document);
Element.prototype.on = Element.prototype.addEventListener;
NodeList.prototype.on = function (event, fn) {
  []['forEach'].call(this, function (el) {
    el.on(event, fn);
  });
  return this;
};
const browser={
  versions: (() => {
    const u = navigator.userAgent, app = navigator.appVersion;
    return {
      trident: u.indexOf('Trident') > -1, // IE内核
      presto: u.indexOf('Presto') > -1, // opera内核
      webKit: u.indexOf('AppleWebKit') > -1, // 苹果、谷歌内核
      gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') === -1, // 火狐内核
      mobile: !!u.match(/AppleWebKit.*Mobile.*/), // 是否为移动终端
      ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), // ios终端
      android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, // android终端或者uc浏览器
      iPhone: u.indexOf('iPhone') > -1, // 是否为iPhone或者QQHD浏览器
      iPad: u.indexOf('iPad') > -1, // 是否iPad
      webApp: u.indexOf('Safari') === -1, // 是否web应该程序，没有头部与底部
      weixin: u.indexOf('MicroMessenger') > -1, // 是否微信 （2015-01-22新增）
      qq: u.match(/\sQQ/i) === ' qq', // 是否QQ
    };
  })(),
  language: (navigator.browserLanguage || navigator.language).toLowerCase(),
};

(function() {
  // const [, name]location.pathname.match(/^\/([a-zA-z0-9]+)\/?/);
  [].some.call($('.navbar a'), function(el) {
    if (el.getAttribute('href') === location.pathname) {
      el.classList.add('active');
      return true;
    }
  });
}());

(function header() {
  Vue.directive('focus', {
    // 当被绑定的元素插入到 DOM 中时……
    inserted(el) {
      // 聚焦元素
      el.focus()
    },
  })

  const headerVM = new Vue({
    delimiters: [ '${', '}' ],
    el: 'header',
    data: {
      isModalShow: false,
      loginType: 'common',
      isMenuShow: false,
      name: '',
      password: '',
    },
    computed: {
      loginTitle() {
        return this.loginType === 'common' ? '会员登录' : '厂商登录'
      },
      submitPath() {
        return this.loginType === 'common' ? '/login' : '/login-ap'
      },
    },
    methods: {
      showModal() {
        this.isModalShow = true
      },
      login() {
        if (!this.name) {
          return alert('用户名不正确')
        }
        if (!this.password) {
          return alert('密码不正确')
        }
        fetch(this.submitPath, {
          method: 'POST',
          headers: {
            'Content-type': 'application/json',
          },
          // 带上 session
          credentials: 'include',
          body: JSON.stringify({ name: this.name, password: this.password }),
        }).then(res => {
          if (res.status === 200) {
            location.reload()
          } else {
            alert('密码不正确!')
          }
        })
      },
      reset() {
        this.name = this.password = ''
        this.isModalShow = false
      },
    },
  })

}());

