<?php session_start();  
require '../header.php';
 require 'connect.php'; 

unset($_SESSION['customer']);

$sql=$pdo->prepare('select * from customer where login=? ');
$sql->execute([$_REQUEST['login'] ]);


if (password_verify( $_POST['password'], $_SESSION['customer']['password'] )) {
	//この関数でハッシュ化したパスワードと照合し正しければtrueが返される
	
	foreach ($sql as $row) {
	// 	ログイン名で引き当てた1行から列を取り出してセッションに入れる
		$_SESSION['customer']=[
			'id'=>$row['id'], 'name'=>$row['name'], 
			'address'=>$row['address'], 'login'=>$row['login']
		];
			// 'password'=>$row['password'] ハッシュ化してるのでこれは入れないほうがいい
	}

	$output = '<p>いらっしゃいませ、'. $_SESSION['customer']['name']. 'さん。';
} else {
	$output = '<p>ログイン名またはパスワードが違います。';
}
	require 'menu.php';
	echo $output;
?>
<?php require '../footer.php'; ?>
