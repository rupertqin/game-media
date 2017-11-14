<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="/public/css/mini.default.min.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{{ game.name }} - 游戏下载</title>
  </head>
  <body class="page-enjoy" >
    <div id="wrapper">

      <div class="content">
        <div class="container" style="text-align: center;">
          <h3 style="text-align: center;">{{ game.name }}<br/><br/><img src="{{ game.img }}"></h3>
          <div class="row btns">
            <div class="col-sm-6">
              {% if game.app_store_id and game.app_store_id != 0 %}
              <a href="https://itunes.apple.com/cn/app/id{{ game.app_store_id }}" class="apple">
                <h3><img src="/public/img/apple.jpg"></h3>
                <span>下载</span>
              </a>
              {% endif %}
            </div>
            <div class="col-sm-6">
              {% if game.apk %}
              <a href="{{ game.apk }}" class="android">
                <h3><img src="/public/img/android.jpg"></h3>
                <span>下载</span>
              </a>
              {% endif %}
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="/public/js/common.js"></script>
    <script src="/public/vendor/clipboard.js"></script>
    <script src="/public/js/enjoy.js"></script>
    
  </body>
</html>