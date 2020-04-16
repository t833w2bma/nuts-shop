<?php require '../header.php';
 require 'connect.php';  

 $name=htmlspecialchars($_POST['name'],ENT_QUOTES);
 $price=htmlspecialchars($_POST['price'],ENT_QUOTES);

$sql = 'insert into product values(null, ?, ?)';
$sth=$pdo->prepare($sql);
$sth->bindParam(1, $name, PDO::PARAM_STR);
$sth->bindParam(2, $price, PDO::PARAM_INT);
$success = $sth->execute();

if ($success) {
	echo '追加に成功しました。';
} else {
	echo '追加に失敗しました。';
}
 require '../footer.php';  
