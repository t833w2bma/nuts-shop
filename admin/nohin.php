<?php session_start();  
require './header.php';
 require 'connect.php'; 

 $sql = 'SELECT p.id,name,address 
 FROM purchase as p 
 LEFT JOIN customer as c 
 ON p.customer_id=c.id 
 WHERE p.id = 1 ';

$stmt=$pdo->prepare( $sql );
$tmt->execute([ $_GET['purchase_id']]);
$row = $sql->fetchAll();
echo "<p> {$row[0]['id']}";
echo "<p> {$row[0]['name']}";
echo "<p> {$row[0]['address']}";

$sql = 'SELECT d.product_id,name ,price,count
 ,count * price as shokei
 FROM purchase_detail as d
 LEFT JOIN product as s
 ON s.id = d.product_id
 WHERE purchase_id = 1 ';

$stmt=$pdo->prepare( $sql );
$stmt->execute([ $_GET['purchase_id']]);
foreach ($stmt as $row) {
  echo '<p>',$row['product_id'] ,$row['name'], $row['price'] , $row['count'] , $row['shokei'] ;
}