'strict'

// Dependencies
var path = require('path');
var express = require('express');
var http = require('http');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var bodyParser = require('body-parser');

// Config
var config = require(__dirname + '/config/config.js');
// API v1.0
var API = require('./api/v1.0/api.js');
var Auth = require('./api/v1.0/auth.js');

var app = express();
app.set('port', process.env.PORT || 8080);
// app.set('views', __dirname + '/views');
// app.set('view engine', 'ejs');
// app.set('view options', { layout: false });
app.use(express.logger());
app.use(bodyParser.json());
app.use(Auth.getJWTContent);
// app.use(express.methodOverride());
// app.use(passport.initialize());
// app.use(app.router);
// app.use(express.static(path.join(__dirname, 'public')));


app.configure('development', function() {
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});
app.configure('production', function() {
    app.use(express.errorHandler());
});


app.post('/api/v1.0/login', API.login);

app.post('/api/v1.0/register', API.register);

app.post('/api/v1.0/user', API.user);

// app.error(function(err, req, res, next){
//     if (err instanceof NotFound) {
//         res.send({
//           status: 404,
//         });
//     } else {
//         res.send({
//           status: 500,
//         });
//     }
// });


// var Account = require(__dirname +'/models/account');

//NOTE: createStrategy: Sets up passport-local LocalStrategy with correct options.
//When using usernameField option to specify alternative usernameField e.g. "email"
//passport-local still expects your frontend login form to contain an input with
//name "username" instead of email
//https://github.com/saintedlama/passport-local-mongoose
// passport.use(Account.createStrategy());

// mongoose.connect(config.mongo_url);
// require(__dirname +'/routes/routes')(app, passport);

app.listen(app.get('port'), function() {
    console.log(("Express server listening on port " + app.get('port')));
});
