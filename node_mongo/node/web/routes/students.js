var express = require('express');
var router = express.Router();

var mongoose = require('mongoose');
mongoose.connect('mongodb://teacher:rehcaet@db:27017/test', { useMongoClient: true });

var User = require('../models/student');

/* GET home page. */
router.get('/:id', function (req, res, next) {
    User.findOne({ id: req.params.id }, function (err, student) {
        if (err) {
            res.send(err);
        } else {
            res.render('students', { 'student': student });
        }
    });
});

router.get('/check/:id/:task', function (req, res, next) {
    var ch = function () {
        var task = req.params.task;
        var obj = { [task]: 1 };
        console.log(obj);
        User.update({ id: req.params.id }, { $set: obj }, function (err, student) {
            if (err) {
                console.log(err);
            } else {
                res.json(student);
            }
        });
    }

    var exec = require('child_process').exec;

    exec('/home/teacher/web/public/shellscript/' + req.params.task + '/check.sh', function (error, stdout, stderr) {
        if (error) console.log(error);
        console.log(stdout);
        if (req.params.task == 'task.0' && stdout != 1) {
            ch();
        } else if (req.params.task == 'task.1' && stdout == 0) {
            ch();
        } else if (req.params.task == 'task.2' && stdout == 0) {
            ch();
        } else {
            res.send("No");
        }

    });
});


module.exports = router;

