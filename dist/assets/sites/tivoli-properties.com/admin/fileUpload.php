<?php 
// start session
require("session.php");
$which = $_GET['which'];

$pageTitle = "Hampton Island Admin - Viewing $which";
$menu = true;
$resize = true;
require("header.php");
	
	// catch undefined errors from optype
	if (!isset($_POST['upload'])) {
		$_POST['upload']="";
	}
	
	if($_POST['upload']=="yes"){
		// Where the file is going to be placed 
		$target_path = "./uploads/";
		
		/* Add the original filename to our target path.  
		Result is "uploads/filename.extension" */

		$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
		
		function my_dir(){
			$arfdn = explode('/', dirname($_SERVER['PHP_SELF']));
			return end($arfdn);
		}

		if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
			echo "The file ".  basename( $_FILES['uploadedfile']['name']). 
			" has been uploaded";
			
		} else{
			echo "There was an error uploading the file, please try again!";
		}
	} else {
?>
<form enctype="multipart/form-data" action="fileUpload.php" method="POST">
<input type="hidden" name="MAX_FILE_SIZE" value="10000000" />
<input type="hidden" name="upload" value="yes" />
<div class="dataGrayBand"><table class="upLoadTbl"><tr><td align="right">Choose a file to upload:&nbsp;<input name="uploadedfile" type="file" />&nbsp;<input class="submitBttn" type="submit" value="Upload File" /></td></tr>
</form>
<?php 
	}
	
// VIEW FILES CURRENTLY IN DIRECTORY	
if ($handle = opendir('./uploads')) {
	echo '<tr><td class="underLine">Files Currently uploaded to server:</td></tr>';
	while (false !== ($file = readdir($handle))) {	
		$ext = substr(strrchr($file, "./uploads"), 1);
		if ($file != "." && $file != ".."){ 
		//if ($file != "." && $file != ".." && $ext == "pdf" || $ext == "PDF"){ 		
			echo '<tr><td class="underLine">'.$file.'</td></tr>';
		}
	}
	echo'</table></div>';
}
closedir($handle);

require("footer.php");
?>
