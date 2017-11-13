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
        <div class="container">
          <div class="row">
            <div class="col-sm-6 copy">
              <h3>{{ game.name }}</h3>
              <img src="{{ game.img }}">
            </div>
            <div class="col-sm-6">
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="/public/js/vue.js"></script>
    <script src="/public/js/clipboard.js"></script>
    <script src="/public/js/enjoy.js"></script>
    
  </body>
</html>