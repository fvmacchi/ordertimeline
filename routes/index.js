var express = require('express');
var router = express.Router();
var c = undefined;

module.exports = function(controllers) {
  c = controllers;
  return router;
};
 

/* GET home page. */
router.get('/', function(req, res, next) {
  c.database.getWorkingsInProduction(function(workings) {
    res.render('search', {
      workings: workings
    });
  });
});

router.post('/search', function(req, res, next) {
  var s = req.body.search;
  var prevResults = req.body.prevResults;
  var workingsNeeded = req.body.workingsNeeded;
  if(!s) {
    s = "";
  }
  c.database.searchOrders({
    search: s,
    prevResults: prevResults,
    workingsNeeded: workingsNeeded
  }, function(orders) {
    res.send(orders);
  });
});

router.get('/order/:order_id', function(req, res, next) {
  var order_id = req.params.order_id;
  c.database.getOrderWithWorkings({
    id: order_id
  }, function(order) {
    res.render('order', {
      order: order
    });
  });
});
