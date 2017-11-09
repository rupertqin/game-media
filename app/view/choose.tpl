{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="content" id="app">
    <div class="container">
      <p><strong>位置：</strong> 游戏列表 </p>
      <div class="tabs">
        <input type="radio" name="tab-group" id="tab1" checked aria-hidden="true">
        <label for="tab1" aria-hidden="true">推荐</label>
        <div class="tab-content clearfix">
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
              <tr>
                <td data-label="Name"><img src="https://www.youmi.net/static/img/hx2-front.1ccc5b6.png"></td>
                <td data-label="Surname">滑雪大冒险2</td>
                <td data-label="Alias">通过巧妙设置广告进入点——免费道具给予、免费复活机会、免费单局加成等等，给用户明确又实在的奖励，以让其能选择体验视频。从而最大程度地实现活跃流量的充分变现，并且营造了更好的游戏玩乐体验。</td>
                <td data-label="Alias"><a href="#" v-on:click="choose" class="button tertiary " disabled>我要推广</a></td>
              </tr>
              <tr>
                <td data-label="Name"><img src="https://www.youmi.net/static/img/run2.6ed73e5.png"></td>
                <td data-label="Surname">神庙逃亡2</td>
                <td data-label="Alias">中轻度的游戏玩家对单款产品的关注精力往往是有限的，通过定期欣赏视频广告而获得道具奖励的方式，能在碎片化时间内更多地激活长尾玩家，帮助提升产品的用户使用时长与停留时间，并取得有效的变现收益。</td>
                <td data-label="Alias"><a href="#" v-on:click="choose" class="button tertiary">我要推广</a></td>
              </tr>
              <tr>
                <td data-label="Name"><img src="https://www.youmi.net/static/img/bbqn2.2f0f43e.png"></td>
                <td data-label="Surname">爸爸去哪儿2</td>
                <td data-label="Alias">在游戏关卡结算页、主界面安排插屏广告的展示，并设定合理的出现条件适配使用情景，平衡出现节点的用户体验与关注力，做到更细致的流量挖掘利用，保障广告收益的合理稳定。</td>
                <td data-label="Alias"><a href="#" v-on:click="choose" class="button tertiary">我要推广</a></td>
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
  <script src="/public/js/app.js"> </script>
{% endblock %}
