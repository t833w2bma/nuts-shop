<?php session_start(); 
 require './header.php'; 
 require 'menu.php'; 
 require 'connect.php'; 
 
if (isset($_SESSION['customer']['id'],$_GET['id'])) {
	$sql=$pdo->prepare('insert into favorite values(?,?)');
	$success = $sql->execute([ $_SESSION['customer']['id'],$_GET['id']]);
	if($success){
		echo 'お気に入りに商品を追加しました。';
		echo '<hr>';
		require 'favorite.php';
	}

} else {
	echo 'お気に入りに商品を追加するには、ログインしてください。';
}
?>
<?php require '../footer.php'; ?>
