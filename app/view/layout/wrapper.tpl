<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/public/css/mini.default.min.css" />
    <link rel="stylesheet" href="/public/vendor/css/bulma.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %} 艾擎 {% endblock %} - 艾游戏</title>
  </head>
  <body>
    <header>
      <label for="drawer-checkbox" class="button drawer-toggle"></label>
      
      <div class="nav container">
        <table>
          <tbody>
            <tr class="mui--appbar-height">
              <td class="mui--text-title"><a href="/" class="logo"> <img src="/public/img/logo.jpg"></a></td>
              <td class="mui--text-right" style="vertical-align: middle;">
                <ul class="mui-list--inline mui--text-body2 has-text-right">
                  <li>
                    <a href="#">
                      <i class="fa fa-user" aria-hidden="true"></i> 
                      {% if user %}
                        {{ user.username }} | <a href="/logout">logout</a>
                      {% else %}
                        <a href="/">login</a>
                      {% endif %} 
                    </a>
                  </li>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="container">
          <div class="col-sm row">
            <div class="col-sm-6">
              
            </div>
            <div class="col-sm-6 middle flex-right"></div>
          </div>
        </div>
      </div>
      <div class="menu mui-appbar mui--z1">
        <div class="container">
          <div class="col-sm row">
            <a href="/" class="button">首页</a>
            <a href="/choose" class="button">选择游戏</a>
            <a href="/promote" class="button">推广列表</a>
            <a href="/income" class="button">我的收入</a>
            <a href="/contact" class="button">联系我们</a>
          </div>
        </div> 
      
      </div>
    </header>
    {% block content %}{% endblock %}
    <footer class="">
      <div class="container">
        <p><a href="#">关于我们</a> | <a href="#">联系我们</a></p>
      </div>
    </footer>
    <script src="/public/js/common.js"></script>
    
    {% block footer %}{% endblock %}
  </body>
</html>