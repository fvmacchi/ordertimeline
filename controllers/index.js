module.exports = function() {
  var c = {}
  
  c.config = require('./config.js')(c);
  c.database = require('./database.js')(c);
  
  return c;
};