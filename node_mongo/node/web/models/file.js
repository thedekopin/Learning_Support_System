var mongoose = require('mongoose');

var Student = new mongoose.Schema({
    id: String,
    date: String,
    dir: String,
    cmd: String,
    res: [ String ]
});

module.exports = mongoose.model('student', Student);
