<?php
// start session
require("session.php");
// connection to DB
require("connect.php");

/* insert POST variables */
//print_r($_POST);
$insertStatement = "";
foreach($_POST as $field => $value) {
	if($field!=="id" && $field!=="Submit" && $field!=="table"){	
		//$field = mysql_real_escape_string($field);
		//$value = mysql_real_escape_string($value);
		$insertStatement .= "`$field`='$value',";
	}
}
//print($insertStatement);
$insertStatement = substr($insertStatement,0,strlen($insertStatement) - 1);// backup one step to chop ',' off end of query string
$query = "UPDATE `$mqlTable`.`".$_POST['table']."` SET ".$insertStatement." WHERE `".$_POST['table']."`.`id` =".$_POST['id']." LIMIT 1;";
//print "$query<br>";
mysql_query($query) or die('Update failed: '.mysql_error());
require('writeXML.php');

header("location:table_multi.php?which=".$_POST['table']);
?>