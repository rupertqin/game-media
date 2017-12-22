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
              {% if user.isAP %}
              <a class="navbar-item" href="/app-report"> <span>报表</span> </a>
              {% else %}
              <a class="navbar-item" href="/choose"> <span>选择游戏</span> </a>
              <a class="navbar-item" href="/promote"> <span>推广列表</span> </a>
              <a class="navbar-item" href="/income"> <span>我的收入</span> </a>
              {% endif %}
              <a class="navbar-item" href="/contact"> <span>联系我们</span> </a>
              <span class="navbar-item">
                <i class="fa fa-user" aria-hidden="true"></i>
                {% if user %}
                  {{ user.username or user.name }} &nbsp;|&nbsp;&nbsp; <a href="/logout">登出</a>
                {% else %}
                  <a href="/" @click.prevent="isModalShow = true">登录</a> 
                {% endif %}
              </span>
            </div>
          </div>
        </div>
      </nav>
      <div id="login" class="modal login is-active" v-if="isModalShow" v-cloak>
        <div class="modal-background" @click="reset"></div>
        <div class="modal-content">
          <div class="box">
            <form method="post" action="/login" @submit.prevent="login('/login')" class="mui-form">
              <div class="field">
                <label class="label">会员登录</label>
                <div class="control">
                  <input class="input" type="text" placeholder="用户名" v-focus v-model="name">
                </div>
              </div>

              <div class="field">
                <div class="control">
                  <input class="input" type="password" placeholder="密码" v-model="password">
                </div>
              </div>
              <div class="field is-clearfix">
                <div class="control is-pulled-right">
                  <a class="button is-text is-size-7" @click.prevent="switchModal">切换厂商</a>
                </div>
                <div class="control is-pulled-left">
                  <button type="submit" class="button is-info">登录</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <button class="modal-close is-large" aria-label="close" @click="reset"></button>
      </div>
      <div id="login-ap" class="modal login is-active" v-if="isAPModalShow" v-cloak>
        <div class="modal-background" @click="reset"></div>
        <div class="modal-content">
          <div class="box">
            <form method="post" action="/login-ap" @submit.prevent="login('/login-ap')" class="mui-form">
              <div class="field">
                <label class="label">厂商登录</label>
                <div class="control">
                  <input class="input" key="a" type="text" placeholder="用户名" v-focus v-model="name">
                </div>
              </div>

              <div class="field">
                <div class="control">
                  <input class="input" type="password" placeholder="密码" v-model="password">
                </div>
              </div>
              <div class="field is-clearfix">
                <div class="control is-pulled-right">
                  <a class="button is-text is-size-7" @click.prevent="switchModal">切换会员</a>
                </div>
                <div class="control is-pulled-left">
                  <button type="submit" class="button is-info">登录</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <button class="modal-close is-large" aria-label="close" @click="reset"></button>
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