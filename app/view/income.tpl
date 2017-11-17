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
            <h2>{{ income.sumAllDay or 0 }}</h2>
            <p>累计收入</p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="green-box">
            <h2>{{ income.sumToday or 0 }}</h2>
            <p>今日收入</p>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="yellow-box">
            <h2>5000</h2>
            <p>累计提现</p>
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
      <div class="paginator">
        {% if paginator.has_previous_page %}
        <a href="/income?p={{ paginator.previous_page }}" class="button"><前页</a>
        {% endif %}
        {% if paginator.first_page != 1 %}
        <a href="/income" class="button">首页</a>
        {% endif %}
        {% for i in range(paginator.first_page, paginator.last_page+1) -%}
        <a href="/income?p={{ i }}" class="button  {{ 'primary' if i == paginator.current_page  }}">{{ i }}</a>
        {%- endfor %}
        {% if paginator.has_next_page %}
        <a href="/income?p={{ paginator.next_page }}" class="button">后页></a>
        {% endif %}
      </div>

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
