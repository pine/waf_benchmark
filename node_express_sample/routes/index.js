var express = require('express');
var router = express.Router();

var prime = require('../lib/prime');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/benchmark/simple', function(req, res, next) {
  res.json({
      ok       : true,
      language : 'Node',
      framework: 'Express',
  });
});

router.get('/benchmark/cpu', function(req, res, next) {
  var max = parseInt(req.param('max'), 10);

  res.json({
      ok    : true,
      max   : max,
      result: prime(max),
  });
});

module.exports = router;
