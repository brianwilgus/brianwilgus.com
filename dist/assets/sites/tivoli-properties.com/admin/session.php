<?php
session_start();
if(isset($_SESSION['user'])&&isset($_SESSION['pass'])&&isset($_SESSION['count'])){
	$_SESSION['count']++;
	/*echo"
	session information:<br>
	user=".$_SESSION['user']."<br>
	pass=".$_SESSION['pass']."<br>
	count=".$_SESSION['count']."<br>
	";*/
} else {
	header('Location:session_login.php');
}
?>