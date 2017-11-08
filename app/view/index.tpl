{% extends "layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <div class="col-sm row">
        <div class="col-sm-7">
          <div class="card">
            <img src="https://placehold.it/800x600" class="section media">
            <div class="section double-padded"><p>Content</p></div>
            <div class="section dark"><p>Content</p></div>
          </div>
          {% for item in list %}
            <div class="item">
              <a href="{{ item.url }}">{{ item.title }}</a>
            </div>
          {% endfor %}
        </div>
        <div class="col-sm-5">
          {% if user == false %}
            <form method="post" action="/login">
              <fieldset>
                <legend>Login</legend>
                <div class="input-group fluid"><label for="username2">Username</label> <input type="text" value="" name="name" placeholder="username"></div>
                <div class="input-group fluid"><label for="pwd2">Password</label> <input type="password" value="" name="pwd" placeholder="password"></div>
                <div class="input-group fluid"> <input type="submit" value="Login" id="pwd2"></div>
              </fieldset>
            </form>
          {% endif %}
        </div>
      </div>
      <div class="tabs">
        <input type="radio" name="tab-group" id="tab1" checked aria-hidden="true">
        <label for="tab1" aria-hidden="true">Tab 1</label>
        <div>
          <h3>平台公告</h3>
          <p>This is the first tab's content.</p>
        </div>
      </div>
    </div>
  </div>
{% endblock %}