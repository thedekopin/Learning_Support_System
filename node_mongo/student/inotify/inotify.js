var INotifyWait = require('inotifywait');
const exec = require('child_process').exec;

var watch1 = new INotifyWait('/etc/', { recursive: true });
watch1.on('add', function (filename) {
  exec('shellscript/git_commit.sh ./', (err, stdout, stderr) => {
  });
});
 
var watch2 = new INotifyWait('/var/', { recursive: true });
watch2.on('add', function (filename) {
  exec('shellscript/git_commit.sh ./', (err, stdout, stderr) => {
  });
});

var watch3 = new INotifyWait('/usr/local/src/', { recursive: true });
watch3.on('add', function (filename) {
  exec('shellscript/git_commit.sh ./', (err, stdout, stderr) => {
  });
});
