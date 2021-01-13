<script src="https://kit.fontawesome.com/f4e704525f.js" crossorigin="anonymous"></script>
<?php 
 require '../header.php'; 
 require 'menu.php';
 require 'connect.php'; 
?>

<i class="fab fa-500px"></i>
<form action="product.php" method="post">
商品検索
<input type="text" name="keyword">
<input type="submit" value="検索">
</form>
<hr>
<div class="container">
	<div class="row">

<?php
	if (isset($_REQUEST['keyword'])) {
		$sql=$pdo->prepare('select * from product where name like ?');
		$sql->execute(['%'.$_REQUEST['keyword'].'%']);
	} else {
		$sql=$pdo->prepare('select * from product');
		$sql->execute([]);
		}
	foreach ($sql as $row) {
		$id=$row['id'];
	?>	

		<article class="col-sm-6 col-md-4 col-lg-3 product"><a href="detail.php?id=<?=$id?>">
			<img src="image/<?=$id?>.jpg">
			 <p> <?=$row['name']?> </p>
			<strong><?= $row['price']?> </strong>
		</a></article>

<?php	} ?>
	</div>
</div>
<?php require '../footer.php'; ?>
