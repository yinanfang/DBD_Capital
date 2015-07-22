
var bcrypt   = require('bcryptjs');

var DataModel = require('./db/db');
var Auth = require('./auth.js');


var GCUser = DataModel.User;

var register = function(req, res, next) {
  var email = req.body.email
  var password = req.body.password
  var message;
  console.log('Registering...')
  new GCUser({Email: email.toLowerCase().trim()})
    .fetch()
    .then(function(user){
      if (user) {
        message = "This email has been registered before!";
        console.log(message);
        res.send({
          status: 406,
          message: message,
        });
      } else {
        bcrypt.hash(password, 10, function(err, hash) {
          GCUser.forge({
            Email: email,
            PasswordHash: hash,
          })
          .save()
          .then(function() {
            message = "Added new user to database!";
            console.log(message);
            res.send({
              status: 200,
              message: message,
            });
          });
        });

        // TODO: Calculate jdenticon

      }
    })
};

var login = function(req, res, next) {
  console.log('Logging In...')
  var email = req.body.email;
  var password = req.body.password;
  new GCUser({Email: email.toLowerCase().trim()})
    .fetch()
    .then(function(user){
      bcrypt.compare(password, user.get('PasswordHash').toString('utf8'), function(err, isMatch) {
        if (err) { return next(err) };
        console.log('Login Result: ', isMatch);
        if (!isMatch) {
          return res.send({
            status: 401,
          });
        }
        var token = Auth.getJWTToken(email);
        res.send({
          status: 200,
          token: token,
        });
      });
    });
};

var user = function(req, res, next) {
  console.log('user method');
  // console.log(req);
  if (!req.jwtToken) {
    console.log('no auth');
    return res.send({
      status: 401,
    })
  };
  GCUser.forge({
    Email: req.jwtToken.email
  })
    .fetch()
    .then(function(user) {
      user.unset("PasswordHash");
      res.send({
        status: 200,
        user: user,
      });
    });
};


module.exports = {
  login: login,
  register: register,
  user: user,
};





// console.log('register start....');
// GCUser.register('yinanfang@gmail.com', '123456', 'lastname')
//   .then(function(result) {
//     console.log("register result");
//     console.log(result);
//   }).catch(function(err) {
//     console.error("Register error");
//     console.error(err);
//   });
/*
console.log('login start....');
GCUser.login('yinanfang@gmail.com', 'qwerty')
  .then(function(user) {
    console.log("login user: " + JSON.stringify(user));
    console.log("user Email: " + user.get('Email'));

    // user.then(function(value) {
    // });

    // res.json(user.omit('password'));
  }).catch(GCUser.NotFoundError, function() {
    console.log("NotFoundError user: " + user);
    // res.json(400, {error: email + ' not found'});
  }).catch(function(err) {
    console.error("Login error: " + err);
  });
*/




// var user = {
//   login: login
// }
// module.exports = user;

// register
// https://nodejs.org/api/buffer.html#buffer_buf_write_string_offset_length_encoding





// Retrieve All users
// new GCUser().fetch().then(function (users) {
//   console.log(Object.prototype.toString.call(users));
//   console.log(users.toJSON().FirstName);
//   console.log(users.toJSON());
// })
