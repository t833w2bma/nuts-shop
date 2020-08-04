<nav class="memnunav">
<a href="index.php">商品</a>
<a href="cart-show.php">カート</a>
<a href="purchase-input.php">購入</a>
<?php
if (empty($_SESSION['customer']['name'])) { 
  //非ログインなら
  ?>   
  <a href="login-input.php">ログイン</a>
  <a href="customer-input.php">会員登録</a>
<?php }else{ //ログイン済みなら ?>
  <a href="favorite-show.php">お気に入り</a>
  <a href="history.php">購入履歴</a>
  <a href="logout-input.php">ログアウト</a>
  <span class="customer-name">ようこそ<?=$_SESSION['customer']['name']?>様</span>
<?php } ?>
  </nav>
<hr>
