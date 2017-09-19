<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="includes/validate.js"><!-- external js --></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Tivoli Properties Admin</title>
<link href="includes/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
<?php
if($resize){
	print('<div class="grayBand"><table class="logoTbl"><tr><td class="logo"><img src="../images/adminLogo.gif" /></td><td class="borderLine">&nbsp;</td></tr></table><div class="navDivSm"><a href="table_multi.php?which=awards">edit award listings</a> | <a href="table_multi.php?which=careers">edit career listings</a> | <a href="table_multi.php?which=news">edit media articles</a> | <a href="table_multi.php?which=press">edit press articles</a> | <a href="fileUpload.php">view/upload files</a> | <a href="session_logout.php">log out</a></div></div>');
}else if($menu){
	print('<div class="grayBand"><table class="logoTbl"><tr><td class="logo"><img src="../images/adminLogo.gif" /></td><td class="borderLine">&nbsp;</td></tr></table><div class="navDiv"><a href="table_multi.php?which=awards">edit award listings</a> | <a href="table_multi.php?which=careers">edit career listings</a> | <a href="table_multi.php?which=news">edit media articles</a> | <a href="table_multi.php?which=press">edit press articles</a> | <a href="fileUpload.php">view/upload files</a> | <a href="session_logout.php">log out</a></div></div>');
	}
?>