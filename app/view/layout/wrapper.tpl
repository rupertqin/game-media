<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/public/vendor/fontawesome/web-fonts-with-css/css/fontawesome.min.css">
    <link rel="stylesheet" href="/public/vendor/fontawesome/web-fonts-with-css/css/fa-solid.min.css">
    <link rel="stylesheet" href="/public/vendor/css/bulma.css" />
    <link rel="stylesheet" href="/public/css/style.css" />
    <link rel="icon" href="/public/favicon.png" type="image/x-icon">
    <title>{% block title %} 艾擎 {% endblock %} - 艾游戏</title>
  </head>
  <body>
    <header>
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="container">
          <div class="navbar-brand">
            <a class="navbar-item logo" href="/"> <img src="/public/img/logo.jpg"></a>
            <button class="button navbar-burger" @click="isMenuShow = !isMenuShow" data-target="navMenu">
              <span></span>
              <span></span>
              <span></span>
            </button>
          </div>
          <div class="navbar-menu" id="navMenu" :class="{'is-active': isMenuShow}">
            <div class="navbar-end">
              <a class="navbar-item" href="/choose"> <span>选择游戏</span> </a>
              <a class="navbar-item" href="/promote"> <span>推广列表</span> </a>
              <a class="navbar-item" href="/income"> <span>我的收入</span> </a>
              <a class="navbar-item" href="/contact"> <span>联系我们</span> </a>
              <span class="navbar-item">
                <i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;
                {% if user %}
                  {{ user.username }} &nbsp;|&nbsp;&nbsp; <a href="/logout">logout</a>
                {% else %}
                  <a href="/" @click.prevent="showModal">会员登录</a> &nbsp;/&nbsp; <a href="/">厂商登录</a>
                {% endif %}
              </span>
            </div>
          </div>
        </div>
      </nav>
      <div id="login" class="modal" :class="{'is-active': isModalShow}" v-cloak>
        <div class="modal-background"></div>
        <div class="modal-content">
          <!-- Any other Bulma elements you want -->
          <div class="box">
            <form method="post" action="/login" class="mui-form">
              <div class="field">
                <label class="label">登录账号</label>
                <div class="control">
                  <input class="input" type="text" placeholder="用户名" name="name">
                </div>
              </div>

              <div class="field">
                <div class="control">
                  <input class="input" type="password" placeholder="密码" name="pwd">
                </div>
              </div>
              <div class="field is-grouped">
                <div class="control">
                  <button type="submit" class="button is-info">登录</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <button class="modal-close is-large" aria-label="close" @click="isModalShow = false"></button>
      </div>
    </header>
    {% block content %}{% endblock %}
    <footer class="footer">
      <div class="container">
        <p><a href="#">关于我们</a> | <a href="/contact">联系我们</a></p>
      </div>
    </footer>

    <script src="/public/vendor/js/vue.min.js"></script>
    <script src="/public/js/common.js"></script>
    
    {% block footer %}{% endblock %}
  </body>
</html>