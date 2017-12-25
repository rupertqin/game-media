{% extends "layout/wrapper.tpl" %}

{% block title %} 首页 {% endblock %}
{% block content %}
  <div class="main-content page-index">
    <section class="has-text-centered banner mb-1"><img src="/public/img/index-banner.jpg" alt=""></section>
    <div class="container">

      <div class="panel">
        <p class="panel-heading">
          平台公告
        </p>
        {% for i in range(0, 5) -%}
        <div class="panel-block">
          <div>
            <strong>［公告］</strong> 关于需要合作伙伴账号修改密码的通知
            <br>
            <small>各位亲爱的合作伙伴： 因目前平台中弱密码渠道账号较多，为保证您的账号安全，请修改您的密码。建议密码为最少六位，字母加数字，不重复且不连续。如有问题欢迎随时与相应商务合作经理联系，也可反馈问题至，感谢您对UC一如既往地支持与理解！</small>
            <br>
            <time>2016-01-18 18:16:34</time>
          </div>
        </div>
        {%- endfor %}
      </div>

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/js/index.js"> </script>
{% endblock %}