<?php
// start session
require("session.php");
// connection to DB
require("connect.php");

$which = $_GET['which'];

$pageTitle = "Tivoli Admin - Viewing $which";
$menu = true;
require("header.php");

//$viewAll = 'SELECT id, title, desc, link, date FROM `'.$which.'` ';
$viewAll = 'SELECT * FROM `'.$which.'` ';
//echo"$viewAll";
$result = mysql_query($viewAll);
$table = "<table border=1>";
$record = mysql_fetch_assoc($result);
$content = "";

// set the key row
$keyRow = "<tr>";
foreach($record as $field => $value){
	$keyRow .= "<td><b>$field</b></td>";
}
$keyRow .= "<td><b>&nbsp;</b></td><td><b>&nbsp;</b></td></tr>";

// set the insert row
$insRow = "<tr><form name='insert'>";
foreach($record as $field => $value){
	if($field=='id'){
		$insRow .= "<td>#</td>";
	}else {
		$insRow .= "<td><input type='text' name='$field' value='&nbsp;' /></td>";
	}
}
$insRow .= "<td><a href='table_insert.php?which=$which'>insert</a></td><td><b>&nbsp;</b></td></form></tr>";

// reset internal pointer
$record = mysql_data_seek($result,0);

// build the content
$i=1;
while ($record = mysql_fetch_assoc($result)){
	$content .= "<form name='$which$i'><tr>";
	foreach($record as $field => $value){
		if($field=='id'){$id = $value; }
		$content .= "<td>$value</td>";
	}
	$content .= "<td><a href='table_edit.php?which=$which,id=$id'>edit</a></form></td><td><a href='table_delete.php?which=$which,id=$id'>delete</a></td></tr>";
}
// build table
$table .= $keyRow.$content.$insRow;
$table .= "</table>";
print($table);


require("footer.php");
?>