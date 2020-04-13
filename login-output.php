<?php session_start();  
require '../header.php';
 require 'connect.php'; 

unset($_SESSION['customer']);

$sql=$pdo->prepare('select * from customer where login=? ');
$sql->execute([$_REQUEST['login'] ]);

foreach ($sql as $row) {
	$_SESSION['customer']=[
		'id'=>$row['id'], 'name'=>$row['name'], 
		'address'=>$row['address'], 'login'=>$row['login'], 
		'password'=>$row['password']];
}
 
if (password_verify( $_POST['password'], $_SESSION['customer']['password'] )) {
	//この関数でハッシュ化したパスワードと照合し正しければtrueが返される
	$output = '<p>いらっしゃいませ、'. $_SESSION['customer']['name']. 'さん。';
} else {
	$output = '<p>ログイン名またはパスワードが違います。';
}
	require 'menu.php';
	echo $output;
?>
<?php require '../footer.php'; ?>
