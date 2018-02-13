var mongoose = require('mongoose');

var Cmd = new mongoose.Schema({
    id: String,
    date: String,
    dir: String,
    cmd: String,
    res: [ String ]
});

module.exports = mongoose.model('cmds', Cmd);
