<?php 
 session_start(); 
 require './header.php';  

if (isset($_SESSION['customer'])) {
	unset($_SESSION['customer']);
	$output = 'ログアウトしました。';
} else {
	$output = 'すでにログアウトしています。';
}

 require 'menu.php'; 
	echo $output;

 require './footer.php'; 
 
