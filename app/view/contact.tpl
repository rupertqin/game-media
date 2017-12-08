{% extends "./layout/wrapper.tpl" %}
{% block title %} 联系我们 {% endblock %}
{% block content %}
  <div class="main-content income-page">
    <div class="container">
      <p><strong>位置：</strong> 联系我们 </p>
      <div class="row board"></div>
      <div class="tabs is-toggle is-fullwidth">
        <ul>
          <li class="is-active">
            <a>
              <span class="icon is-small"><i class="fa fa-image"></i></span>
              <span>公司介绍</span>
            </a>
          </li>
          <li>
            <a>
              <span class="icon is-small"><i class="fa fa-music"></i></span>
              <span>联系我们</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="panel">
        <p class="panel-heading">
          关于我们
        </p>
        <div class="panel-block">
          专注提供游戏行业技术产品及服务9年，为手游、H5游戏、页游等产业
提供专业、可扩展的游戏运营技术解决方案。主营业务包括手游联运平台系统、H5联运平台系统、手游发行系统、H5发行系统、 
棋牌游戏定制开发、游戏行业资质办理等产品及服务。作为游戏行业技术服务解决方案专家，溪谷软件产品将运营文化产业和用 
户体验相结合链接上下游市场资源，致力于重塑并优化产业生态和服务形式，目前已服务于国内外多家企业。
        </div>
        <p class="panel-heading">
          平台优势
        </p>
        <div class="panel-block">
          <div class="columns">
            <div class="column">
              First column
            </div>
            <div class="column">
              Second column
            </div>
            <div class="column">
              Third column
            </div>
            <div class="column">
              Fourth column
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}

{% block footer %}
{% endblock %}
