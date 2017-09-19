<?php
// start session
require("session.php");
// connection to DB
require("connect.php");

$query = "DELETE FROM ".$_POST['table']." WHERE id = '".$_POST['id']."'";
//$query = "UPDATE `$mqlTable`.`".$_POST['table']."` SET ".$insertStatement." WHERE `".$_POST['table']."`.`id` =".$_POST['id']." LIMIT 1;";
//print "$query<br>";
mysql_query($query) or die('Update failed: '.mysql_error());
require('writeXML.php');

header("location:table_multi.php?which=".$_POST['table']);
?>