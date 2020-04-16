<?php
 require 'header.php';  
 require '../connect.php';  

$sql = 'select * from product where name NOT LIKE "%ナッツ%"
ORDER BY price DESC ';
$stmt = $pdo->query($sql);
 // $stmtは配列ではないがforeachで回せる(表構造) 
foreach ( $stmt as $row) {
	// print_r($row); これは1行のこと､列(セル)はインデックスを指定すると取り出せる
	echo '<p>'
	, $row['id'], ':', $row['name']
	, ':' ,$row['price'] 
	,'</p>' , PHP_EOL ;
}
?>
<?php require '../footer.php'; ?>
