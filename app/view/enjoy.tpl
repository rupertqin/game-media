<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/public/css/style.css" />
    <style>
      a {color: #333;}
      .column {width: 40%;display: inline-block;}
      img {max-width: 100%;}
    </style>
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{{ game.app_name }} - 游戏下载</title>
  </head>
  <body class="page-enjoy" >
    <div id="wrapper">

      <div class="content">
        <div class="container" style="text-align: center;">
          <br/>
          <h1 class="game-logo" style="text-align: center;"><img src="{{ game.icon }}"><br/>{{ game.app_name }}<br/></h1>
          <div class="columns is-mobile btns">
            {% if game.app_store_id and game.app_store_id != 0 %}
            <div class="column">
              <a href="https://itunes.apple.com/cn/app/id{{ game.app_store_id }}" class="apple">
                <h3><img src="/public/img/apple.jpg"></h3>
                <span>下载</span>
              </a>
            </div>
            {% endif %}
            {% if game.apk %}
            <div class="column">
              <a href="{{ game.apk }}" class="android">
                <h3><img src="/public/img/android.jpg"></h3>
                <span>下载</span>
              </a>
            </div>
            {% endif %}
          </div>
        </div>
      </div>
    </div>
    <script src="/public/js/common.js"></script>
    <script src="/public/vendor/clipboard.js"></script>
    <script src="/public/js/enjoy.js"></script>
    
  </body>
</html>