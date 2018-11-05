<?php
// start session
require("session.php");
// connection to DB
require("connect.php");

$which = $_POST['table'];

/* insert POST variables */
//print_r($_POST);
$insertVars = "";
$insertFields = "";	
foreach($_POST as $field => $value) {
	//print("$field = '$value'<BR>");
	if($field!=="id" && $field!=="Submit" && $field!=="table"){	
		$field = mysql_real_escape_string($field);
		$value = mysql_real_escape_string($value);
		$insertVars .= "'$value',";
		$insertFields .= "`$field`,";
	}
}
$insertVars = substr($insertVars,0,strlen($insertVars) - 1);// backup one step to chop ',' off end of query string
$insertFields = substr($insertFields,0,strlen($insertFields) - 1);// backup one step to chop ',' off end of query string
$query = 'INSERT INTO `'.$mqlTable.'`.`'.$which.'` ('.$insertFields.') VALUES ('.$insertVars.');';
//print "$query<br>";
mysql_query($query) or die('Insert failed: '.mysql_error());
require('writeXML.php');

header("location:table_multi.php?which=$which");
?>