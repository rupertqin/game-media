{% extends "./layout/wrapper.tpl" %}

{% block title %} 报表 {% endblock %}
{% block content %}
  <div class="main-content page-choose">
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">报表</a></li>
        </ul>
      </nav>

      <div class="panel">
        <table class="table is-striped">
          <thead>
            <tr>
              <th>时间</th>
              <th></th>
              <th>游戏名称</th>
              <th>充值人数</th>
              <th>新增用户数</th>
              <th>充值金额</th>
              <th>分成金额</th>
            </tr>
          </thead>
          <tbody>
            {% for item in items %}
            <tr>
              <td data-label="Surname">{{ item.date | YYYYMMDD }}</td>
              <td data-label="Name"><img src={{ item.icon }} /></td>
              <td data-label="Surname">{{ item.app_name }}</td>
              <td data-label="Surname">{{ item.recharge_num }}</td>
              <td data-label="Surname">{{ item.reg_num or 0 }}</td>
              <td data-label="Surname">{{ item.price | round(2) }}</td>
              <td data-label="Surname">{{ item.price | getFromProfit(user.rebate_ratio) | round(2) }}</td>
            </tr>
            {% endfor %}
          </tbody>
        </table>

        {% import "./component/pagination.tpl" as pagination %}
        {{ pagination.paginator('app-report', helper, query, paginator) }}
      </div>
    </div>
  </div>
{% endblock %}

{% block footer %}

{% endblock %}
