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
                <h3>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M247.2 137.6c-6.2 1.9-15.3 3.5-27.9 4.6 1.1-56.7 29.9-96.6 88-110.1 9.3 41.6-26.1 94.1-60.1 105.5zm121.3 72.7c6.4-9.4 16.6-19.9 30.6-31.7-22.3-27.6-48.1-44.3-85.1-44.3-35.4 0-65.2 18.2-87 18.2-18.5 0-51.9-16.1-84.5-16.1-69.6 0-106.5 68.1-106.5 139C36 354.2 95.7 480 156.2 480c23.8 0 45.2-18 73.5-18 29.3 0 52.8 17.2 80.3 17.2 46 0 88.6-77.5 102-119.7-46.8-14.3-84.4-90.2-43.5-149.2z"/></svg>
                </h3>
                <span>下载</span>
              </a>
            </div>
            {% endif %}
            {% if game.apk %}
            <div class="column">
              <a href="{{ game.apk }}" class="android">
                <h3>
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M89.6 204.5v115.8c0 15.4-12.1 27.7-27.5 27.7-15.3 0-30.1-12.4-30.1-27.7V204.5c0-15.1 14.8-27.5 30.1-27.5 15.1 0 27.5 12.4 27.5 27.5zm10.8 157c0 16.4 13.2 29.6 29.6 29.6h19.9l.3 61.1c0 36.9 55.2 36.6 55.2 0v-61.1h37.2v61.1c0 36.7 55.5 36.8 55.5 0v-61.1h20.2c16.2 0 29.4-13.2 29.4-29.6V182.1H100.4v179.4zm248-189.1H99.3c0-42.8 25.6-80 63.6-99.4l-19.1-35.3c-2.8-4.9 4.3-8 6.7-3.8l19.4 35.6c34.9-15.5 75-14.7 108.3 0L297.5 34c2.5-4.3 9.5-1.1 6.7 3.8L285.1 73c37.7 19.4 63.3 56.6 63.3 99.4zm-170.7-55.5c0-5.7-4.6-10.5-10.5-10.5-5.7 0-10.2 4.8-10.2 10.5s4.6 10.5 10.2 10.5c5.9 0 10.5-4.8 10.5-10.5zm113.4 0c0-5.7-4.6-10.5-10.2-10.5-5.9 0-10.5 4.8-10.5 10.5s4.6 10.5 10.5 10.5c5.6 0 10.2-4.8 10.2-10.5zm94.8 60.1c-15.1 0-27.5 12.1-27.5 27.5v115.8c0 15.4 12.4 27.7 27.5 27.7 15.4 0 30.1-12.4 30.1-27.7V204.5c0-15.4-14.8-27.5-30.1-27.5z"/></svg>
                </h3>
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