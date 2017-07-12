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
  var prevResults = req.body.prevResults;
  console.log(req.body)
  if(!s) {
    s = "";
  }
  c.database.searchOrders({
    search: s,
    prevResults: prevResults
  }, function(orders) {
    res.send(orders);
  });
});
