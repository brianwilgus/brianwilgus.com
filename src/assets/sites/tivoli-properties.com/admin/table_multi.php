<?php
// start session
require("session.php");
// connection to DB
require("connect.php");

$which = $_GET['which'];

$pageTitle = "Hampton Island Admin - Viewing $which";
$menu = true;
require("header.php");

//$viewAll = 'SELECT id, title, desc, link, date FROM `'.$which.'` ';
$viewAll = 'SELECT * FROM `'.$which.'` ORDER BY date DESC';
//echo"$viewAll";
$result = mysql_query($viewAll);
$table = '<div class="dataGrayBand"><table class="dataTbl">';
$record = mysql_fetch_assoc($result);
$content = "";

// set the key row
$keyRow = "<tr>";
foreach($record as $field => $value){
	$keyRow .= "<td><b>$field</b></td>";
}
$keyRow .= "<td><b>&nbsp;</b></td><td><b>&nbsp;</b></td></tr>";

// set the insert row
$insRow = "<form name='$which$i' method=\"post\" action=\"table_insert.php\"><tr>";
foreach($record as $field => $value){
	if($field=='id'){
		$insRow .= "<td>#<input type='hidden' name='table' value=\"$which\" /></td>";
	} elseif($field=='link'){
		$insRow .= "<td>";
		//$insRow .= "<input type='hidden' name='table' value=\"$which\" />";
		$insRow .= "<select name='link'>";
		
		// GET DIRECTORY FROM SERVER// VIEW FILES CURRENTLY IN DIRECTORY	
		if ($handle = opendir('./uploads')) {
			while (false !== ($file = readdir($handle))) {	
				$ext = substr(strrchr($file, "./uploads"), 1);
				if ($file != "." && $file != ".."){ 
					if($value==$file){
						$insRow .= "<option value='$file' selected='selected'>$file</option>";
					}else{
						$insRow .= "<option value='$file'>$file</option>";
					}
				}
			}
		}
		closedir($handle);
		
		$insRow .= "</select>";
		
		$insRow .= "</td>";
	}else {
		$insRow .= "<td><input type='text' name='$field' value='' /></td>";
	}
}
$insRow .= "<td><input type='submit' name='Submit' value='insert' /></td><td><b>&nbsp;</b></td></form></tr>";

// reset internal pointer
$record = mysql_data_seek($result,0);

// build the content
$i=1;
while ($record = mysql_fetch_assoc($result)){
	$content .= "<form name='$which$i' method=\"post\" action=\"table_update.php\"><tr>";
	foreach($record as $field => $value){
		if($field=='id'){
			$id = $value;
			$content .= "<td>$value<input type='hidden' name='id' value=\"$value\" /><input type='hidden' name='table' value=\"$which\" /></td>";
	} elseif($field=='link'){
		$content .= "<td>";
		//$insRow .= "<input type='hidden' name='table' value=\"$which\" />";
		$content .= "<select name='link'>";
		
		// GET DIRECTORY FROM SERVER// VIEW FILES CURRENTLY IN DIRECTORY	
		if ($handle = opendir('./uploads')) {
			while (false !== ($file = readdir($handle))) {	
				$ext = substr(strrchr($file, "./uploads"), 1);
				if ($file != "." && $file != ".."){ 
					if($value==$file){
						$content .= "<option value='$file' selected='selected'>$file</option>";
					}else{
						$content .= "<option value='$file'>$file</option>";
					}
				}
			}
		}
		closedir($handle);
		
		$content .= "</select>";
		
		$content .= "</td>";
		} else {
			$content .= "<td><input type='text' name=\"$field\" value=\"$value\" /></td>";
		}
	}
	$content .= "<td><input type='submit' name='Submit' value='update' /></form></td>
	<td><form name='delete$id' method='post' action='table_delete.php'><input type='hidden' name='id' value='$id' /><input type='hidden' name='table' value='$which' /><input type='submit' name='Submit' value='delete' /></form>
	</td></tr>";
}
// build table
$table .= $keyRow.$content.$insRow;
$table .= "</table></div>";
print($table);


require("footer.php");
?>