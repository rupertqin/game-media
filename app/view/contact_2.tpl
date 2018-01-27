{% extends "./layout/wrapper.tpl" %}
{% block title %} 关于我们 {% endblock %}

{% block content %}
  <div class="main-content page-contact">
    <div class="banner has-text-centered">  <img src="/public/img/contact_banner.jpg" alt=""> </div>
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">关于我们</a></li>
        </ul>
      </nav>

      <div>
        邮箱：fengjie@17kaiheiba.com <br>
        地址：上海市静安区江场西路299弄中铁时代广场3号楼 702室 客服：021-66286566
      </div>
    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/js/contact.js"> </script>
{% endblock %}
