var fs = require('fs');
var sql = require('mssql');
var ejs = require('ejs');
var c = undefined;

module.exports = function(controllers) {
  c = controllers
  sql.connect(
    'mssql://'
    +c.config.db_username
    +':'+c.config.db_password+
    '@'+c.config.db_host+
    '/'+c.config.database, err => {
    if(err) {
      console.log(err);
    }
  });
  return exports;
};

exports.getOrder = function(orderNum, callback) {
  new sql.Request().query('SELECT * FROM ORDINI WHERE RIF='+orderNum, (err, result) => {
    if(err) {
      console.log(err);
    }
    callback(result.recordset[0]);
  });
};

exports.searchOrders = function(options, callback) {
  getQuery('active_orders_search', function(query) {
    query = ejs.render(query, {
      broadSearch: true,
      searchString: options.search,
      prevResults: options.prevResults
    });
    new sql.Request().query(query, (err, result) => {
      if(err) {
        console.log(err);
      }
      callback(result.recordset);
    });
  });
};

var getQuery = function(query, callback) {
  fs.readFile('./sql/' + query + '.sql', 'utf8', function(err, data) {
    if(err) {
      return console.log(err);
    }
    return callback(data);
  });
};