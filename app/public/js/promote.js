'use strict';

let saveFile = function(data, filename) {
  const save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
  save_link.href = data;
  save_link.target = '_blank';
  save_link.download = filename;

  const event = document.createEvent('MouseEvents');
  event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
  save_link.dispatchEvent(event);
};

[].forEach.call($('.main-content input[type=text]'), function(el) {
  // 此正则修正 input 浏览器返回值的 bug
  const [ , value ] = el.value.match(/([A-Za-z\d]+)$/)
  el.value = window.location.origin + '/enjoy/' + value
});
const clipboard = new Clipboard('.copy', {
  text (trigger) {
    return trigger.previousElementSibling.firstElementChild.value;
  }
});
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

