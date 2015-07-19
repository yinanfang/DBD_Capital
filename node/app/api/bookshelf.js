var config = require(__dirname + './../../config/config.js');

var knex = require('knex')({
  client: 'mysql',
  connection: {
    host     : config.WebfactionDB.host,
    user     : config.WebfactionDB.user,
    password : config.WebfactionDB.password,
    database : config.WebfactionDB.database,
    charset  : 'utf8'
  }
});

module.exports.Main = require('bookshelf')(knex);

// module.exports =  {
//   main = bookshelf,
// }


// Add a mongo db?
