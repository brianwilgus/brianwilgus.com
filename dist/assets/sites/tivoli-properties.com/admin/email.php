<?php
$to = "contact@brianwilgus.com";
$from = "bwilgus@fullcp.com";
$subject = "Mail Test";
$body = "Mail Test Body";
ini_set("SMTP","localhost");
ini_set("sendmail_from",$from);
$result = mail($to, $subject, $body, "From: $from");
print($result);
?>