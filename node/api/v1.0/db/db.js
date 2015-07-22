var dbMain = require('./bookshelf').Main;
var checkit  = require('checkit');
var Promise  = require('bluebird');
var bcrypt   = require('bcryptjs');
/*
var User = dbMain.Model.extend({
  tableName: 'User',

}, {
  login: Promise.method(function(email, password) {
    if (!email || !password) throw new Error('Email and password are both required');


    new this({Email: email.toLowerCase().trim()}).fetch({require: true}).tap(function(user) {
      console.log('In tap')
      return bcrypt.compareAsync(user.get('PasswordHash').toString('utf8'), password);
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
  })
}
);
*/
var User = dbMain.Model.extend({
  tableName: 'User'
})

// console.log('register start....');
// User.register('yinanfang@gmail.com', '123456', 'lastname')
//   .then(function(result) {
//     console.log("register result");
//     console.log(result);
//   }).catch(function(err) {
//     console.error("Register error");
//     console.error(err);
//   });
/*
console.log('login start....');
User.login('yinanfang@gmail.com', 'qwerty')
  .then(function(user) {
    console.log("login user: " + JSON.stringify(user));
    console.log("user Email: " + user.get('Email'));

    // user.then(function(value) {
    // });

    // res.json(user.omit('password'));
  }).catch(User.NotFoundError, function() {
    console.log("NotFoundError user: " + user);
    // res.json(400, {error: email + ' not found'});
  }).catch(function(err) {
    console.error("Login error: " + err);
  });
*/

var login = function(req, res) {
  var password = req.body.password
  console.log('login called')
  new User({Email: req.body.email.toLowerCase().trim()})
    .fetch()
    .then(function(user){
      var isMatch = bcrypt.compareSync(password, user.get('PasswordHash').toString('utf8'));
      console.log('is match: ', isMatch)
      if(isMatch)
        return res.send({sucess: true})
      res.send({error: true, msg: 'User authentication failed'})
    })
}


var user = {
  login: login
}

// register
// https://nodejs.org/api/buffer.html#buffer_buf_write_string_offset_length_encoding


// var DataModel = {
//   User: User,
// }

// module.exports = DataModel;



// Retrieve All users
// new User().fetch().then(function (users) {
//   console.log(Object.prototype.toString.call(users));
//   console.log(users.toJSON().FirstName);
//   console.log(users.toJSON());
// })
module.exports = user;
