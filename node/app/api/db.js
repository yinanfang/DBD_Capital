var dbMain = require('./bookshelf').Main;
var checkit  = require('checkit');
var Promise  = require('bluebird');
var bcrypt   = require('bcryptjs');

var secret = '0x33';


var User = dbMain.Model.extend({
  tableName: 'User',

}, {
  login: Promise.method(function(email, password) {
    if (!email || !password) throw new Error('Email and password are both required');
    return new this({email: email.toLowerCase().trim()}).fetch({require: true}).tap(function(user) {
      //https://nodejs.org/api/buffer.html#buffer_buf_tostring_encoding_start_end
      console.log(user.get('PasswordHash').toString('utf8'));
      console.log(password);
      console.log(Object.prototype.toString.call(user.get('PasswordHash').toString('utf8')));
      console.log(Object.prototype.toString.call(password));

      // bcrypt.compare(password, user.get('PasswordHash').toString('utf8'), function(err, res) {
      //       console.log("bcrypt compare err: " + err);
      //       console.log("bcrypt compare res: " + res);
      //     });

      return bcrypt.compare(password, user.get('PasswordHash').toString('utf8'), function(err, valid) {
        if (err) {console.log("compare err: "+err)};
        if (valid) {console.log("compare valid: "+valid)};
      });
    });
  }),
  register: Promise.method(function(email, password, lastname) {
    if (!email || !password) throw new Error('Email and password are both required');
    var user = new this({
      email:    email.toLowerCase().trim(),
      lastname: lastname.trim(),
    });
    bcrypt.hash(password, 10, function(err, hash) {
          // Store hash in your password DB.
          console.log("bcrypt result: " + hash);
          console.log(Object.prototype.toString.call(hash));
          console.log(Object.prototype.toString.call(password));

          bcrypt.compare(password, hash, function(err, res) {
            console.log("bcrypt compare err: " + err);
            console.log("bcrypt compare res: " + res);
          });
      });
  }),
});



// console.log('register start....');
// User.register('yinanfang@gmail.com', '123456', 'lastname')
//   .then(function(result) {
//     console.log("register result");
//     console.log(result);
//   }).catch(function(err) {
//     console.error("Register error");
//     console.error(err);
//   });

console.log('login start....');
User.login('yinanfang@gmail.com', '123456')
  .then(function(user) {
    // res.json(user.omit('password'));
  }).catch(User.NotFoundError, function() {
    // res.json(400, {error: email + ' not found'});
  }).catch(function(err) {
    console.error("Login error: " + err);
  });




// register
// https://nodejs.org/api/buffer.html#buffer_buf_write_string_offset_length_encoding


// var DataModel = {
//   User: User,
// }

// module.exports = DataModel;



// Retrieve All users
// new User().fetchAll().then(function (users) {
//   console.log(users.toJSON());
// })
