var mongoose = require('mongoose');

var Student = new mongoose.Schema({
    id: String,
    task:[Number]
});

module.exports = mongoose.model('students', Student);
