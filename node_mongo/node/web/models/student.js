var mongoose = require('mongoose');

var User = new mongoose.Schema({
    s_id: String,
    s_task: {
        task1: Number,
        task2: Number,
        task3: Number
    }
});

module.exports = mongoose.model('student', User);