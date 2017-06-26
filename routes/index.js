var express = require('express');
var router = express.Router();
var c = undefined;

module.exports = function(controllers) {
  c = controllers;
  return router;
};
 

/* GET home page. */
router.get('/', function(req, res, next) {
  
});
