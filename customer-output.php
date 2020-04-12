<?php 
session_start(); 
require '../header.php';
 require 'menu.php';
	require 'connect.php'; 
 
if (isset($_SESSION['customer']['id'])) {
	$id=$_SESSION['customer']['id'];
	$sql=$pdo->prepare('select * from customer where id!=? and login=?');
	$sql->execute([$id, $_REQUEST['login']]);
} else {
	$sql=$pdo->prepare('select * from customer where login=?');
	$sql->execute([$_REQUEST['login']]);
}


if (empty($sql->fetchAll())) {  //重複したログイン名はない
	// パスワードをハッシュ化する
	$pswd = password_hash($_REQUEST['password'], PASSWORD_DEFAULT);


	if (isset($_SESSION['customer']['name'],$_SESSION['customer']['address'],$_SESSION['customer']['login'],$_SESSION['customer']['name'])) {
	// ログインセッションがあったら更新処理
		$sql=$pdo->prepare('update customer set name=?, address=?, '.
			'login=?, password=? where id=?');
		// DBを上書きする処理
			$sql->execute([
			$_REQUEST['name'], $_REQUEST['address'], 
			$_REQUEST['login'], $_REQUEST['password'], $id]);

			//ログインセッションを保存する処理
		$_SESSION['customer']=[
			'id'=>$id, 'name'=>$_REQUEST['name'], 
			'address'=>$_REQUEST['address'], 'login'=>$_REQUEST['login']];
			// ,'password'=>$pswd  パスワードは保存しなくていい
		echo 'お客様情報を更新しました。';
	} else {
// なかったら DBに新規追加する
		$sql=$pdo->prepare('insert into customer values(null,?,?,?,?,?)');
		$sql->execute([
			$_REQUEST['name'], $_REQUEST['address']
			,$_REQUEST['login'], $pswd 
			,$_SESSION['customer']['email'] 
		]);
		echo 'お客様情報を登録しました。';
		//セッションに代入してログイン済みにする
		$_SESSION['customer']['name']=$_REQUEST['name'];
		$_SESSION['customer']['address']=$_REQUEST['address'];
		$_SESSION['customer']['login']=$_REQUEST['login'];

	}
} else {
	echo 'ログイン名がすでに使用されていますので、変更してください。';
}
?>
<?php require '../footer.php'; ?>
