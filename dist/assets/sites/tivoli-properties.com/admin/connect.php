<?php
// connect to mysql database
$mqlTable = 'tivolipr_web';
$myConn = mysql_connect('localhost:/tmp/mysql5.sock','tivadmin','ike4951') or die('could not connect: '.mysql_error());
mysql_select_db($mqlTable) or die('could not select database.');
?>