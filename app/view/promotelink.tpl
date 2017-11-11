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
    </div>
  </div>
{% endblock %}

{% block footer %}
{% endblock %}
