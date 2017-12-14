{% extends "./layout/wrapper.tpl" %}
{% block title %} 联系我们 {% endblock %}

{% block content %}
  <link rel="stylesheet" href="/public/vendor/fontawesome/web-fonts-with-css/css/fontawesome.min.css">
  <link rel="stylesheet" href="/public/vendor/fontawesome/web-fonts-with-css/css/fa-solid.min.css">
  <div class="main-content page-contact">
    <div class="banner">  <img src="/public/img/contact_banner.jpg" alt=""> </div>
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">联系我们</a></li>
        </ul>
      </nav>
      <div class="row board"></div>
      <div class="tabs is-toggle is-fullwidth">
        <ul>
          <li :class="{ 'is-active': active_tab==0 }" @click="active_tab=0">
            <a>
              <span class="icon is-small"></i></span>
              <span>公司介绍</span>
            </a>
          </li>
          <li :class="{ 'is-active': active_tab==1 }" @click="active_tab=1">
            <a>
              <span class="icon is-small"></i></span>
              <span>联系我们</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="panel" v-show="active_tab==0">
        <p class="panel-heading">
          关于我们
        </p>
        <div class="panel-block">
          艾游戏平台是一家专业的游戏联运平台，我们援用一批资深精英，整个团队专注于游戏运营推广产品开发，逐步形成一家以游戏运营技术研发及配套服务为主的高新技术企业。平台自身拥有庞大的游戏资源，有专业的运营团队进行支撑，保障合作流程的便捷顺畅，能够为渠道提供专业的合作指导，并用心提供完善周到的服务，让合作渠道无后顾之忧。并且支持多种支付方式，便捷结算渠道推广收入，轻松享受稳定回报。
        </div>
        <p class="panel-heading">
          平台优势
        </p>
        <div class="panel-block advantages">
          <div class="container">
          <div class="columns has-text-centered">
            <div class="column">
              <i class="fa fa-map-marker-alt bg_blue fa-5x"></i>
              <h3 class="title is-3">精准定位</h3>
            </div>
            <div class="column">
              <i class="fa fa-dollar-sign bg_red fa-5x"></i>
              <h3 class="title is-3">高付费率</h3>
            </div>
            <div class="column">
              <i class="fa fa-sync bg_yellow fa-5x"></i>
              <h3 class="title is-3">留存稳定</h3>
            </div>
            <div class="column">
              <i class="fa fa-rocket bg_green fa-5x"></i>
              <h3 class="title is-3">高ARPU</h3>
            </div>
          </div>
          </div>
        </div>
      </div>

      <div class="panel" v-show="active_tab==1">
        <p class="panel-heading">
          联系方式
        </p>
        <div class="panel-block">
          <div style="width: 100%;">
            <img src="//dowload.17kaiheiba.com/promote/qrcode.png" class="is-pulled-right" alt="">
            QQ: 215305143  <br>
            电话：15821093079 <br>
            邮箱： xuweiling@adxyun.com  
          </div>
        </div>
        <p class="panel-heading">
          公司地址
        </p>
        <div class="panel-block ">
          电话：021-66286566-8008 <br>
          地址：上海市静安区江场路299号中铁时代广场3号楼702室 <br>
          邮编： 200040
        </div> 
      </div>
    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/vendor/js/vue.min.js"> </script>
  <script src="/public/js/contact.js"> </script>
{% endblock %}
