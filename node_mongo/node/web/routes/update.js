var mongoose = require('mongoose');
mongoose.connect('mongodb://teacher:rehcaet@192.168.0.5:27017/test', { useMongoClient: true });

var User = require('./models/student');

User.update({ s_id: 'B99000' }, { $set: { 's_task.task1': 0 } }, function (err, student) {
    if (err) return handleError(err);
    console.log("success");
});

