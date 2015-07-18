var config = require(__dirname + './../config/config.js');

var knex = require('knex')({
  client: 'mysql',
  connection: {
    host     : config.host,
    user     : config.user,
    password : config.password,
    database : config.database,
    charset  : 'utf8'
  }
});

var bookshelf = require('bookshelf')(knex);

var User = bookshelf.Model.extend({
  tableName: 'users'
});





// module.exports require('bookshelf')(knex);
