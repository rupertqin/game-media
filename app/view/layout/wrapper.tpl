<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="/public/css/mini.default.min.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %} 北艾 - {% endblock %}</title>
  </head>
  <body>
    <div class="" id="wrapper">
      <header>
        <label for="drawer-checkbox" class="button drawer-toggle"></label>
        
        <div class="nav">
          <div class="container">
            <div class="col-sm row">
              <div class="col-sm-6">
                <img src="/public/img/logo.png">
              </div>
              <div class="col-sm-6 middle flex-right">
                {% if user %}
                  {{ user.username }} | <a href="/logout">logout</a>
                {% else %}
                  <a href="/">login</a>
                {% endif %} 
              </div>
            </div>
          </div>
        </div>
        <div class="menu">
          <div class="container">
            <a href="/" class="button">首页</a>
            <a href="/choose" class="button">选择游戏</a>
            <a href="/promote" class="button">推广列表</a>
            <a href="/income" class="button">我的收入</a>
            <a href="/contact" class="button">联系我们</a>
          </div> 
        
        </div>
      </header>

      <input type="checkbox" id="drawer-checkbox">
      <div class="drawer">
        <nav>
          <label for="drawer-checkbox" class="close"></label>
          <input type="checkbox" id="drawer-checkbox">
          <a href="/" class="">首页</a>
          <a href="/choose" class="">选择游戏</a>
          <a href="/promote" class="">推广列表</a>
          <a href="/income" class="">我的收入</a>
          <a href="/contact" role="">联系我们</a>
        </nav>
      </div>
      
      {% block content %}{% endblock %}
    </div>
      <footer class="">
        <div class="container">
          <p><a href="#">关于我们</a> | <a href="#">联系我们</a></p>
        </div>
      </footer>
    <script src="/public/js/common.js"></script>
    
    {% block footer %}{% endblock %}
  </body>
</html>