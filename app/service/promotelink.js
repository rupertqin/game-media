// 'use strict';

// const Hashids = require('hashids');

// module.exports = app => {
//   const hashids = new Hashids(app.config.keys, 6);
//   class Promotelink extends app.Service {
//     async generate(id) {
//       return hashids.encode(id);
//     }

//     async decode(str) {
//       return hashids.decode(str);
//     }
//   }
//   return Promotelink;
// };
