{% extends "./layout/wrapper.tpl" %}

{% block title %} 推广列表 {% endblock %}
{% block content %}
  <div class="main-content page-promote">
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">推广列表</a></li>
        </ul>
      </nav>

      <h1 class="title has-text-centered">我的推广</h1>
      <table class="table is-bordered">
        <thead>
          <tr>
            <th>推广产品</th>
            {# <th>付费用户</th>
            <th>玩家总消费</th>
            <th>总收入</th> #}
            <th>推广链接</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          {% for game in games %}
          <tr>
            <td data-label="Name">{{ game.app_name }}</td>
            {# <td data-label="Surname">Wilberts</td>
            <td data-label="Alias">5000</td>
            <td data-label="Alias">5000</td> #}
            <td data-label="Alias">
              <p><input type=text value="{{ game.hashid }}" readonly></p>
              <button class="copy button">复制</button>
            </td>
            <td data-label="Alias">
              <a href="/enjoy/{{ game.hashid }}" class="button is-success width-160">预览推广页</a><br/>
              <a href="" data-id={{ game.hashid }} class="button is-link width-160">下载推广二维码</a>
            </td>
          </tr>
          {% endfor %}
        </tbody>
      </table>
      
      {% import "./component/pagination.tpl" as pagination %}
      {{ pagination.paginator('promote', helper, query, paginator) }}
    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/vendor/qr.js"> </script>
  <script src="/public/vendor/clipboard.js"> </script>
  <script src="/public/js/promote.js"> </script>
{% endblock %}
