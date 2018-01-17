
<html>
<body>
<form action="work4.php" method="post">
  <input type="submit" value="戻る">
 </form>

<?php
	$fp = fopen("data.txt","aw");

	$get_val1 = $_POST['name'];
	$get_val2 = $_POST['data'];

	fwrite($fp,$get_val1."\n");
	fwrite($fp,$get_val2."\n");

	fclose($fp);
?>


</body>
</html>

