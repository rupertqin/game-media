<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="/public/css/mini.default.min.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %}egg - {% endblock %}</title>
  </head>
  <body>
    <header>
      <div class="nav">
        <div class="container">
          <div class="col-sm row">
            <div class="col-sm-6">
              logo
            </div>
            <div class="col-sm-6">
              user info
            </div>
          </div>
        </div>
      </div>
      <div class="menu">
        <div class="container">
          <a href="#" class="logo">首页</a>
          <button>选择游戏</button>
          <a href="#" class="button">推广列表</a>
          <span>|</span>
          <button> 我的收入 </button>
          <a href="#" role="button">联系我们</a>
        </div> 
      
      </div>
    </header>
    {% block content %}{% endblock %}
  </body>
</html>