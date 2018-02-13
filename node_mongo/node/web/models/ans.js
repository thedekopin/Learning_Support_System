var mongoose = require('mongoose');

var Ans = new mongoose.Schema({
    cmd: String,
    res: [ String ]
});

module.exports = mongoose.model('ans', Ans);
