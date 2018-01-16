var INotifyWait = require('inotifywait');
var exec = require('child_process').exec;
 
var watch1 = new INotifyWait('/etc/', { recursive: true });
watch1.on('add', function (filename) {
  //exec('/git_commit.sh', function (error, stdout, stderr) {
//	console.log(filename + ' added');	
 // });
});
watch1.on('change', function (filename) {
  exec('/inotify/shellscript/git_commit.sh', function (error, stdout, stderr) {
	console.log(filename + ' changed');
  });
});
