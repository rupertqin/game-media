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
          {% for po in payOrders %}
          <tr>
            <td data-label="Name">{{ po.pay_at }}</td>
            <td data-label="Surname">{{ po.app_name }}</td>
            <td data-label="Alias">{{ po.price }}</td>
            <td data-label="Alias">{{ po.price * 0.7 }}</td>
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
      payOrders: "{{ helper.stringify(PayOrders) }}",
      isLogin: {{ ctx.session.user != null }}
    }
  </script>
  <script src="/public/vendor/app.js"> </script>
{% endblock %}
