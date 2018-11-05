<?php
$to = "contact@brianwilgus.com";
$from = $_POST['myEmail'];
$subject = "Contact from Tivoli Web Form";
$body = "From ".$_POST['myName'].": ".$_POST['myMsg'];
ini_set("SMTP","localhost");
ini_set("sendmail_from",$from);
$result = mail($to, $subject, $body, "From: $from");
print("$to, $subject, $body, From: $from");

/*
$to = "bwilgus@fullcp.com";
$from = $_POST['myEmail'];
$subject = "Contact from Tivoli Web Form";
$body = "From ".$_POST['myName'].": ".$_POST['myMsg'];
ini_set("SMTP","localhost");
ini_set("sendmail_from",$from);
$result = mail($to, $subject, $body, "From: $from");
*/
?>