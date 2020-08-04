<?php 
 require './header.php'; 
 require 'menu.php';
 require 'connect.php'; 
?>
<form action="product.php" method="post">
商品検索
<input type="text" name="keyword">
<input type="submit" value="検索">
</form>
<hr>
<?php

if (isset($_REQUEST['keyword'])) {
	$sql=$pdo->prepare('select * from product where name like ?');
	$sql->execute(['%'.$_REQUEST['keyword'].'%']);
} else {
	$sql=$pdo->prepare('select * from product');
	$sql->execute([]);
}

echo '<div class="products">';
	foreach ($sql as $row) {
		$id=$row['id'];
		?>
		<article class='product'>
			<a href='detail.php?id=$id'>
				<div class='img'><img src='image/<?=$id?>.jpg'></div>
				<div class='detail'><span> <?=$row['name']?> </span>
					<br> <span> <?=$row['price']?>円</span>
				</div>	
			</a></article>
<?php	} 	?>
</div> <!--product-->
<?php require './footer.php'; ?>
