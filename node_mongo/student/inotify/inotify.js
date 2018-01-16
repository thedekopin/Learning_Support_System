var INotifyWait = require('inotifywait');
var exec = require('child_process').exec;
 
var watch1 = new INotifyWait('/etc/', { recursive: true });
watch1.on('add', function (filename) {
  //exec('/git_commit.sh', function (error, stdout, stderr) {
//	console.log(filename + ' added');	
 // });
});
watch1.on('change', function (filename) {
  exec('shellscript/git_commit.sh', function (error, stdout, stderr) {
	console.log(filename + ' changed');
  });
});
 
var watch2 = new INotifyWait('/var/', { recursive: true });
watch2.on('add', function (filename) {
  //exec('/git_commit.sh', function (error, stdout, stderr) {
//	console.log(filename + ' added');
  //});
});
watch2.on('change', function (filename) {
  exec('shellscript/git_commit.sh', function (error, stdout, stderr) {
	console.log(filename + ' changed');
  });
});

var watch3 = new INotifyWait('/var/log/cmd.log', { recursive: true });
watch3.on('add', function (filename) {
  exec('/inotify/shellscript/cmd_log_insert.sh', function (error, stdout, stderr) {
	if(error) console.log(error);
	else console.log("success");
  });
  console.log(filename + ' changed');
});

//watch3.on('change', function (filename) {
  //exec('./test2.sh', function (error, stdout, stderr) {
   //	if(error) console.log(error);
     //   else console.log("success");   
  //}); 
  //console.log(filename + ' changed');
//});
