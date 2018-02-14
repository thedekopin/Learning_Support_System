var mongoose = require('mongoose');

var Server = new mongoose.Schema({
    id: String,
    date: String,
    dir: String,
    script: String,
    res: [ String ]
});

module.exports = mongoose.model('servers', Server);
