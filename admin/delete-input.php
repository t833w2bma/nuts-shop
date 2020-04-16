<?php require 'header.php';
 require '../connect.php'; 
  ?>
<table>
<tr><th>商品番号</th><th>商品名</th><th>商品価格</th></tr>
<?php
$sql='select * from product';

foreach ($pdo->query('select * from product') as $row) {
	echo '<tr>';
	echo '<td>', $row['id'], '</td>';
	echo '<td>', $row['name'], '</td>';
	echo '<td>', $row['price'], '</td>';
	echo '<td>';
	echo '<a class="delete" href="delete-output.php?id=', $row['id'], '">削除</a>';
	echo '</td>';
	echo '</tr>';
	echo "\n";
}
?>
</table>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	$('a.delete').click(function(){
		var result = confirm('本当に消しますか？'); //okならtrueが返される
			if(result) 
				//okを選んだときの処理
				location.href = $this.attr('href');
				// $thisはクリックした要素のhref属性(url)を取得
				return false; // aタグのクリックを無効化
	});
});

 </script>

<?php require '../footer.php'; ?>
