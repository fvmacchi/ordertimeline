var fs = require('fs');
var sql = require('mssql');
var ejs = require('ejs');
var async = require('async');
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
  getQuery('active_orders_search', {
    broadSearch: false,
    searchString: options.search,
    prevResults: options.prevResults
  }, function(results) {
    return callback(results);
  });
};

exports.getOrderWithWorkings = function(options, callback) {
  var workings = undefined;
  var order = undefined;
  async.parallel([
    function(callback) {
      getQuery('order_with_workings', {
        order_id: options.id
      }, function(results) {
        workings = results;
        return callback();
      });
    },
    function(callback) {
      getQuery('order', {
        order_id: options.id
      }, function(results) {
        order = results[0];
        return callback();
      });
    }
  ],
  
  
  
  function() {
    order.lines = [];
    var line = {};
    var pieces = [];
    var piece = {};
    workings.forEach(function(working) {
      //calculate dimensions
      working.DIMX_INCH = toFraction(working.DIMXPZR/25.4);
      working.DIMY_INCH = toFraction(working.DIMYPZR/25.4);
      
      if(working.RIGA+","+working.PROGR != piece.RIGA+","+piece.PROGR) {
        piece = {};
        piece.workings = [];
        Object.assign(piece, working);
        pieces.push(piece);
      }
      piece.workings.push(working);
    });
    pieces.forEach(function(piece) {
      if(piece.RIGA != line.RIGA) {
        line = {};
        Object.assign(line,piece);
        line.pieces = [];
        order.lines.push(line);
      }
      line.pieces.push(piece);
    });
    return callback(order);
  });
  
  
};

var getQuery = function(query, ejs_data, callback) {
  fs.readFile('./sql/' + query + '.sql', 'utf8', function(err, data) {
    if(err) {
      return console.log(err);
    }
    var query = ejs.render(data, ejs_data);
    new sql.Request().query(query, (err, result) => {
      if(err) {
        console.log(err);
        return callback(null);
      }
      return callback(result.recordset);
    });
  });
};

var toFraction = function(x) {
  var output = Math.floor(x) + "";
  var xr = Math.floor((x - Math.floor(x))*10000)/10000.0;
  if(xr > 0) {
    xr = Math.round(xr*32);
    xd = 32;
    while(xr % 2 == 0) {
      xr /= 2;
      xd /= 2;
    }
    if(xr != 0) {
      output += " " + xr+"/"+xd;
    }
  }
  return output;
};