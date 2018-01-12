{% extends "layout/wrapper.tpl" %}

{% block title %} 首页 {% endblock %}
{% block content %}
  <div class="main-content page-index">
    <section class="has-text-centered banner mb-1"><img src="/public/img/index-banner.jpg" alt=""></section>
    <div class="container">
      <div class="game-recom">
        <div class="tabs">
          <ul>
            <li class="is-active"> <a><img src="/public/img/ico-hot.png" /> 游戏推荐</a></li>
          </ul>
        </div>
        <div class="my-columns has-text-centered">
          <div class="col blue"><a href="/enjoy/6N"> <img src="/public/img/game-recom-1.jpg" alt=""> <h3 class="">超越联盟3D</h3></a></div>
          <div class="col orange"><a href="/enjoy/zm"> <img src="/public/img/game-recom-2.jpg" alt=""> <h3>命运之塔</h3></a></div>
          <div class="col purple"><a href="/enjoy/xX"><img src="/public/img/game-recom-3.jpg" alt=""> <h3>钢铁奇兵</h3></a></div>
          <div class="col pink"><a href="/enjoy/GL"><img src="/public/img/game-recom-4.jpg" alt=""> <h3>你来嘛英雄</h3></a></div>
        </div>
      </div>

      <div class="panel">
        <p class="panel-heading">
          平台公告
        </p>
        <div class="panel-block">
          <div>
            <strong>［公告］</strong> 关于需要合作伙伴账号修改密码的通知
            <br>
            <small>各位亲爱的合作伙伴： 因目前平台中弱密码渠道账号较多，为保证您的账号安全，请修改您的密码。建议密码为最少六位，字母加数字，不重复且不连续。如有问题欢迎随时与相应商务合作经理联系，也可反馈问题至，感谢您对艾擎一如既往地支持与理解！</small>
            <br>
            <time>2017-11-18 18:16:34</time>
          </div>
        </div>
      </div>

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/js/index.js"> </script>
{% endblock %}