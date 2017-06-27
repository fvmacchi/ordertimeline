var express = require('express');
var router = express.Router();
var c = undefined;

module.exports = function(controllers) {
  c = controllers;
  return router;
};
 

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('search', {});
});

router.post('/search', function(req, res, next) {
  var s = req.body.search;
  if(!s) {
    s = "";
  }
  c.database.searchOrders(s, function(orders) {
    res.send(orders);
  });
});
