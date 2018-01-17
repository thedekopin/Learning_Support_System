var INotifyWait = require('inotifywait');
var exec = require('child_process').exec;
 
var watch1 = new INotifyWait('/var/log/cmd.log', { recursive: true });
watch1.on('change', function (filename) {
   console.log("NO");
});

