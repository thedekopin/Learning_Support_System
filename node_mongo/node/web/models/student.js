var mongoose = require('mongoose');

var Student = new mongoose.Schema({
    id: String,
    task: [
        Number,
        Number,
        Number
    ]
});

module.exports = mongoose.model('student', Student);