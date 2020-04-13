<?php session_start(); 
 require '../header.php'; 
 require 'menu.php'; 
 require 'connect.php'; 

if (isset($_SESSION['customer'])) {
	$sql=$pdo->prepare('insert into favorite values(?,?)');
	$sql->execute([$_SESSION['customer']['id'], $_REQUEST['id']]);
	echo 'お気に入りに商品を追加しました。';
	echo '<hr>';
	require 'favorite.php';
} else {
	echo 'お気に入りに商品を追加するには、ログインしてください。';
}
?>
<?php require '../footer.php'; ?>
