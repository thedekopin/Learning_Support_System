var express = require('express');
var router = express.Router();

var mongoose = require('mongoose');
mongoose.connect('mongodb://teacher:rehcaet@db:27017', { useMongoClient: true });

var Student = require('../models/student');

/* GET home page. */
router.get('/', function (req, res, next) {
    Student.find({}, function (err, student) {
        if (err)
            res.send(err);
        res.render('teacher', { 'student': student });
    });
});

module.exports = router;
