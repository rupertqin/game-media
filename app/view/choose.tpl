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
          <li :class="{ 'is-active': active_tab==0 }" @click="active_tab=0">
            <a>
              <span class="icon is-small"><i class="fa fa-image"></i></span>
              <span>推荐</span>
            </a>
          </li>
          <li :class="{ 'is-active': active_tab==1 }" @click="active_tab=1">
            <a>
              <span class="icon is-small"><i class="fa fa-music"></i></span>
              <span>最新</span>
            </a>
          </li>
          <li :class="{ 'is-active': active_tab==2 }" @click="active_tab=2">
            <a>
              <span class="icon is-small"><i class="fa fa-music"></i></span>
              <span>最热</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="panel" v-show="active_tab==0">
        <table class="table is-striped">
          <thead>
            <tr>
              <th>游戏图标</th>
              <th>游戏名称</th>
              <th>游戏简介</th>
              <th>获取推广包</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(game, index) in games" key="game.id">
              <td data-label="Name"><img v-bind:src="game.icon" /></td>
              <td data-label="Surname">${ game.app_name }</td>
              <td data-label="Alias">${ game.intro }</td>
              <td data-label="Alias">
                <a href="#" class="button" 
                  @click.prevent="choose(game.chosen || false , game.id, index )" 
                  v-bind:class="{ tertiary: !game.chosen }" 
                  v-bind:disabled="!!game.chosen">我要推广</a>
              </td>
            </tr>
          </tbody>
        </table>
        <nav class="pagination" role="navigation" aria-label="pagination">
          <ul class="pagination-list">
            {% if paginator.has_previous_page %}
            <li>
              <a href="/choose?p={{ paginator.previous_page }}" class="button pagination-previous"><前页</a>
            </li>
            {% endif %}
            {% if paginator.first_page != 1 %}
            <li>
              <a href="/choose" class="button pagination-link">首页</a>
            </li>
            {% endif %}
            {% for i in range(paginator.first_page, paginator.last_page+1) -%}
            <li>
              <a href="/choose?p={{ i }}" class="button pagination-link {{ 'is-current' if i == paginator.current_page  }}">{{ i }}</a>
            </li>
            {%- endfor %}
            {% if paginator.has_next_page %}
            <li>
              <a href="/choose?p={{ paginator.next_page }}" class="button pagination-next">后页></a>
            </li>
            {% endif %}
          </ul>
        </nav>
      </div>

      

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
  <script src="/public/vendor/js/vue.min.js"> </script>
  <script src="/public/js/choose.js"> </script>
{% endblock %}
