'use strict';

const defaultOptions = {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  mode: 'cors',
  credentials: 'same-origin',
  cache: 'default',
};

let games = renderData.games.replace(/&quot;/g, '"');
games = JSON.parse(games);

const app = new Vue({
  delimiters: ['${', '}'],
  el: '#app',
  data: {
    games,
    msg: 'goto',
  },
  methods: {
    choose(chosen, game_id, index) {
      if (!renderData.isLogin || chosen) return;
      const self = this;
      defaultOptions.body = JSON.stringify({ game_id });
      fetch('/api/choosegame', defaultOptions).then(function(response) {
        if (response.status === 200) {
          return response.json();
        }
        return { ok: false };
      }).then(function(json) {
        if (json.ok) {
          self.games[index]['chosen'] = true;
        }
      });
    },
  },
});
