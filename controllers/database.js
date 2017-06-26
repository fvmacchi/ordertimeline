var sql = require('mssql');
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
      console.err(err);
    }
  });
  return exports;
};

exports.getOrder = function(orderNum, callback) {
  new sql.Request().query('SELECT * FROM ORDINI WHERE RIF='+orderNum, (err, result) => {
    if(err) {
      console.err(err);
    }
    callback(result.recordset[0]);
  });
};