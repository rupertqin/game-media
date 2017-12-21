{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="main-content page-choose">
    <div class="container">
      <nav class="breadcrumb" aria-label="breadcrumbs">
        <ul>
          <li>位置：</li>
          <li class="is-active"><a href="#" aria-current="page">游戏列表</a></li>
        </ul>
      </nav>

      <div class="tabs is-toggle is-fullwidth">
        <ul>
          <li class="{{ 'is-active' if query.type == 'recommend' }}">
            <a href="?type=recommend">
              <span class="icon is-small"></span>
              <span>推荐 {{gameLen}}</span>
            </a>
          </li>
          <li class="{{ 'is-active' if query.type == 'new' }}">
            <a href="?type=new">
              <span class="icon is-small"></span>
              <span>最新</span>
            </a>
          </li>
          <li class="{{ 'is-active' if query.type == 'hot' }}">
            <a href="?type=hot">
              <span class="icon is-small"></span>
              <span>最热</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="panel" v-cloak>
        <table class="table is-striped">
          <thead>
            <tr>
              <th>游戏图标</th>
              <th>游戏名称</th>
              <th>获取推广包</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(game, index) in games" key="game.id">
              <td data-label="Name"><img v-bind:src="game.icon" /></td>
              <td data-label="Surname">${ game.app_name }</td>
              <td data-label="Alias">
                <a href="#" class="button" 
                  @click.prevent="choose(game.chosen || false , game.id, index )" 
                  v-bind:class="{ 'is-success': !game.chosen }" 
                  v-bind:disabled="!!game.chosen">我要推广</a>
              </td>
            </tr>
          </tbody>
        </table>

        {% import "./component/pagination.tpl" as pagination %}
        {{ pagination.paginator('app-report', helper, query, paginator) }}
      </div>

      

    </div>
  </div>
{% endblock %}

{% block footer %}
  <script> 
    var renderData = { 
      games: {{ games | stringify | safe }},
      isLogin: {{ ctx.session.user != null }}
    }
  </script>
  <script src="/public/js/choose.js"> </script>
{% endblock %}
