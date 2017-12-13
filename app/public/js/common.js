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

function weixinMask() {
  const loadHtml = function() {
    loadStyleText();
    const div = document.createElement('div');
    div.id = 'weixin-tip';
    div.innerHTML = `<p>
      <i class="tip-close" style="color: #ccc;position: absolute;font-size:2em;top:0">&#10799;</i>
      <img src="/public/img/live_weixin.png" alt="微信打开"/>
      <img class="qr" src="/public/img/qr_wx.png" alt="微信打开"/>
    </p>`;
    const $close = div.querySelector('.tip-close')
    $close.on('click', () => div.outerHTML = '')
    document.body.appendChild(div);
  };

  const loadStyleText = function() {
    const cssText = `#weixin-tip{position: fixed; left:0; top:0; background: rgba(0,0,0,0.8); filter:
        alpha(opacity=80); width: 100%; height:100%; z-index: 100;} #weixin-tip p{text-a
        lign: center; margin-top: 10%; padding:0 5%;text-align: center;}
        .qr {width: 50%;}
        .close {position: absolute; left: 10px; top: 10px;color: #fff;font-size: 36px;}
        `;
    let style = document.createElement('style');
    style.rel = 'stylesheet';
    style.type = 'text/css';
    try {
      style.appendChild(document.createTextNode(cssText));
    } catch (e) {
      style.styleSheet.cssText = cssText; // ie9以下
    }
    const head = document.getElementsByTagName("head")[0]; // head标签之间加上style样式
    head.appendChild(style);
  };
  if (browser.versions.weixin) {
    loadHtml();
  }
}

(function() {
  // const [, name]location.pathname.match(/^\/([a-zA-z0-9]+)\/?/);
  [].some.call($('.navbar a'), function(el) {
    if (el.getAttribute('href') === location.pathname) {
      el.classList.add('active');
      return true;
    }
  });
}());


function toggleMenu() {
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach(function ($el) {
      $el.addEventListener('click', function () {

        // Get the target from the "data-target" attribute
        var target = $el.dataset.target;
        var $target = document.getElementById(target);

        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }
}

toggleMenu()
