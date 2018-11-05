<?php
//require("connect.php");

$myusername = $_POST['username'];
$mypassword = $_POST['password'];
/*
$sql="SELECT * FROM `users` WHERE name='$myusername' and pass='$mypassword'";
$result=mysql_query($sql);

// Mysql_num_row is counting table row
$count=mysql_num_rows($result);
// If result matched $myusername and $mypassword, table row must be 1 row

if($count==1){
	session_start();
	$_SESSION['user'] = $myusername;
	$_SESSION['pass'] = $mypassword;
	$_SESSION['count'] = 0;
	header("location:table_multi.php?which=awards");
} else {
	header("location:session_login.php");
}
*/
/*
header("location:table_multi.php?which=news");*/
if($myusername == 'tivoliAdmin'&&$mypassword == 'password'){
	session_start();
	$_SESSION['user'] = $myusername;
	$_SESSION['pass'] = $mypassword;
	$_SESSION['count'] = 0;
	header("location:table_multi.php?which=news");
} else {
	header("location:session_login.php");
}
?>