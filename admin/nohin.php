<?php  
if(empty($_GET['purchase_id']))
 exit('URLパラメータがありません ?purchase_id=2');

 require 'header.php';
 require '../connect.php'; 

 $sql = 'SELECT p.id,name,address,`created` 
 FROM purchase as p 
 LEFT JOIN customer as c 
 ON p.customer_id=c.id 
 WHERE p.id = ? ';

$stmt=$pdo->prepare( $sql );
$stmt->execute([ $_GET['purchase_id']]);
$row = $stmt->fetchAll();
echo "<div class='container'>
  <li> {$row[0]['id']}"
 ,"<li> {$row[0]['name']}"
 ,"<li> {$row[0]['address']}"
 ,"<li> {$row[0]['created']}";

$sql = 'SELECT d.product_id,name ,price,count
 ,count * price as shokei
 FROM purchase_detail as d
 LEFT JOIN product as s
 ON s.id = d.product_id
 WHERE purchase_id = ? ';

$stmt=$pdo->prepare( $sql );
$stmt->execute([ $_GET['purchase_id']]);

ob_start() ;  // アウトプットバッファリングの開始
ob_implicit_flush(0);  // バッファ上限を無効化

echo '<table class="meisai">
<tr>
  <th>商品ID</th><th>商品名</th><th>単価</th><th>数量</th><th>小計</th>
</tr>';
$total = 0; //0で 初期化
foreach ($stmt as $row) {
  echo "<tr> <td>{$row['product_id']}</td> <td>{$row['name']}</td>
   <td>{$row['price']}</td> <td>{$row['count']}</td>  <td>{$row['shokei']}</td> </tr>
  ";
  $total += $row['shokei']; // 加算代入
}
define('TAX',0.1); 
$tax = $total * TAX; //税額
?>

<tr> <td colspan="2">消費税</td><td colspan="3"><?= $tax ?></td> </tr>
<tr> <td colspan="2">合計(税抜)</td><td colspan="3"><?= number_format($total) ?></td> </tr>
</table></div>

<?php
$table = ob_get_clean(); //バッファをクリアし変数に代入する
$total += $tax;
echo "<div class='total'><p>税込み合計 &yen ", number_format($total) ,"</p></div>";
echo $table; //バッファをアウトプット