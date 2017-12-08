{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="main-content">
    <div class="container">
      <p><strong>位置：</strong> 推广列表 </p>

      <table>
        <caption>我的推广</caption>
        <thead>
          <tr>
            <th>推广产品</th>
            <th>付费用户</th>
            <th>玩家总消费</th>
            <th>总收入</th>
            <th>推广链接</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          {% for game in games %}
          <tr>
            <td data-label="Name">{{ game.app_name }}</td>
            <td data-label="Surname">Wilberts</td>
            <td data-label="Alias">5000</td>
            <td data-label="Alias">5000</td>
            <td data-label="Alias">
              <p><input type=text value="{{ game.hashid }}" readonly></p>
              <button class="copy">复制</button>
            </td>
            <td data-label="Alias">
              <a href="/enjoy/{{ game.hashid }}" class="button tertiary">预览推广页</a><br/>
              <a href="" data-id={{ game.hashid }} class="button primary">下载推广二维码</a>
            </td>
          </tr>
          {% endfor %}
        </tbody>
      </table>

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script src="/public/vendor/qr.js"> </script>
  <script src="/public/vendor/clipboard.js"> </script>
  <script src="/public/js/promote.js"> </script>
{% endblock %}
