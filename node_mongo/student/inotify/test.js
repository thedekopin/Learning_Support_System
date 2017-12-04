var INotifyWait = require('inotifywait');
 
var watch1 = new INotifyWait('/etc/', { recursive: true });
watch1.on('ready', function (filename) {
  console.log('watcher is watching');
});
watch1.on('add', function (filename) {
  console.log(filename + ' added');
});
watch1.on('change', function (filename) {
  console.log(filename + ' changed');
});
 
var watch2 = new INotifyWait('/var/', { recursive: true });
watch2.on('add', function (filename) {
  console.log(filename + ' added');
});
watch2.on('change', function (filename) {
  console.log(filename + ' changed');
  watch2.close(); // stop watching 
});
