<?php session_start();  
require './header.php';
 require 'connect.php'; 

 // セッション変数を初期化
unset($_SESSION['customer']);

$login = $_POST['login']; // ユーザーの入力値

try{

	$sql=$pdo->prepare('select * from customer where login=? ');
	// バインドして記号の無害化
	$sql->bindParam(1, $login, PDO::PARAM_STR );
	$sql->execute();
	
	// 最初の1行を配列にする
	$row = $sql->fetch();
 
	if ( password_verify( $_POST['password'], $row['password'] )) {
		//この関数でハッシュ化したパスワードと照合し正しければtrueが返される
		
		//ログイン名で引き当てた1行から列を取り出してセッションに入れる
		$_SESSION['customer']=[	
			'id'=>$row['id']
			, 'name'=>$row['name']
			,	'address'=>$row['address']
			, 'login'=>$row['login']	
		];
		// 'password'=>$row['password'] ハッシュ化してるのでこれは入れないほうがいい
		
		$output = '<p>いらっしゃいませ、'. $_SESSION['customer']['name']. 'さん。';
	} else {
		$output = '<p>ログイン名またはパスワードが違います。';
	}
}catch (Exception $e) {
	echo '例外的なエラー: ',  $e->getMessage(), "\n";
}
	require 'menu.php';
	echo $output;
?>
<?php require './footer.php'; ?>
