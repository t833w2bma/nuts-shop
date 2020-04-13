<?php session_start();  
require './header.php';
 require 'connect.php'; 

unset($_SESSION['customer']);

$sql=$pdo->prepare('select * from customer where login=? ');
$sql->execute([$_REQUEST['login'] ]);
$row = $sql->fetchAll();

if (password_verify( $_POST['password'], $row[0]['password'] )) {
	//この関数でハッシュ化したパスワードと照合し正しければtrueが返される
	
	//ログイン名で引き当てた1行から列を取り出してセッションに入れる
		$_SESSION['customer']=[	'id'=>$row[0]['id']
		, 'name'=>$row[0]['name']
		,	'address'=>$row[0]['address']
		, 'login'=>$row[0]['login']	];
			// 'password'=>$row['password'] ハッシュ化してるのでこれは入れないほうがいい

	$output = '<p>いらっしゃいませ、'. $_SESSION['customer']['name']. 'さん。';
} else {
	$output = '<p>ログイン名またはパスワードが違います。';
}
	require 'menu.php';
	echo $output;
?>
<?php require './footer.php'; ?>
