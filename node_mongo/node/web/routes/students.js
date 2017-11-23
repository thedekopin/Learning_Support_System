var express = require('express');
var router = express.Router();

var mongoose = require('mongoose');
mongoose.connect('mongodb://teacher:rehcaet@192.168.0.5:27017/test', { useMongoClient: true });

var User = require('../models/student');

/* GET home page. */
router.get('/:id', function (req, res, next) {
    User.findOne({ s_id: req.params.id }, function (err, student) {
        if (err) {
            res.send(err);
        } else {
            res.render('students', { 'student': student });
        }
    });
});

module.exports = router;

