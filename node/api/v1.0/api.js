
var bcrypt   = require('bcryptjs');

var DataModel = require('./db/db');


var User = DataModel.User;


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

module.exports = {
  login: login
}
