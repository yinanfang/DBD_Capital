
var jwt = require('jwt-simple');

var JWTSecret = require('../../config/config.js').JWTSecret;

var getJWTToken = function(email) {
  return jwt.encode({
    email: email,
  }, JWTSecret);
}

var getJWTContent = function(req, res, next) {
  if (req.headers['authorization']) {
    req.jwtToken = jwt.decode(req.headers['authorization'], JWTSecret);
    console.log('getJWTContent: ', req.jwtToken);
  };
  next();
}

module.exports = {
  getJWTToken: getJWTToken,
  getJWTContent: getJWTContent,
}
