'use strict';

var config = require(__dirname + './../../../config/config.js');

var knex;
if (config.isProduction) {
  knex = require('knex')({
    client: config.Production.DB.Type,
    connection: {
      host     : config.Production.DB.Host,
      database : config.Production.DB.Name,
      user     : config.Production.DB.User,
      password : config.Production.DB.Password,
      charset  : config.Production.DB.Charset,
    }
  });
} else {
  knex = require('knex')({
    client: config.Development.DB.Type,
    connection: {
      host     : config.Development.DB.Host,
      database : config.Development.DB.Name,
      user     : config.Development.DB.User,
      password : config.Development.DB.Password,
      charset  : config.Development.DB.Charset,
    }
  });
}



module.exports.Main = require('bookshelf')(knex);

// module.exports =  {
//   main = bookshelf,
// }


// Add a mongo db?
