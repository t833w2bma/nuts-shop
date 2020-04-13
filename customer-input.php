<?php session_start(); 
 require '../header.php'; 
 require 'menu.php'; 
 require 'connect.php'; 

 if( empty($_GET['email']) || empty($_GET['token'])){
  echo '<p><a href="/chap7/customer-input-tmp.php">こちらからemailを送信してください。</a></p>'; 
  exit;
 }else{

	$sql=$pdo->prepare('select * from customer_tmp where email=? and token=?');
	$sql->execute([ $_GET['email'], $_GET['token'] ]);
	$row = $sql->fetchAll();
	var_dump($row);
 }

$name=$address=$login=$password='';
if (isset($_SESSION['customer'])) {
	$name=$_SESSION['customer']['name'];
	$address=$_SESSION['customer']['address'];
	$login=$_SESSION['customer']['login'];
	// $password=$_SESSION['customer']['password'];
}
?>
<form action="customer-output.php" method="post">
<table>
<tr><td>お名前</td><td>
<input type="text" name="name" value="<?=$name?>">
</td></tr>
<tr><td>ご住所</td><td>
<input type="text" name="address" value="<?=$address?>">
</td></tr>
<tr><td>ログイン名</td><td>
<input type="text" name="login" value="<?=$login?>">
</td></tr>
<tr><td>パスワード</td><td>
<input type="password" name="password" value="">
</td></tr>
</table>
<input type="submit" value="確定">
</form>

<?php require '../footer.php' ?>
