<body>
サンプル掲示板
</br></br><br>

<?php

$fp=fopen('data.txt','r');
while(!feof($fp)){
$line=fgets($fp);
print $line;
print"<br>\n";
}
fclose($fp);
?>

<form action="kakunin.php" method="post">
名前:<input type="text" name="name" />
</br>
内容:</br>
<textarea name="data" cols=40 rows=4></textarea>
</br>
</br>
<input value="送信" type="submit"/>
</from>
        </body>

