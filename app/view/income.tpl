{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="main-content income-page">
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">我的收入</a></li>
        </ul>
      </nav>

      <div class="columns board">
        <div class="column">
          <div class="blue-box">
            <h2 class="is-size-2">{{ user.money }}</h2>
            <p>帐户余额</p>
          </div>
        </div>
        <div class="column">
          <div class="red-box">
            <h2 class="is-size-2">{{ user.total_income }}</h2>
            <p>累计收入</p>
          </div>
        </div>
        <div class="column">
          <div class="green-box">
            <h2 class="is-size-2">{{ income.sumToday or 0 }}</h2>
            <p>今日收入</p>
          </div>
        </div>
        <div class="column">
          <div class="yellow-box">
            <h2 class="is-size-2">{{ user.total_encashment }}</h2>
            <p>累计提现</p>
          </div>
        </div>
      </div>
      <h1 class="title has-text-centered">收入明细</h1>
      <table class="table is-bordered">
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
            <td data-label="Alias">{{ po.price | formatCent }}</td>
            <td data-label="Alias">{{ po.price | getFromProfit | formatCent }}</td>
          </tr>
          {% endfor %}
        </tbody>
      </table>
      
      {% import "./component/pagination.tpl" as pagination %}
      {{ pagination.paginator('income', helper, query, paginator) }}

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script> 
    var renderData = { 
      payOrders: "{{ PayOrders | stringify }}",
      isLogin: {{ ctx.session.user != null }}
    }
  </script>
{% endblock %}
