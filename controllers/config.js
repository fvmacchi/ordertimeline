var fs = require('fs');

module.exports = function(controllers) {
  if(config) {
    return config;
  }
  var config = JSON.parse(fs.readFileSync('./config/config', 'utf8'));
  return config;
};