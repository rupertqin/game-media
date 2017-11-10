{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <p><strong>位置：</strong> 推广列表 </p>
      <div class="row">
        <div class="col-sm-3">
          <div class="blue-box">
            <h2>5000</h2>
            <p>帐户余额</p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="red-box">
            <h2>5000</h2>
            <p>累计收入</p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="green-box">
            <h2>5000</h2>
            <p>今日收入</p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="yellow-box">
            <h2>5000</h2>
            <p>累计体现</p>
          </div>
        </div>
      </div>

      <table>
        <caption>收入明细</caption>
        <thead>
          <tr>
            <th>时间</th>
            <th>游戏名称</th>
            <th>总充值</th>
            <th>分成金额</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td data-label="Name">Chad</td>
            <td data-label="Surname">Wilberts</td>
            <td data-label="Alias">MrOne</td>
            <td data-label="Alias">MrOne</td>
          </tr>
          <tr>
            <td data-label="Name">Adam</td>
            <td data-label="Surname">Smith</td>
            <td data-label="Alias">TheSmith</td>
            <td data-label="Alias">MrOne</td>
          </tr>
          <tr>
            <td data-label="Name">Sophia</td>
            <td data-label="Surname">Canderson</td>
            <td data-label="Alias">Candee</td>
            <td data-label="Alias">MrOne</td>
          </tr>
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
