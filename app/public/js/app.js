'use strict';


const myHeaders = new Headers({
  'Accept': 'application/json, text/plain, */*',
  'Content-Type': 'application/json',
});

const myInit = {
  method: 'POST',
  headers: myHeaders,
  mode: 'cors',
  credentials: 'same-origin',
  cache: 'default',
  body: JSON.stringify({ app_id: 9898887, name: '滑雪大冒险2' }),
};

const app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!',
  },
  methods: {
    choose: () => {
      fetch('/api/choosegame', myInit).then(function(response) {
        if (response.status === 200) {
          return response.json();
        }
        return { ok: false };
      }).then(function(json) {
        console.log(json);
      });
    },
  },
});
