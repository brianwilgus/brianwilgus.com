<?php
// start session
require("session.php");
// connection to DB
require("connect.php");
// checking out for edit versus insert
if($_GET['id']){
	//echo"id = ".$_GET['id']." this is an edit not insert.";
	$pageTitle = "Tivoli Admin - Edit User";
	$viewAll = 'SELECT * FROM  `register` WHERE `id` = '.$_GET['id'];
	$result = mysql_query($viewAll);
	$record = mysql_fetch_assoc($result);
} else {
	$pageTitle = "HBA Admin - Register Form";
}
$menu = true;
require("header.php");
if($_GET['id']){
	echo"<h2>Editing ".$record['fname']." ".$record['lname']."</h2>";
}
?>
<table width="600" border="1">
  <form name="registration" action="<?php if($_GET['id']){echo"admin_update.php";} else {echo"admin_insert.php"; }?>" method="post" onSubmit="return Validate();">
  <tr>
  	<td colspan="2"><b>Registration Information</b>
  	<?php if($_GET['id']){echo"<input type='hidden' name='id' value='".$record['id']."' />";} ?>
  	</td>
	</tr>
  <tr>
    <td><div align="right">First Name</div></td>
    <td valign="bottom"><input name="fname" type="text" maxlength="32" <?php if($_GET['id']){echo"value='".$record['fname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Last Name</div></td>
    <td valign="bottom"><input name="lname" type="text" maxlength="32" <?php if($_GET['id']){echo"value='".$record['lname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Address 1</div></td>
    <td valign="bottom"><input name="add1" type="text" maxlength="128" <?php if($_GET['id']){echo"value='".$record['add1']."'";} ?> /></td>
  </tr>

  <tr>
    <td><div align="right">Address 2</div></td>
    <td valign="bottom"><input name="add2" type="text" maxlength="128" <?php if($_GET['id']){echo"value='".$record['add2']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">City</div></td>
    <td valign="bottom"><input name="city" type="text" maxlength="64" <?php if($_GET['id']){echo"value='".$record['city']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">State</div></td>
    <td valign="bottom">
      <select name="st">
        <option value="AL" <?php if($_GET['id']){if($record['st']=='AL'){echo'selected=\'selected\' ';}}?>>Alabama</option>
        <option value="AK" <?php if($_GET['id']){if($record['st']=='AK'){echo'selected=\'selected\' ';}}?>>Alaska</option>

        <option value="AZ" <?php if($_GET['id']){if($record['st']=='AZ'){echo'selected=\'selected\' ';}}?>>Arizona</option>
        <option value="AR" <?php if($_GET['id']){if($record['st']=='AR'){echo'selected=\'selected\' ';}}?>>Arkansas</option>
        <option value="CA" <?php if($_GET['id']){if($record['st']=='CA'){echo'selected=\'selected\' ';}}?>>California</option>
        <option value="CO" <?php if($_GET['id']){if($record['st']=='CO'){echo'selected=\'selected\' ';}}?>>Colorado</option>
        <option value="CT" <?php if($_GET['id']){if($record['st']=='CT'){echo'selected=\'selected\' ';}}?>>Connecticut</option>
        <option value="DE" <?php if($_GET['id']){if($record['st']=='DE'){echo'selected=\'selected\' ';}}?>>Delaware</option>

        <option value="DC" <?php if($_GET['id']){if($record['st']=='DC'){echo'selected=\'selected\' ';}}?>>District of Columbia</option>
        <option value="FL" <?php if($_GET['id']){if($record['st']=='FL'){echo'selected=\'selected\' ';}}?>>Florida</option>
        <option value="GA" <?php if($_GET['id']){if($record['st']=='GA'){echo'selected=\'selected\' ';}}?>>Georgia</option>
        <option value="HI" <?php if($_GET['id']){if($record['st']=='HI'){echo'selected=\'selected\' ';}}?>>Hawaii</option>
        <option value="ID" <?php if($_GET['id']){if($record['st']=='ID'){echo'selected=\'selected\' ';}}?>>Idaho</option>
        <option value="IL" <?php if($_GET['id']){if($record['st']=='IL'){echo'selected=\'selected\' ';}}?>>Illinois</option>

        <option value="IN" <?php if($_GET['id']){if($record['st']=='IN'){echo'selected=\'selected\' ';}}?>>Indiana</option>
        <option value="IA" <?php if($_GET['id']){if($record['st']=='IA'){echo'selected=\'selected\' ';}}?>>Iowa</option>
        <option value="KS" <?php if($_GET['id']){if($record['st']=='KS'){echo'selected=\'selected\' ';}}?>>Kansas</option>
        <option value="KY" <?php if($_GET['id']){if($record['st']=='KY'){echo'selected=\'selected\' ';}}?>>Kentucky</option>
        <option value="LA" <?php if($_GET['id']){if($record['st']=='LA'){echo'selected=\'selected\' ';}}?>>Louisiana</option>
        <option value="ME" <?php if($_GET['id']){if($record['st']=='ME'){echo'selected=\'selected\' ';}}?>>Maine</option>

        <option value="MD" <?php if($_GET['id']){if($record['st']=='MD'){echo'selected=\'selected\' ';}}?>>Maryland</option>
        <option value="MA" <?php if($_GET['id']){if($record['st']=='MA'){echo'selected=\'selected\' ';}}?>>Massachusetts</option>
        <option value="MI" <?php if($_GET['id']){if($record['st']=='MI'){echo'selected=\'selected\' ';}}?>>Michigan</option>
        <option value="MN" <?php if($_GET['id']){if($record['st']=='MN'){echo'selected=\'selected\' ';}}?>>Minnesota</option>
        <option value="MS" <?php if($_GET['id']){if($record['st']=='MS'){echo'selected=\'selected\' ';}}?>>Mississippi</option>
        <option value="MO" <?php if($_GET['id']){if($record['st']=='MO'){echo'selected=\'selected\' ';}}?>>Missouri</option>

        <option value="MT" <?php if($_GET['id']){if($record['st']=='MT'){echo'selected=\'selected\' ';}}?>>Montana</option>
        <option value="NE" <?php if($_GET['id']){if($record['st']=='NE'){echo'selected=\'selected\' ';}}?>>Nebraska</option>
        <option value="NV" <?php if($_GET['id']){if($record['st']=='NV'){echo'selected=\'selected\' ';}}?>>Nevada</option>
        <option value="NH" <?php if($_GET['id']){if($record['st']=='NH'){echo'selected=\'selected\' ';}}?>>New Hampshire</option>
        <option value="NJ" <?php if($_GET['id']){if($record['st']=='NJ'){echo'selected=\'selected\' ';}}?>>New Jersey</option>
        <option value="NM" <?php if($_GET['id']){if($record['st']=='NM'){echo'selected=\'selected\' ';}}?>>New Mexico</option>

        <option value="NY" <?php if($_GET['id']){if($record['st']=='NY'){echo'selected=\'selected\' ';}}?>>New York</option>
        <option value="NC" <?php if($_GET['id']){if($record['st']=='NC'){echo'selected=\'selected\' ';}}?>>North Carolina</option>
        <option value="ND" <?php if($_GET['id']){if($record['st']=='ND'){echo'selected=\'selected\' ';}}?>>North Dakota</option>
        <option value="OH" <?php if($_GET['id']){if($record['st']=='OH'){echo'selected=\'selected\' ';}}?>>Ohio</option>
        <option value="OK" <?php if($_GET['id']){if($record['st']=='OK'){echo'selected=\'selected\' ';}}?>>Oklahoma</option>
        <option value="OR" <?php if($_GET['id']){if($record['st']=='OR'){echo'selected=\'selected\' ';}}?>>Oregon</option>

        <option value="PA" <?php if($_GET['id']){if($record['st']=='PA'){echo'selected=\'selected\' ';}}?>>Pennsylvania</option>
        <option value="RI" <?php if($_GET['id']){if($record['st']=='RI'){echo'selected=\'selected\' ';}}?>>Rhode Island</option>
        <option value="SC" <?php if($_GET['id']){if($record['st']=='SC '){echo'selected=\'selected\' ';}}?>>South Carolina</option>
        <option value="SD" <?php if($_GET['id']){if($record['st']=='SD'){echo'selected=\'selected\' ';}}?>>South Dakota</option>
        <option value="TN" <?php if($_GET['id']){if($record['st']=='TN'){echo'selected=\'selected\' ';}}?>>Tennessee</option>
        <option value="TX" <?php if($_GET['id']){if($record['st']=='TX'){echo'selected=\'selected\' ';}}?>>Texas</option>

        <option value="UT" <?php if($_GET['id']){if($record['st']=='UT'){echo'selected=\'selected\' ';}}?>>Utah</option>
        <option value="VT" <?php if($_GET['id']){if($record['st']=='VT'){echo'selected=\'selected\' ';}}?>>Vermont</option>
        <option value="VA" <?php if($_GET['id']){if($record['st']=='VA'){echo'selected=\'selected\' ';}}?>>Virginia</option>
        <option value="WA" <?php if($_GET['id']){if($record['st']=='WA'){echo'selected=\'selected\' ';}}?>>Washington</option>
        <option value="WV" <?php if($_GET['id']){if($record['st']=='WV'){echo'selected=\'selected\' ';}}?>>West Virginia</option>
        <option value="WI" <?php if($_GET['id']){if($record['st']=='WI'){echo'selected=\'selected\' ';}}?>>Wisconsin</option>

        <option value="WY" <?php if($_GET['id']){if($record['st']=='WY'){echo'selected=\'selected\' ';}}?>>Wyoming</option>
      </select>      </td>
  </tr>
  <tr>
    <td><div align="right">Zip</div></td>
    <td valign="bottom"><input name="zip" type="text" maxlength="6" <?php if($_GET['id']){echo"value='".$record['zip']."'";} ?> /></td>
  </tr>

  <tr>
    <td><div align="right">Phone</div></td>
    <td valign="bottom"><input name="phone" type="text" maxlength="32" <?php if($_GET['id']){echo"value='".$record['phone']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Email</div></td>
    <td valign="bottom"><input name="email" type="text" maxlength="64" <?php if($_GET['id']){echo"value='".$record['email']."'";} ?> /></td>
  </tr>

  <tr>
    <td valign="top"><div align="right">Where did you hear about Get Home Atlanta (check all that apply)?</div></td>
    <td valign="bottom">
    <input type="checkbox" name="sourcea" value="1" <?php if($_GET['id']){if($record['sourcea']){echo"checked";}} ?>/>Newspaper<br />
    <input type="checkbox" name="sourceb" value="1" <?php if($_GET['id']){if($record['sourceb']){echo"checked";}} ?>/>Magazine<br />
    <input type="checkbox" name="sourcec" value="1" <?php if($_GET['id']){if($record['sourcec']){echo"checked";}} ?>/>Radio<br />
    <input type="checkbox" name="sourced" value="1" <?php if($_GET['id']){if($record['sourced']){echo"checked";}} ?>/>TV<br />

    <input type="checkbox" name="sourcee" value="1" <?php if($_GET['id']){if($record['sourcee']){echo"checked";}} ?>/>Billboard<br />
    <input type="checkbox" name="sourcef" value="1" <?php if($_GET['id']){if($record['sourcef']){echo"checked";}} ?>/>Online Web Banner<br />
    <input type="checkbox" name="sourceg" value="1" <?php if($_GET['id']){if($record['sourceg']){echo"checked";}} ?>/>Marta<br />
    <input type="checkbox" name="sourceh" value="1" <?php if($_GET['id']){if($record['sourceh']){echo"checked";}} ?>/>Agent<br />
    <input type="checkbox" name="sourcei" value="1" <?php if($_GET['id']){if($record['sourcei']){echo"checked";}} ?>/>Friend/Coworker/Family Member<br />
    Other<br />

    <input type="text" name="sourcej"  maxlength="128" <?php if($_GET['id']){echo"value='".$record['sourcej']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Are you currently in the process of buying a new home?</div></td>
    <td valign="bottom"><input type="radio" name="process" value="true" <?php if($_GET['id']){if($record['process']){echo"checked";}} ?>>Yes<input type="radio" name="process" value="false"<?php if($_GET['id']){if(!$record['process']){echo"checked";}} ?>>No</td>
  </tr>

  <tr>
  	<td colspan="2"><strong>If are buying a new home, please answer the following questions:</strong></td>
  	</tr>
  <tr>
    <td><div align="right">Are you working with an agent or broker?</div></td>
    <td valign="bottom"><input type="radio" name="ifagent" value="true" <?php if($_GET['id']){if($record['ifagent']){echo"checked";}} ?>>Yes<input type="radio" name="ifagent" value="false" <?php if($_GET['id']){if(!$record['process']){echo"checked";}} ?>>No</td>
  </tr>
  <tr>
    <td colspan="2"><div align="left"><strong>If so, the information about the person:</strong></div></td>
    </tr>
  <tr>
    <td><div align="right">Agent First Name</div></td>
    <td valign="bottom"><input name="afname" type="text" maxlength="128" <?php if($_GET['id']){echo"value='".$record['afname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Agent Last Name</div></td>
    <td valign="bottom"><input name="alname" type="text" maxlength="128" <?php if($_GET['id']){echo"value='".$record['alname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Agent Phone</div></td>
    <td valign="bottom"><input name="aphone" type="text" maxlength="32" <?php if($_GET['id']){echo"value='".$record['aphone']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Are you working with a loan officer to get financing for your new home purchase?</div></td>
    <td valign="bottom"><input type="radio" name="ifloanof" value="true" <?php if($_GET['id']){if($record['ifloanof']){echo"checked";}} ?>>Yes<input type="radio" name="ifloanof" value="false" <?php if($_GET['id']){if(!$record['ifloanof']){echo"checked";}} ?>>No</td>
  </tr>
  <tr>
    <td colspan="2"><div align="left"><strong>If so, the information about the person:</strong></div></td>
    </tr>
  <tr>
    <td><div align="right">Loan Officer First Name</div></td>
    <td valign="bottom"><input name="lfname" type="text" id="lfname" maxlength="128" <?php if($_GET['id']){echo"value='".$record['lfname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Loan Officer Last Name</div></td>
    <td valign="bottom"><input name="llname" type="text" id="llname" maxlength="128" <?php if($_GET['id']){echo"value='".$record['llname']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Loan Officer Phone</div></td>
    <td valign="bottom"><input name="lphone" type="text" id="lphone" maxlength="32" <?php if($_GET['id']){echo"value='".$record['lphone']."'";} ?> /></td>
  </tr>
  <tr>
    <td><div align="right">Loan Officer Company </div></td>
    <td valign="bottom"><input name="lcomp" type="text" id="lcomp" maxlength="128" <?php if($_GET['id']){echo"value='".$record['lcomp']."'";} ?> /></td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
	<td><input name="submit" type="submit" value="<?php if($_GET['id']){echo"Update";}else{echo"Register";} ?>" />&nbsp;&nbsp;&nbsp;<input name="Clear Form" type="reset" value="Clear Form" /></td>
  </tr>
  </form>
</table>

<?php
require("footer.php");
?>