<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/public/vendor/css/bulma.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %} 艾擎 {% endblock %} - 艾游戏</title>
  </head>
  <body>
    <header>
      <div class="nav container is-hidden-touch">
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
                        {# <a href="/">login</a> #}
                      {% endif %}
                    </a>
                  </li>
                </ul>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="container">
          <div class="navbar-brand">
            <a class="navbar-item" href="/"> 首页 </a>
            <button class="button navbar-burger" data-target="navMenu">
              <span></span>
              <span></span>
              <span></span>
            </button>
          </div>
          <div class="navbar-menu" id="navMenu">
            <div class="navbar-start">
              <a class="navbar-item" href="/choose"> 选择游戏 </a>
              <a class="navbar-item" href="/promote"> 推广列表 </a>
              <a class="navbar-item" href="/income"> 我的收入 </a>
              <a class="navbar-item" href="/contact"> 联系我们 </a>
            </div>
          </div>
        </div>
      </nav>
    </header>
    {% block content %}{% endblock %}
    <footer class="footer">
      <div class="container">
        <p><a href="#">关于我们</a> | <a href="/contact">联系我们</a></p>
      </div>
    </footer>
    <script src="/public/js/common.js"></script>
    
    {% block footer %}{% endblock %}
  </body>
</html>