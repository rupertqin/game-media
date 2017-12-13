{% extends "./layout/wrapper.tpl" %}
{% block title %} 联系我们 {% endblock %}
{% block content %}
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
              <span class="icon is-small"><i class="fa fa-image"></i></span>
              <span>公司介绍</span>
            </a>
          </li>
          <li :class="{ 'is-active': active_tab==1 }" @click="active_tab=1">
            <a>
              <span class="icon is-small"><i class="fa fa-music"></i></span>
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
        <div class="panel-block ">
          <div class="container">
          <div class="columns has-text-centered">
            <div class="column">
              <img src="/public/img/contact_1.png" class="mb-1" alt="">
              <h3 class="title is-3">优质资源</h3>
              汇聚最新最热游戏<br>
              提供最佳合作方式
            </div>
            <div class="column">
              <img src="/public/img/contact_2.png" class="mb-1" alt="">
              <h3 class="title is-3">入驻零门槛</h3>
              任何渠道、公司<br>
              个人都可入驻<br>
              合作灵活提供最佳合作方式
            </div>
            <div class="column">
              <img src="/public/img/contact_3.png" class="mb-1" alt="">
              <h3 class="title is-3">高收入</h3>
              高分成<br>
              持续收益<br>
              实时结算快速到账
            </div>
            <div class="column">
              <img src="/public/img/contact_4.png" class="mb-1" alt="">
              <h3 class="title is-3">精准统计</h3>
              统计精准<br>
              推广数据实时展现 <br>
              账户信息透明
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
            <img src="/public/img/qr.png" class="is-pulled-right" alt="">
            QQ: 1234556789  <br>
            微信：123234323 <br>
            电话：021－87768889 <br>
            邮箱： wang@adxyun.com  
          </div>
        </div>
        <p class="panel-heading">
          公司地址
        </p>
        <div class="panel-block ">
          电话：021－87768889 <br>
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
