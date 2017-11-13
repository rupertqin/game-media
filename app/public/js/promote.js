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

let saveFile = function(data, filename) {
  const save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
  save_link.href = data;
  save_link.download = filename;

  const event = document.createEvent('MouseEvents');
  event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
  save_link.dispatchEvent(event);
};

[].forEach.call($('input[type=text]'), function(el) {
  el.value = window.location.origin + '/enjoy/' + el.value;
});
const clipboard = new Clipboard('.copy');
clipboard.on('success', function(e) {
  // e.clearSelection();
  alert('已复制成功！');
});
$('.button.primary').on('click', function(e) {
  e.preventDefault();
  let dataUrl = QRCode.generatePNG(`${window.location.origin}/enjoy/${e.target.dataset.id}`, { ecclevel: 'M' });
  // dataUrl = dataUrl.replace('image/png', 'image/octet-stream');
  // const = $$('body')
  // $$('body').innerHTML = `<img src=${url} />`;
  // window.onpopstate = function() {
  //   console.log("location: " + document.location + ", state: " + JSON.stringify(event.state));
  // };
  // history.pushState({ name: 'qr' }, '页面标题', '#qr');

  // $$('body').insertAdjacentHTML('beforebegin', `<img src=${url} />`);
  const filename = (new Date()).getTime() + '.png';
  saveFile(dataUrl, filename);

  // window.location = url;

  // var iframe = "<iframe width='100%' height='100%' src='" + url + "'></iframe>"
  // var x = window.open();
  // x.document.open();
  // x.document.write(iframe);
  // x.document.close();
});

