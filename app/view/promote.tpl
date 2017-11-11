{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
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
            <td data-label="Name">{{ game.name }}</td>
            <td data-label="Surname">Wilberts</td>
            <td data-label="Alias">5000</td>
            <td data-label="Alias">5000</td>
            <td data-label="Alias">
              <p>{{ game.promote_link }}</p>
              <button class="">复制</button>
            </td>
            <td data-label="Alias">
              <a href="/promotelink/{{ game.url }}" class="button tertiary">预览推广页</a><br/>
              <a href="" class="button primary">下载推广二维码</a>
            </td>
          </tr>
          {% endfor %}
        </tbody>
      </table>

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script> 
    var renderData = { 
      games: "{{ helper.stringify(games) }}",
      isLogin: {{ ctx.session.user != null }}
    }
  </script>
  <script src="/public/js/app.js"> </script>
{% endblock %}
