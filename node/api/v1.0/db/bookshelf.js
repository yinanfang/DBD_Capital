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
};



module.exports.Main = require('bookshelf')(knex);

// module.exports =  {
//   main = bookshelf,
// }


// Add a mongo db?
