{% if ctx.session.user %}
  {% set user = ctx.session.user %}
{% endif %}

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
    <div class="" id="wrapper">
      <header>
        <label for="drawer-checkbox" class="button drawer-toggle"></label>
        
        <div class="nav">
          <div class="container">
            <div class="col-sm row">
              <div class="col-sm-6">
                logo
              </div>
              <div class="col-sm-6">
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
            <a href="/" class="logo">首页</a>
            <a href="/choose" class="button">选择游戏</a>
            <a href="#" class="button">推广列表</a>
            <a href="#" class="button">我的收入</a>
            <a href="#" class="button">联系我们</a>
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
          <a href="#" class="">推广列表</a>
          <a href="#" class="">我的收入</a>
          <a href="#" role="">联系我们</a>
        </nav>
      </div>
      
      {% block content %}{% endblock %}
      <footer class="">
        <div class="container">
          <p><a href="#">关于我们</a> | <a href="#">联系我们</a></p>
        </div>
      </footer>
    </div>
    <script src="/public/js/vue.js"></script>
    
    {% block footer %}{% endblock %}
  </body>
</html>