{% extends "layout/wrapper.tpl" %}

{% block content %}
  <div class="content">
    <div class="container">
      <div class="col-sm row">
        <div class="col-sm-7">
          <div class="card">
            <img src="https://placehold.it/800x600" class="section media">
            <div class="section doublepadded"><p>Content</p></div>
            <div class="section dark"><p>Content</p></div>
          </div>
        </div>
        <div class="col-sm-5">
          {% if user == false or user == null %}
            <form method="post" action="/login">
              <fieldset>
                <legend>Login</legend>
                <div class="inputgroup fluid"><label for="username2">Username</label> <input type="text" value="" name="name" placeholder="username"></div>
                <div class="inputgroup fluid"><label for="pwd2">Password</label> <input type="password" value="" name="pwd" placeholder="password"></div>
                <div class="inputgroup fluid"> <input type="submit" value="Login" id="pwd2"></div>
              </fieldset>
            </form>
          {% else %}
            {{ user.username }} <br/>
            {{ user.realname }} <br/>
            {{ user.last_login_at }} <br/>
          {% endif %}
        </div>
      </div>

      <div class="tabs">
        <input type="radio" name="tabgroup" id="tab1" checked ariahidden="true">
        <label for="tab1" ariahidden="true">平台公告</label>
        <div>
          <h3>平台公告</h3>
          <p>This is the first tab's content.</p>
        </div>
      </div>
    </div>
  </div>
{% endblock %}