<?php session_start();  
require '../header.php';
require 'menu.php';
 require 'connect.php'; 

unset($_SESSION['customer']);

http://192.168.17.104/chap7/customer-input.php
foreach ($sql as $row) {
	$_SESSION['customer']=[
		'id'=>$row['id'], 'name'=>$row['name'], 
		'address'=>$row['address'], 'login'=>$row['login'], 
		'password'=>$row['password']];
}
 
if (password_verify( $_POST['password'], $_SESSION['customer']['password'] )) {
	//この関数でハッシュ化したパスワードと照合し正しければtrueが返される
	echo 'いらっしゃいませ、', $_SESSION['customer']['name'], 'さん。';
} else {
	echo 'ログイン名またはパスワードが違います。';
}
?>
<?php require '../footer.php'; ?>
