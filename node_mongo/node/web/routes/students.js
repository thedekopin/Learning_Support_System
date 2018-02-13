var express = require('express');
var router = express.Router();

var mongoose = require('mongoose');
mongoose.connect('mongodb://teacher:rehcaet@db:27017/test', { useMongoClient: true });


var Cmd = require('../models/cmd');
var File = require('../models/file');
var Task = require('../models/task');
var Server = require('../models/server');
var Ans = require('../models/ans');

require('date-utils');
const execSync = require('child_process').execSync;

/* GET home page. */
router.get('/task', function (req, res, next) {
    res.render('task', {});
});


router.get('/:id/cmd', function (req, res, next) {
    Cmd.find({ id: req.params.id ,}, function (err, cmd) {
        if (err) {
            res.send(err);
        } else {
            res.render('cmd', { 'cmd' : cmd });
        }
    });
});

router.get('/:id/cmd/detail/:_id', function (req, res, next) {
    Cmd.findOne({ id: req.params.id, _id: req.params._id }, function (err, cmd) {
        if (err) {
            res.send(err);
        } else {
            res.render('detail', { 'cmd' : cmd });
        }
    });
});

router.get('/:id/file', function (req, res, next) {
	const result = execSync('rsync -av -e ssh root@student:/git /home/teacher/web/public/st_git').toString();
	res.send(result);
});

router.get('/:id/server', function (req, res, next) {
    Task.find({}, function (err, task) {
        if (err) {
            res.send(err);
        } else {
            res.render('server', { 'task' : task });
        }
    });
});

router.get('/:id/server/check:task_id', function (req, res, next) {
    // var check = function () {
    //     var task = Task.find({
    //         task_id: req.params.task_id,
    //     });

    //     var server = Server.find({
    //         server
    //     });

    //     if(task.ans == server.res){
            
    //     }
    //     User.update({ task_id: req.params.task_id }, { $set: obj }, function (err, student) {
    //         if (err) {
    //             console.log(err);
    //         } else {
    //             res.json(students);
    //         }
    //     });
    // }

    var exec = require('child_process').exec;
    var num = req.params.task_id;
    exec('/home/teacher/web/public/shellscript/check'+num+'.sh', { maxBuffer: 1024 * 1024 }, function (error, stdout, stderr) {
	    var dt = new Date();
    	var formatted = dt.toFormat("YYYY-MM-DDTHH24:MI:SS");
	    var server = new Server({
	        id: "teacher",
            date: formatted,
            dir: '/home/teacher/web/public/shellscript/',
            script: 'check'+num+'.sh',
	        res: stdout
	    });
	    server.save(function(err, server) {
	        if(err){console.log(err); }
        });
        res.send(stdout);
        
    });
});


module.exports = router;

