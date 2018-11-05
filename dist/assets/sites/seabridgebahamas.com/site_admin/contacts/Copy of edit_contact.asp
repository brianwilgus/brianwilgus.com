<% Dim strBodyID
strBodyID = "pg_add" %>

<!-- #Include Virtual="site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual="site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual="site_admin/includes/connection_open.asp" -->

<!-- #Include Virtual="site_admin/includes/header_contacts.asp" -->

  <div id="main">
    <div id="col1" class="div_height"><img src="../admin-images/logo_club_of_the_isle.gif" alt="The Club of the Isle" /></div>
    <%
Function Selected(firstval, secondval)
	If firstval = secondval Then
		Selected = "selected"
	End if
End function

Function Checked2(f,s)
	ii = 0
	If ISNULL(f) = false Then
		strString = SPLIT(f,",")
		intArraySize = UBound(strString) + 1
		Do While ii < intArraySize
			If TRIM(Cstr(strString(ii))) = TRIM(Cstr(s)) Then
				Checked2 = "checked"
			End If
			ii = ii + 1
		Loop
	End If
End Function

Function Checked(firstvalue,secondvalue)
	If firstvalue = secondvalue Then
		Checked = "checked"
	End If
End Function

'GET CUSTOMER FROM DATABASE
With cmdSQL
		.CommandType = adCmdStoredProc
		.CommandText = "SPV_get_contact"
		.Parameters.Append .CreateParameter("contact_id",adInteger,adParamInput,,Request.QueryString("id"))
End With

rsSQL.Open cmdSQL, , adOpenStatic

' ERROR HANDLING
If Err.number <> 0 Or cnSQL.Errors.Count > 0 Then
	Response.Write Err.Description
	Response.End
End If
%>
    <div id="col2" class="div_height">
      <div id="form_area">
<form name="form1" method="post" action="create_edit_process.asp?mode=edit&source=admin" onSubmit="return Validate();">
	  <table>
        <tr>
          <td align="left"><span><span class="required">*</span></span>First Name:</td>
          <td align="left"><input name="first_name" type="text" id="first_name" maxlength="40" style="width: 160px;" value="<% = rsSQL("First_Name") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>Last Name:</td>
          <td align="left"><input name="last_name" type="text" id="last_name" maxlength="40" style="width: 160px;" value="<% = rsSQL("Last_Name") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>Street Address:</td>
          <td align="left"><input name="address" type="text" id="address" maxlength="40" style="width: 300px;" value="<% = rsSQL("Address1") %>" /></td>
        </tr>
        <tr>
          <td align="left">&nbsp;</td>
          <td align="left"><input name="address2" type="text" id="address2" maxlength="40" style="width: 300px;" value="<% = rsSQL("Address2") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>City:</td>
          <td align="left"><input name="city" type="text" id="city" maxlength="40" style="width: 160px;" value="<% = rsSQL("City") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>State / Province:</td>
          <td align="left"><select name="state" id="state">
              <option value="" selected="selected">Select a State</option>
              <option value="AL" <% = Selected(rsSQL("State"), "AL") %>>AL</option>
              <option value="AK" <% = Selected(rsSQL("State"), "AK") %>>AK</option>
              <option value="AZ" <% = Selected(rsSQL("State"), "AZ") %>>AZ</option>
              <option value="AR" <% = Selected(rsSQL("State"), "AR") %>>AR</option>
              <option value="CA" <% = Selected(rsSQL("State"), "CA") %>>CA</option>
              <option value="CO" <% = Selected(rsSQL("State"), "CO") %>>CO</option>
              <option value="CT" <% = Selected(rsSQL("State"), "CT") %>>CT</option>
              <option value="DE" <% = Selected(rsSQL("State"), "DE") %>>DE</option>
              <option value="DC" <% = Selected(rsSQL("State"), "DC") %>>DC</option>
              <option value="FL" <% = Selected(rsSQL("State"), "FL") %>>FL</option>
              <option value="GA" <% = Selected(rsSQL("State"), "GA") %>>GA</option>
              <option value="HI" <% = Selected(rsSQL("State"), "HI") %>>HI</option>
              <option value="ID" <% = Selected(rsSQL("State"), "ID") %>>ID</option>
              <option value="IL" <% = Selected(rsSQL("State"), "IL") %>>IL</option>
              <option value="IN" <% = Selected(rsSQL("State"), "IN") %>>IN</option>
              <option value="IA" <% = Selected(rsSQL("State"), "IA") %>>IA</option>
              <option value="KS" <% = Selected(rsSQL("State"), "KS") %>>KS</option>
              <option value="KY" <% = Selected(rsSQL("State"), "KY") %>>KY</option>
              <option value="LA" <% = Selected(rsSQL("State"), "LA") %>>LA</option>
              <option value="ME" <% = Selected(rsSQL("State"), "ME") %>>ME</option>
              <option value="MD" <% = Selected(rsSQL("State"), "MD") %>>MD</option>
              <option value="MA" <% = Selected(rsSQL("State"), "MA") %>>MA</option>
              <option value="MI" <% = Selected(rsSQL("State"), "MI") %>>MI</option>
              <option value="MN" <% = Selected(rsSQL("State"), "MN") %>>MN</option>
              <option value="MS" <% = Selected(rsSQL("State"), "MS") %>>MS</option>
              <option value="MO" <% = Selected(rsSQL("State"), "MO") %>>MO</option>
              <option value="MT" <% = Selected(rsSQL("State"), "MT") %>>MT</option>
              <option value="NE" <% = Selected(rsSQL("State"), "NE") %>>NE</option>
              <option value="NV" <% = Selected(rsSQL("State"), "NV") %>>NV</option>
              <option value="NH" <% = Selected(rsSQL("State"), "NH") %>>NH</option>
              <option value="NJ" <% = Selected(rsSQL("State"), "NJ") %>>NJ</option>
              <option value="NY" <% = Selected(rsSQL("State"), "NY") %>>NY</option>
              <option value="NC" <% = Selected(rsSQL("State"), "ND") %>>NC</option>
              <option value="ND" <% = Selected(rsSQL("State"), "ND") %>>ND</option>
              <option value="OH" <% = Selected(rsSQL("State"), "OH") %>>OH</option>
              <option value="OK" <% = Selected(rsSQL("State"), "OK") %>>OK</option>
              <option value="OR" <% = Selected(rsSQL("State"), "OR") %>>OR</option>
              <option value="PA" <% = Selected(rsSQL("State"), "PA") %>>PA</option>
              <option value="RI" <% = Selected(rsSQL("State"), "RI") %>>RI</option>
              <option value="SC" <% = Selected(rsSQL("State"), "SC") %>>SC</option>
              <option value="SD" <% = Selected(rsSQL("State"), "SD") %>>SD</option>
              <option value="TN" <% = Selected(rsSQL("State"), "TN") %>>TN</option>
              <option value="TX" <% = Selected(rsSQL("State"), "TX") %>>TX</option>
              <option value="UT" <% = Selected(rsSQL("State"), "UT") %>>UT</option>
              <option value="VT" <% = Selected(rsSQL("State"), "VT") %>>VT</option>
              <option value="VA" <% = Selected(rsSQL("State"), "VA") %>>VA</option>
              <option value="WA" <% = Selected(rsSQL("State"), "WA") %>>WA</option>
              <option value="WV" <% = Selected(rsSQL("State"), "WV") %>>WV</option>
              <option value="WI" <% = Selected(rsSQL("State"), "WI") %>>WI</option>
              <option value="WY" <% = Selected(rsSQL("State"), "WY") %>>WY</option>
            </select>          </td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>Zip:</td>
          <td align="left"><input name="zip" type="text" id="zip" maxlength="40" style="width: 100px;" value="<% = rsSQL("Zip") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>Email Address:</td>
          <td align="left"><input name="email" type="text" id="email" maxlength="100" style="width: 200px;" value="<% = rsSQL("Email") %>" /></td>
        </tr>
        <tr>
          <td align="left"><span><span class="required">*</span></span>Phone:</td>
          <td align="left"><input name="phone" type="text" id="phone" maxlength="40" style="width: 200px;" value="<% = rsSQL("Day_Phone") %>" /></td>
        </tr>
		<tr>
			  <td align="left">Evening Phone:</td>
			  <td align="left"><input name="phone2" type="text" id="phone2" maxlength="14" style="width: 100px;" value="<% = rsSQL("Phone2") %>" /></td>
		  </tr>
        <tr>
          <td align="left" valign="baseline"><span class="required"><span class="required">*</span></span>How did you find out about us? </td>
          <td align="left" valign="baseline">
		    <input name="how_found" type="radio" value="Signage" <% = Checked2(rsSQL("how_found"),"Signage") %> />Signage<br />
            <input name="how_found" type="radio" value="Friend" <% = Checked2(rsSQL("how_found"),"Friend") %> />Friend<br />
            <input name="how_found" type="radio" value="Magazine" <% = Checked2(rsSQL("how_found"),"Magazine") %> />Magazine&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="how_found_magazine">
					<option value="">Magazine Name...</option>
					<option value="Magazine 1" <% = Selected(rsSQL("How_Found_Magazine"),"Magazine 1") %>>Magazine 1</option>
					<option value="Magazine 2" <% = Selected(rsSQL("How_Found_Magazine"),"Magazine 2") %>>Magazine 3</option>
					<option value="Magazine 3" <% = Selected(rsSQL("How_Found_Magazine"),"Magazine 3") %>>Magazine 3</option>
					<option value="Magazine 4" <% = Selected(rsSQL("How_Found_Magazine"),"Magazine 4") %>>Magazine 4</option>
				</select><br />
            <input name="how_found" type="radio" value="Newspaper" <% = Checked2(rsSQL("how_found"),"Newspaper") %> />Newspaper&nbsp;
			<select name="how_found_newspaper">
					<option value="">Newspaper Name...</option>
					<option value="Newspaper 1" <% = Selected(rsSQL("How_Found_Newspaper"),"Newspaper 1") %>>Newspaper 1</option>
					<option value="Newspaper 2" <% = Selected(rsSQL("How_Found_Newspaper"),"Newspaper 2") %>>Newspaper 3</option>
					<option value="Newspaper 3" <% = Selected(rsSQL("How_Found_Newspaper"),"Newspaper 3") %>>Newspaper 3</option>
					<option value="Newspaper 4" <% = Selected(rsSQL("How_Found_Newspaper"),"Newspaper 4") %>>Newspaper 4</option>
			  </select><br />
            <input name="how_found" type="radio" value="Other" <% = Checked2(rsSQL("how_found"),"Other") %> />Other&nbsp;&nbsp;
            <input name="how_found_other" type="text"  maxlength="60" style="width: 144px;" value="<% = rsSQL("how_found_other") %>" /></td>
        </tr>
        <tr>
          <td align="left" valign="top">Comments: </td>
          <td align="left" valign="top"><textarea name="comments" cols="150" rows="3" id="comments" style="width: 200px;"><% = rsSQL("Comments") %></textarea></td>
        </tr>
        <tr>
          <td colspan="3" height="50" align="center">
		  <input type="hidden" name="contact_id" value="<% = Request.QueryString("id") %>" />
		  <input name="Submit" type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;<input name="Reset" type="reset" />&nbsp;&nbsp;&nbsp;&nbsp;<span><span class="required">*</span>Required Fields</span></td>
        </tr>
      </table>
    </form>
      </div>
    </div>
  </div>
  <div class="clear"><!-- This clears the floats --></div>
  <div id="page">&nbsp;<!-- This div used in the List page -->&nbsp;</div>
  <div id="base"><img src="../admin-images/img_base.gif" alt="Club of the Isle :: Bottom Gradation" /></div>
</div>
</body>
</html>
<!-- #Include Virtual = "site_admin/includes/connection_close.asp" -->