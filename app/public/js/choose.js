'use strict';

const defaultOptions = {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  mode: 'cors',
  credentials: 'same-origin',
  cache: 'default',
};

const app = new Vue({
  delimiters: [ '${', '}' ],
  el: '.main-content',
  data: {
    games: renderData.games,
    msg: 'goto',
  },
  methods: {
    choose(chosen, app_id, index) {
      if (!renderData.isLogin || chosen) return;
      const self = this;
      defaultOptions.body = JSON.stringify({ app_id });
      fetch('/api/choosegame', defaultOptions).then(function(response) {
        if (response.status === 200) {
          return response.json();
        }
        return { ok: false };
      }).then(function(json) {
        if (json.ok) {
          self.games[index].chosen = true;
        }
      });
    },
  },
});
