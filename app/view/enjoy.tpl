{% extends "./layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <h3>{{ game.name }}</h3>
          <img src="{{ game.img }}">
        </div>
        <div class="col-sm-6">
        </div>
      </div>
      <!-- Target -->
      <textarea id="bar">Mussum ipsum cacilds...111</textarea>

      <!-- Trigger -->
      <button class="btn" data-clipboard-action="cut" data-clipboard-target="#bar">
          Cut to clipboard
      </button>
    </div>
  </div>
{% endblock %}

{% block footer %}
<script src="/public/js/clipboard.js"></script>
<script src="/public/js/promotelink.js"></script>
{% endblock %}
