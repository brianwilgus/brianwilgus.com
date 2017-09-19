<?php
if ($handle = opendir('.')) {

echo "filelist=";
while (false !== ($file = readdir($handle))) {

$ext = substr(strrchr($file, "."), 1);
if ($file != "." && $file != ".." && $ext == "jpg" || $ext == "JPG") {

echo "$file";
echo ",";

}

}
closedir($handle);
echo "null";

}
?>