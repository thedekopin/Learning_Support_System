var mongoose = require('mongoose');

var Task = new mongoose.Schema({
    task_id: Number,
    task_name: String,
    task_status: Number
});

module.exports = mongoose.model('tasks', Task);
