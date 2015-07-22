var dbMain = require('./bookshelf').Main;
var checkit  = require('checkit');
var Promise  = require('bluebird');

var User = dbMain.Model.extend({
  tableName: 'User'
})

module.exports = {
  User: User,
};

// , {
//   login: Promise.method(function(email, password) {
//     if (!email || !password) throw new Error('Email and password are both required');


//     new this({Email: email.toLowerCase().trim()}).fetch({require: true}).tap(function(user) {
//       console.log('In tap')
//       return bcrypt.compareAsync(user.get('PasswordHash').toString('utf8'), password);
//     });
//   }),
//   register: Promise.method(function(email, password, lastname) {
//     if (!email || !password) throw new Error('Email and password are both required');
//     var user = new this({
//       email:    email.toLowerCase().trim(),
//       lastname: lastname.trim(),
//     });
//     bcrypt.hash(password, 10, function(err, hash) {
//           // Store hash in your password DB.
//           console.log("bcrypt result: " + hash);
//           console.log(Object.prototype.toString.call(hash));
//           console.log(Object.prototype.toString.call(password));

//           bcrypt.compare(password, hash, function(err, res) {
//             console.log("bcrypt compare err: " + err);
//             console.log("bcrypt compare res: " + res);
//           });
//       });
//   })
// }

