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
      <nav class="pagination" role="navigation" aria-label="pagination">
        <ul class="pagination-list">
        {% if paginator.has_previous_page %}
        <a href="/income?p={{ paginator.previous_page }}" class="button pagination-link"><前页</a>
        {% endif %}
        {% if paginator.first_page != 1 %}
        <a href="/income" class="button">首页</a>
        {% endif %}
        {% for i in range(paginator.first_page, paginator.last_page+1) -%}
        <li>
          <a href="/income?p={{ i }}" class="button pagination-link {{ 'is-current' if i == paginator.current_page  }}">{{ i }}</a>
        </li>
        {%- endfor %}
        {% if paginator.has_next_page %}
        <a href="/income?p={{ paginator.next_page }}" class="button pagination-link">后页></a>
        {% endif %}
        </ul>
      </nav>

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
{% endblock %}
