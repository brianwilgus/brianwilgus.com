<?php
$pageTitle = "Hampton Island Admin - User Login";
$menu = false;
require("header.php");
?>
<form id="userform" name="userform" method="post" action="session_checkuser.php">
<div class="grayBand">
<table class-"logoTbl" width="100%"><tr><td class="logo"><img src="../images/adminLogo.gif" /></td><td class="borderLine">&nbsp;</td></tr></table>
	<table  class="formTbl">
	  <tr>
		<td colspan="2"><div class="tblHdr">Administrative Log-in</div></td>
	  </tr>
	  <tr>
		<td class="formTblBody" align="right">log in:</td>
		<td><input type="text" name="username" /></td>
	  </tr>
	  <tr>
		<td class="formTblBody" align="right">password:</td>
		<td><input type="password" name="password" /></td>
	  </tr>
	  <tr>
		<td class="bttnRow" colspan="2"><input class="submitBttn" type="submit" name="Submit" value="Submit" /></td>
	  </tr>
	</table>
</div>
</form>
<?php
require("footer.php");
?>