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
  <body>
    <div class="" id="wrapper">

      <div class="content">
        <div class="container" style="text-align: center;">
          <h3 style="text-align: center;">{{ game.name }}<br><img src="{{ game.img }}"></h3>
          <div class="row">
            <div class="col-sm-6 copy">
              {% if game.app_store_id and game.app_store_id != 0 %}
              <a href="https://itunes.apple.com/cn/app/id{{ game.app_store_id }}">
                <h3>iOS 苹果下载</h3>
              </a>
              {% endif %}
            </div>
            <div class="col-sm-6">
              {% if game.apk %}
              <a href="{{ game.apk }}">
                <h3>Android 安卓下载</h3>
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