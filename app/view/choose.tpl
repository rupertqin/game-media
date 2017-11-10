{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <p><strong>位置：</strong> 游戏列表 </p>
      <div class="tabs">
        <input type="radio" name="tab-group" id="tab1" checked aria-hidden="true">
        <label for="tab1" aria-hidden="true">推荐</label>
        <div class="tab-content clearfix" id="app">
          <h3>推荐</h3>
          <table class="">
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
                <td data-label="Name"><img v-bind:src="game.img" /></td>
                <td data-label="Surname">${ game.name }</td>
                <td data-label="Alias">${ game.intro }</td>
                <td data-label="Alias">
                  <a href="#" class="button" 
                    @click.prevent="choose(game.chosen || false , game.game_id, index )" 
                    v-bind:class="{ tertiary: !game.chosen }" 
                    v-bind:disabled="!!game.chosen">我要推广</a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <input type="radio" name="tab-group" id="tab2" aria-hidden="true">
        <label for="tab2" aria-hidden="true">最新</label>
        <div>
          <h3>最新</h3>
          <p>This is the second tab's content.</p>
        </div>
        <input type="radio" name="tab-group" id="tab3" aria-hidden="true">
        <label for="tab3" aria-hidden="true">最热</label>
        <div>
          <h3>最热</h3>
          <p>This is the third tab's content.</p>
        </div>
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
  <script src="/public/js/choose.js"> </script>
{% endblock %}
