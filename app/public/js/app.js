'use strict';

// Vue.config.delimiters = ['${', '}'];

const conf = {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  mode: 'cors',
  credentials: 'same-origin',
  cache: 'default',
};

pageData = pageData.replace(/&quot;/g, '"');
pageData = JSON.parse(pageData);

const app = new Vue({
  delimiters: ['${', '}'],
  el: '#app',
  data: {
    games: pageData,
    msg: 'goto',
  },
  methods: {
    choose: function(chosen, game_id, index) {
      const self = this;
      // self.games[index]['chosen'] = !chosen;
      if (chosen) return;
      conf.body = JSON.stringify({ game_id });
      fetch('/api/choosegame', conf).then(function(response) {
        if (response.status === 200) {
          return response.json();
        }
        return { ok: false };
      }).then(function(json) {
        if (json.ok) {
          self.games[index]['chosen'] = true;
          // self.$set(`games[${index}][chosen]`, true);
        }
        console.log(json);
      });
    },
  },
});
