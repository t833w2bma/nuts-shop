<?php session_start(); 
 require '../header.php'; 
 require 'menu.php'; 
 require 'connect.php'; 

 $error_message =  '<p><a href="/chap7/customer-input-tmp.php">こちらからemailを送信してください。</a></p>';
 if( empty($_GET['email']) || empty($_GET['token'])){
  echo  $error_message;
	exit;
	
 }else{
// 取得したemailとtokenで仮登録テーブルを絞り込んで、1件あれば認証
	$sql=$pdo->prepare('select * from customer_tmp where email=? and token=?');
	$sql->execute([ $_GET['email'], $_GET['token'] ]);
	$row = $sql->fetchAll();
	if( empty($row) || time() - strtotime ($row[0]['created']) > 3600 * 24 )
	 exit(  $error_message ); 
	// 一件もないか 24時間以上経過していたら処理を中断
		$_SESSION['customer']['email'] = htmlspecialchars( $_GET['email'],ENT_QUOTES);
 }

$name=$address=$login=$password=''; // 全部にカラ文字を代入して初期化する
if (isset($_SESSION['customer']['name'] ,$_SESSION['customer']['address'], $_SESSION['customer']['login'])) { // 3つともあったらに変える
	$name=$_SESSION['customer']['name'];
	$address=$_SESSION['customer']['address'];
	$login=$_SESSION['customer']['login'];
	// $password=$_SESSION['customer']['password']; パスワードは保存しなくていい
}
?>
<form action="customer-output.php" method="post">
	<table>
		<tr><td>メールアドレス</td><td><?=$_SESSION['customer']['email']?> </td></tr>
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
