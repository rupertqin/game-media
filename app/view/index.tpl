{% extends "layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <div class="col-sm row">
        <div class="col-sm-7">
          {% for item in list %}
            <div class="item">
              <a href="{{ item.url }}">{{ item.title }}</a>
            </div>
          {% endfor %}
        </div>
        <div class="col-sm-5">
          <form method="post" action="/login">
            <fieldset>
              <legend>Login</legend>
              <div class="input-group fluid"><label for="username2">Username</label> <input type="text" value="" name="name" placeholder="username"></div>
              <div class="input-group fluid"><label for="pwd2">Password</label> <input type="password" value="" name="pwd" placeholder="password"></div>
              <div class="input-group fluid"> <input type="submit" value="Login" id="pwd2"></div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
{% endblock %}