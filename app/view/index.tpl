{% extends "layout/wrapper.tpl" %}

{% block content %}
  <div class="main-content index-page">
    <div class="container">
      <div class="columns">
        <div class="column is-three-quarters">
          <img src="/public/img/slide.jpg" class="media">
        </div>
        <div class="column is-one-quarter">
          {% if not user %}
            <form method="post" action="/login" class="mui-form">
              <div class="field">
                <label class="label">用户名</label>
                <div class="control">
                  <input class="input" type="text" placeholder="用户名" name="name">
                </div>
              </div>

              <div class="field">
                <label class="label">密码</label>
                <div class="control">
                  <input class="input" type="password" placeholder="密码" name="pwd">
                </div>
              </div>
              <div class="mui-textfield"><button type="submit" class="mui-btn mui-btn--raised">登录</button></div>
            </form>
          {% else %}
            {{ user.username }} <br/>
            {{ user.realname }} <br/>
            {{ user.last_login_at }} <br/>
          {% endif %}
        </div>
      </div>

      <div class="panel">
        <p class="panel-heading">
          平台公告
        </p>
        <div class="panel-block" v-for="n in 4">
          <div>
            <strong>［公告］</strong> 关于需要合作伙伴账号修改密码的通知
            <br>
            <small>各位亲爱的合作伙伴： 因目前平台中弱密码渠道账号较多，为保证您的账号安全，请修改您的密码。建议密码为最少六位，字母加数字，不重复且不连续。如有问题欢迎随时与相应商务合作经理联系，也可反馈问题至，感谢您对UC一如既往地支持与理解！</small>
            <br>
            <time>2016-01-18 18:16:34</time>
          </div>
        </div>
      </div>

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/vendor/js/vue.min.js"> </script>
  <script src="/public/js/index.js"> </script>
{% endblock %}