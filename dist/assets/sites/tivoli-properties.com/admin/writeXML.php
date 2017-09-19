<?php
// start session
require("session.php");
// connect to database
require('connect.php');

$which = $_POST['table'];

$viewAll = 'SELECT * FROM `'.$which.'` ORDER BY date DESC LIMIT 10';
$result = mysql_query($viewAll);

$xmlOutput = "<?xml version=\"1.0\"?><$which>";
while ($record = mysql_fetch_assoc($result)){
// AS ATTRIBUTES
/**/
	$xmlOutput .= "<item";
	foreach($record as $field => $value){
		$xmlOutput .= " $field=\"$value\"";
	}
	$xmlOutput .= " />";

// AS NODES
/*
	$xmlOutput .= "<item>";
	foreach($record as $field => $value){
		$xmlOutput .= "<$field>$value</$field>";
	}
	$xmlOutput .= "</item>";
*/
}
$xmlOutput .= "</$which>";
//echo"<pre>";
//print($xmlOutput);

$filename = $which.'.xml';
$handle = fopen($filename, 'w');
fwrite($handle, $xmlOutput);
fclose($handle);
?>