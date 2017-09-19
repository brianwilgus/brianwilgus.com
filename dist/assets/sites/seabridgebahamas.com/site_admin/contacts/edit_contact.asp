<% Dim strBodyID
strBodyID = "pg_edit" %>

<!-- #Include Virtual="site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual="site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual="site_admin/includes/connection_open.asp" -->

<!-- #Include Virtual="site_admin/includes/header_contacts.asp" -->
  <div id="main">
    <div id="col1" class="div_height"><img src="../admin-images/logo_seabridge_bahamas.gif" alt="Seabridge bahamas" /></div>
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
		<form action="create_edit_process.asp?mode=edit&source=admin" method="post" id="form1" onsubmit="return Validate();">
      <table class="formTable">
        <tr>
          <th style="padding-top:10px;"><span class="required">*</span>First Name:</th>
          <td style="padding-top:10px;"><input name="first_name" type="text" id="first_name" maxlength="50" style="width: 160px;" value="<% = rsSQL("First_Name") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Last Name:</th>
          <td><input name="last_name" type="text" id="last_name" maxlength="50" style="width: 160px;" value="<% = rsSQL("Last_Name") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Street Address:</th>
          <td><input name="address" type="text" id="address" maxlength="60" style="width: 300px;" value="<% = rsSQL("Address1") %>" /></td>
        </tr>
        <tr>
          <th><!-- nothing in this area --></th>
          <td><input name="address2" type="text" id="address2" maxlength="60" style="width: 300px;" value="<% = rsSQL("Address2") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>City:</th>
          <td><input name="city" type="text" id="city" maxlength="50" style="width: 160px;" value="<% = rsSQL("City") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Country:</th>
            <td>
		    <select name="country" onchange="setState();">
			<option value=""></option>
			<option value="AF" <% = Selected(rsSQL("Country"), "AF") %>>Afghanistan</option>
			<option value="AL" <% = Selected(rsSQL("Country"), "AL") %>>Albania</option>
			<option value="DZ" <% = Selected(rsSQL("Country"), "DZ") %>>Algeria</option>
			<option value="AS" <% = Selected(rsSQL("Country"), "AS") %>>American Samoa</option>
			
			<option value="AD" <% = Selected(rsSQL("Country"), "AD") %>>Andorra</option>
			<option value="AO" <% = Selected(rsSQL("Country"), "AO") %>>Angola</option>
			<option value="AI" <% = Selected(rsSQL("Country"), "AI") %>>Anguilla</option>
			<option value="AQ" <% = Selected(rsSQL("Country"), "AQ") %>>Antarctica</option>
			<option value="AG" <% = Selected(rsSQL("Country"), "AG") %>>Antigua And Barbuda</option>
			<option value="AR" <% = Selected(rsSQL("Country"), "AR") %>>Argentina</option>
			<option value="AM" <% = Selected(rsSQL("Country"), "AM") %>>Armenia</option>
			<option value="AW" <% = Selected(rsSQL("Country"), "AW") %>>Aruba</option>
			<option value="AU" <% = Selected(rsSQL("Country"), "AU") %>>Australia</option>
			
			<option value="AT" <% = Selected(rsSQL("Country"), "AT") %>>Austria</option>
			<option value="AZ" <% = Selected(rsSQL("Country"), "AZ") %>>Azerbaijan</option>
			<option value="BS" <% = Selected(rsSQL("Country"), "BS") %>>Bahamas</option>
			<option value="BH" <% = Selected(rsSQL("Country"), "BH") %>>Bahrain</option>
			<option value="BD" <% = Selected(rsSQL("Country"), "BD") %>>Bangladesh</option>
			<option value="BB" <% = Selected(rsSQL("Country"), "BB") %>>Barbados</option>
			<option value="BY" <% = Selected(rsSQL("Country"), "BY") %>>Belarus</option>
			<option value="BE" <% = Selected(rsSQL("Country"), "BE") %>>Belgium</option>
			<option value="BZ" <% = Selected(rsSQL("Country"), "BZ") %>>Belize</option>
			
			<option value="BJ" <% = Selected(rsSQL("Country"), "BJ") %>>Benin</option>
			<option value="BM" <% = Selected(rsSQL("Country"), "BM") %>>Bermuda</option>
			<option value="BT" <% = Selected(rsSQL("Country"), "BT") %>>Bhutan</option>
			<option value="BO" <% = Selected(rsSQL("Country"), "BO") %>>Bolivia</option>
			<option value="BA" <% = Selected(rsSQL("Country"), "BA") %>>Bosnia And Herzegowina</option>
			<option value="BW" <% = Selected(rsSQL("Country"), "BW") %>>Botswana</option>
			<option value="BV" <% = Selected(rsSQL("Country"), "BV") %>>Bouvet Island</option>
			<option value="BR" <% = Selected(rsSQL("Country"), "BR") %>>Brazil</option>
			<option value="IO" <% = Selected(rsSQL("Country"), "IO") %>>British Indian Ocean Territory</option>
			
			<option value="BN" <% = Selected(rsSQL("Country"), "BN") %>>Brunei Darussalam</option>
			<option value="BG" <% = Selected(rsSQL("Country"), "BG") %>>Bulgaria</option>
			<option value="BF" <% = Selected(rsSQL("Country"), "BF") %>>Burkina Faso</option>
			<option value="BI" <% = Selected(rsSQL("Country"), "BI") %>>Burundi</option>
			<option value="KH" <% = Selected(rsSQL("Country"), "KH") %>>Cambodia</option>
			<option value="CM" <% = Selected(rsSQL("Country"), "CM") %>>Cameroon</option>
			<option value="CA" <% = Selected(rsSQL("Country"), "CA") %>>Canada</option>
			<option value="CV" <% = Selected(rsSQL("Country"), "CV") %>>Cape Verde</option>
			<option value="KY" <% = Selected(rsSQL("Country"), "KY") %>>Cayman Islands</option>
			
			<option value="CF" <% = Selected(rsSQL("Country"), "CF") %>>Central African Republic</option>
			<option value="TD" <% = Selected(rsSQL("Country"), "TD") %>>Chad</option>
			<option value="CL" <% = Selected(rsSQL("Country"), "CL") %>>Chile</option>
			<option value="CN" <% = Selected(rsSQL("Country"), "CN") %>>China</option>
			<option value="CX" <% = Selected(rsSQL("Country"), "CX") %>>Christmas Island</option>
			<option value="CC" <% = Selected(rsSQL("Country"), "CC") %>>Cocos (Keeling) Islands</option>
			<option value="CO" <% = Selected(rsSQL("Country"), "CO") %>>Colombia</option>
			<option value="KM" <% = Selected(rsSQL("Country"), "KM") %>>Comoros</option>
			<option value="CG" <% = Selected(rsSQL("Country"), "CG") %>>Congo</option>
			
			<option value="CK" <% = Selected(rsSQL("Country"), "CK") %>>Cook Islands</option>
			<option value="CR" <% = Selected(rsSQL("Country"), "CR") %>>Costa Rica</option>
			<option value="CI" <% = Selected(rsSQL("Country"), "CI") %>>Cote D'Ivoire</option>
			<option value="HR" <% = Selected(rsSQL("Country"), "HR") %>>Croatia (Local Name: Hrvatska)</option>
			<option value="CU" <% = Selected(rsSQL("Country"), "CU") %>>Cuba</option>
			<option value="CY" <% = Selected(rsSQL("Country"), "CY") %>>Cyprus</option>
			<option value="CZ" <% = Selected(rsSQL("Country"), "CZ") %>>Czech Republic</option>
			<option value="DK" <% = Selected(rsSQL("Country"), "DK") %>>Denmark</option>
			<option value="DJ" <% = Selected(rsSQL("Country"), "DJ") %>>Djibouti</option>
			
			<option value="DM" <% = Selected(rsSQL("Country"), "DM") %>>Dominica</option>
			<option value="DO" <% = Selected(rsSQL("Country"), "DO") %>>Dominican Republic</option>
			<option value="TP" <% = Selected(rsSQL("Country"), "TP") %>>East Timor</option>
			<option value="EC" <% = Selected(rsSQL("Country"), "EC") %>>Ecuador</option>
			<option value="EG" <% = Selected(rsSQL("Country"), "EG") %>>Egypt</option>
			<option value="SV" <% = Selected(rsSQL("Country"), "SV") %>>El Salvador</option>
			<option value="GQ" <% = Selected(rsSQL("Country"), "GQ") %>>Equatorial Guinea</option>
			<option value="ER" <% = Selected(rsSQL("Country"), "ER") %>>Eritrea</option>
			<option value="EE" <% = Selected(rsSQL("Country"), "EE") %>>Estonia</option>
			
			<option value="ET" <% = Selected(rsSQL("Country"), "ET") %>>Ethiopia</option>
			<option value="FK" <% = Selected(rsSQL("Country"), "FK") %>>Falkland Islands (Malvinas)</option>
			<option value="FO" <% = Selected(rsSQL("Country"), "FO") %>>Faroe Islands</option>
			<option value="FJ" <% = Selected(rsSQL("Country"), "FJ") %>>Fiji</option>
			<option value="FI" <% = Selected(rsSQL("Country"), "FI") %>>Finland</option>
			<option value="FR" <% = Selected(rsSQL("Country"), "FR") %>>France</option>
			<option value="GF" <% = Selected(rsSQL("Country"), "GF") %>>French Guiana</option>
			<option value="PF" <% = Selected(rsSQL("Country"), "PF") %>>French Polynesia</option>
			<option value="TF" <% = Selected(rsSQL("Country"), "TF") %>>French Southern Territories</option>
			
			<option value="GA" <% = Selected(rsSQL("Country"), "GA") %>>Gabon</option>
			<option value="GM" <% = Selected(rsSQL("Country"), "GM") %>>Gambia</option>
			<option value="GE" <% = Selected(rsSQL("Country"), "GE") %>>Georgia</option>
			<option value="DE" <% = Selected(rsSQL("Country"), "DE") %>>Germany</option>
			<option value="GH" <% = Selected(rsSQL("Country"), "GH") %>>Ghana</option>
			<option value="GI" <% = Selected(rsSQL("Country"), "GI") %>>Gibraltar</option>
			<option value="GR" <% = Selected(rsSQL("Country"), "GR") %>>Greece</option>
			<option value="GL" <% = Selected(rsSQL("Country"), "GL") %>>Greenland</option>
			<option value="GD" <% = Selected(rsSQL("Country"), "GD") %>>Grenada</option>
			
			<option value="GP" <% = Selected(rsSQL("Country"), "GP") %>>Guadeloupe</option>
			<option value="GU" <% = Selected(rsSQL("Country"), "GU") %>>Guam</option>
			<option value="GT" <% = Selected(rsSQL("Country"), "GT") %>>Guatemala</option>
			<option value="GN" <% = Selected(rsSQL("Country"), "GN") %>>Guinea</option>
			<option value="GW" <% = Selected(rsSQL("Country"), "GW") %>>Guinea-Bissau</option>
			<option value="GY" <% = Selected(rsSQL("Country"), "GY") %>>Guyana</option>
			<option value="HT" <% = Selected(rsSQL("Country"), "HT") %>>Haiti</option>
			<option value="HM" <% = Selected(rsSQL("Country"), "HM") %>>Heard And Mc Donald Islands</option>
			<option value="VA" <% = Selected(rsSQL("Country"), "VA") %>>Holy See (Vatican City State)</option>
			
			<option value="HN" <% = Selected(rsSQL("Country"), "HN") %>>Honduras</option>
			<option value="HK" <% = Selected(rsSQL("Country"), "HK") %>>Hong Kong</option>
			<option value="HU" <% = Selected(rsSQL("Country"), "HU") %>>Hungary</option>
			<option value="IS" <% = Selected(rsSQL("Country"), "IS") %>>Icel And</option>
			<option value="IN" <% = Selected(rsSQL("Country"), "IN") %>>India</option>
			<option value="ID" <% = Selected(rsSQL("Country"), "ID") %>>Indonesia</option>
			<option value="IR" <% = Selected(rsSQL("Country"), "IR") %>>Iran (Islamic Republic Of)</option>
			<option value="IQ" <% = Selected(rsSQL("Country"), "IQ") %>>Iraq</option>
			<option value="IE" <% = Selected(rsSQL("Country"), "IE") %>>Ireland</option>
			
			<option value="IL" <% = Selected(rsSQL("Country"), "IL") %>>Israel</option>
			<option value="IT" <% = Selected(rsSQL("Country"), "IT") %>>Italy</option>
			<option value="JM" <% = Selected(rsSQL("Country"), "JM") %>>Jamaica</option>
			<option value="JP" <% = Selected(rsSQL("Country"), "JP") %>>Japan</option>
			<option value="JO" <% = Selected(rsSQL("Country"), "JO") %>>Jordan</option>
			<option value="KZ" <% = Selected(rsSQL("Country"), "KZ") %>>Kazakhstan</option>
			<option value="KE" <% = Selected(rsSQL("Country"), "KE") %>>Kenya</option>
			<option value="KI" <% = Selected(rsSQL("Country"), "KI") %>>Kiribati</option>
			<option value="KP" <% = Selected(rsSQL("Country"), "KP") %>>Korea, Dem People'S Republic</option>
			
			<option value="KR" <% = Selected(rsSQL("Country"), "KR") %>>Korea, Republic Of</option>
			<option value="KW" <% = Selected(rsSQL("Country"), "KW") %>>Kuwait</option>
			<option value="KG" <% = Selected(rsSQL("Country"), "KG") %>>Kyrgyzstan</option>
			<option value="LA" <% = Selected(rsSQL("Country"), "LA") %>>Lao People'S Dem Republic</option>
			<option value="LV" <% = Selected(rsSQL("Country"), "LV") %>>Latvia</option>
			<option value="LB" <% = Selected(rsSQL("Country"), "LB") %>>Lebanon</option>
			<option value="LS" <% = Selected(rsSQL("Country"), "LS") %>>Lesotho</option>
			<option value="LR" <% = Selected(rsSQL("Country"), "LR") %>>Liberia</option>
			<option value="LY" <% = Selected(rsSQL("Country"), "LY") %>>Libyan Arab Jamahiriya</option>
			
			<option value="LI" <% = Selected(rsSQL("Country"), "LI") %>>Liechtenstein</option>
			<option value="LT" <% = Selected(rsSQL("Country"), "LT") %>>Lithuania</option>
			<option value="LU" <% = Selected(rsSQL("Country"), "LU") %>>Luxembourg</option>
			<option value="MO" <% = Selected(rsSQL("Country"), "MO") %>>Macau</option>
			<option value="MK" <% = Selected(rsSQL("Country"), "MK") %>>Macedonia</option>
			<option value="MG" <% = Selected(rsSQL("Country"), "MG") %>>Madagascar</option>
			<option value="MW" <% = Selected(rsSQL("Country"), "MW") %>>Malawi</option>
			<option value="MY" <% = Selected(rsSQL("Country"), "MY") %>>Malaysia</option>
			<option value="MV" <% = Selected(rsSQL("Country"), "MV") %>>Maldives</option>
			
			<option value="ML" <% = Selected(rsSQL("Country"), "ML") %>>Mali</option>
			<option value="MT" <% = Selected(rsSQL("Country"), "MT") %>>Malta</option>
			<option value="MH" <% = Selected(rsSQL("Country"), "MH") %>>Marshall Islands</option>
			<option value="MQ" <% = Selected(rsSQL("Country"), "MQ") %>>Martinique</option>
			<option value="MR" <% = Selected(rsSQL("Country"), "MR") %>>Mauritania</option>
			<option value="MU" <% = Selected(rsSQL("Country"), "MU") %>>Mauritius</option>
			<option value="YT" <% = Selected(rsSQL("Country"), "YT") %>>Mayotte</option>
			<option value="MX" <% = Selected(rsSQL("Country"), "MX") %>>Mexico</option>
			<option value="FM" <% = Selected(rsSQL("Country"), "FM") %>>Micronesia, Federated States</option>
			
			<option value="MD" <% = Selected(rsSQL("Country"), "MD") %>>Moldova, Republic Of</option>
			<option value="MC" <% = Selected(rsSQL("Country"), "MC") %>>Monaco</option>
			<option value="MN" <% = Selected(rsSQL("Country"), "MN") %>>Mongolia</option>
			<option value="MS" <% = Selected(rsSQL("Country"), "MS") %>>Montserrat</option>
			<option value="MA" <% = Selected(rsSQL("Country"), "MA") %>>Morocco</option>
			<option value="MZ" <% = Selected(rsSQL("Country"), "MZ") %>>Mozambique</option>
			<option value="MM" <% = Selected(rsSQL("Country"), "MM") %>>Myanmar</option>
			<option value="NA" <% = Selected(rsSQL("Country"), "NA") %>>Namibia</option>
			<option value="NR" <% = Selected(rsSQL("Country"), "NR") %>>Nauru</option>
			
			<option value="NP" <% = Selected(rsSQL("Country"), "NP") %>>Nepal</option>
			<option value="NL" <% = Selected(rsSQL("Country"), "NL") %>>Netherlands</option>
			<option value="AN" <% = Selected(rsSQL("Country"), "AN") %>>Netherlands Ant Illes</option>
			<option value="NC" <% = Selected(rsSQL("Country"), "NC") %>>New Caledonia</option>
			<option value="NZ" <% = Selected(rsSQL("Country"), "NZ") %>>New Zealand</option>
			<option value="NI" <% = Selected(rsSQL("Country"), "NI") %>>Nicaragua</option>
			<option value="NE" <% = Selected(rsSQL("Country"), "NE") %>>Niger</option>
			<option value="NG" <% = Selected(rsSQL("Country"), "NG") %>>Nigeria</option>
			<option value="NU" <% = Selected(rsSQL("Country"), "NU") %>>Niue</option>
			
			<option value="NF" <% = Selected(rsSQL("Country"), "NF") %>>Norfolk Island</option>
			<option value="MP" <% = Selected(rsSQL("Country"), "MP") %>>Northern Mariana Islands</option>
			<option value="NO" <% = Selected(rsSQL("Country"), "NO") %>>Norway</option>
			<option value="OM" <% = Selected(rsSQL("Country"), "OM") %>>Oman</option>
			<option value="PK" <% = Selected(rsSQL("Country"), "PK") %>>Pakistan</option>
			<option value="PW" <% = Selected(rsSQL("Country"), "PW") %>>Palau</option>
			<option value="PA" <% = Selected(rsSQL("Country"), "PA") %>>Panama</option>
			<option value="PG" <% = Selected(rsSQL("Country"), "PG") %>>Papua New Guinea</option>
			<option value="PY" <% = Selected(rsSQL("Country"), "PY") %>>Paraguay</option>
			
			<option value="PE" <% = Selected(rsSQL("Country"), "PE") %>>Peru</option>
			<option value="PH" <% = Selected(rsSQL("Country"), "PH") %>>Philippines</option>
			<option value="PN" <% = Selected(rsSQL("Country"), "PN") %>>Pitcairn</option>
			<option value="PL" <% = Selected(rsSQL("Country"), "PL") %>>Poland</option>
			<option value="PT" <% = Selected(rsSQL("Country"), "PT") %>>Portugal</option>
			<option value="PR" <% = Selected(rsSQL("Country"), "PR") %>>Puerto Rico</option>
			<option value="QA" <% = Selected(rsSQL("Country"), "QA") %>>Qatar</option>
			<option value="RE" <% = Selected(rsSQL("Country"), "RE") %>>Reunion</option>
			<option value="RO" <% = Selected(rsSQL("Country"), "RO") %>>Romania</option>
			
			<option value="RU" <% = Selected(rsSQL("Country"), "RU") %>>Russian Federation</option>
			<option value="RW" <% = Selected(rsSQL("Country"), "RW") %>>Rwanda</option>
			<option value="KN" <% = Selected(rsSQL("Country"), "KN") %>>Saint K Itts And Nevis</option>
			<option value="LC" <% = Selected(rsSQL("Country"), "LC") %>>Saint Lucia</option>
			<option value="VC" <% = Selected(rsSQL("Country"), "VC") %>>Saint Vincent, The Grenadines</option>
			<option value="WS" <% = Selected(rsSQL("Country"), "WS") %>>Samoa</option>
			<option value="SM" <% = Selected(rsSQL("Country"), "SM") %>>San Marino</option>
			<option value="ST" <% = Selected(rsSQL("Country"), "ST") %>>Sao Tome And Principe</option>
			<option value="SA" <% = Selected(rsSQL("Country"), "SA") %>>Saudi Arabia</option>
			
			<option value="SN" <% = Selected(rsSQL("Country"), "SN") %>>Senegal</option>
			<option value="SC" <% = Selected(rsSQL("Country"), "SC") %>>Seychelles</option>
			<option value="SL" <% = Selected(rsSQL("Country"), "SL") %>>Sierra Leone</option>
			<option value="SG" <% = Selected(rsSQL("Country"), "SG") %>>Singapore</option>
			<option value="SK" <% = Selected(rsSQL("Country"), "SK") %>>Slovakia (Slovak Republic)</option>
			<option value="SI" <% = Selected(rsSQL("Country"), "SI") %>>Slovenia</option>
			<option value="SB" <% = Selected(rsSQL("Country"), "SB") %>>Solomon Islands</option>
			<option value="SO" <% = Selected(rsSQL("Country"), "SO") %>>Somalia</option>
			<option value="ZA" <% = Selected(rsSQL("Country"), "ZA") %>>South Africa</option>
			
			<option value="GS" <% = Selected(rsSQL("Country"), "GS") %>>South Georgia , S Sandwich Is.</option>
			<option value="ES" <% = Selected(rsSQL("Country"), "ES") %>>Spain</option>
			<option value="LK" <% = Selected(rsSQL("Country"), "LK") %>>Sri Lanka</option>
			<option value="SH" <% = Selected(rsSQL("Country"), "SH") %>>St.  Helena</option>
			<option value="PM" <% = Selected(rsSQL("Country"), "PM") %>>St.  Pierre And Miquelon</option>
			<option value="SD" <% = Selected(rsSQL("Country"), "SD") %>>Sudan</option>
			<option value="SR" <% = Selected(rsSQL("Country"), "SR") %>>Suriname</option>
			<option value="SJ" <% = Selected(rsSQL("Country"), "SJ") %>>Svalbard, Jan Mayen Islands</option>
			<option value="SZ" <% = Selected(rsSQL("Country"), "SZ") %>>Sw Aziland</option>
			
			<option value="SE" <% = Selected(rsSQL("Country"), "SE") %>>Sweden</option>
			<option value="CH" <% = Selected(rsSQL("Country"), "CH") %>>Switzerland</option>
			<option value="SY" <% = Selected(rsSQL("Country"), "SY") %>>Syrian Arab Republic</option>
			<option value="TW" <% = Selected(rsSQL("Country"), "TW") %>>Taiwan</option>
			<option value="TJ" <% = Selected(rsSQL("Country"), "TJ") %>>Tajikistan</option>
			<option value="TZ" <% = Selected(rsSQL("Country"), "TZ") %>>Tanzania, United Republic Of</option>
			<option value="TH" <% = Selected(rsSQL("Country"), "TH") %>>Thailand</option>
			<option value="TG" <% = Selected(rsSQL("Country"), "TG") %>>Togo</option>
			<option value="TK" <% = Selected(rsSQL("Country"), "TK") %>>Tokelau</option>
			
			<option value="TO" <% = Selected(rsSQL("Country"), "TO") %>>Tonga</option>
			<option value="TT" <% = Selected(rsSQL("Country"), "TT") %>>Trinidad And Tobago</option>
			<option value="TN" <% = Selected(rsSQL("Country"), "TN") %>>Tunisia</option>
			<option value="TR" <% = Selected(rsSQL("Country"), "TR") %>>Turkey</option>
			<option value="TM" <% = Selected(rsSQL("Country"), "TM") %>>Turkmenistan</option>
			<option value="TC" <% = Selected(rsSQL("Country"), "TC") %>>Turks And Caicos Islands</option>
			<option value="TV" <% = Selected(rsSQL("Country"), "TV") %>>Tuvalu</option>
			<option value="UG" <% = Selected(rsSQL("Country"), "UG") %>>Uganda</option>
			<option value="UA" <% = Selected(rsSQL("Country"), "UA") %>>Ukraine</option>
			
			<option value="AE" <% = Selected(rsSQL("Country"), "AE") %>>United Arab Emirates</option>
			<option value="GB" <% = Selected(rsSQL("Country"), "GB") %>>United Kingdom</option>
			<option value="US" <% = Selected(rsSQL("Country"), "US") %> selected="selected">United States</option>
			<option value="UM" <% = Selected(rsSQL("Country"), "UM") %>>United States Minor Is.</option>
			<option value="UY" <% = Selected(rsSQL("Country"), "UY") %>>Uruguay</option>
			<option value="UZ" <% = Selected(rsSQL("Country"), "UZ") %>>Uzbekistan</option>
			<option value="VU" <% = Selected(rsSQL("Country"), "VU") %>>Vanuatu</option>
			<option value="VE" <% = Selected(rsSQL("Country"), "VE") %>>Venezuela</option>
			<option value="VN" <% = Selected(rsSQL("Country"), "VN") %>>Viet Nam</option>
			
			<option value="VG" <% = Selected(rsSQL("Country"), "VG") %>>Virgin Islands (British)</option>
			<option value="VI" <% = Selected(rsSQL("Country"), "VI") %>>Virgin Islands (U.S.)</option>
			<option value="WF" <% = Selected(rsSQL("Country"), "WF") %>>Wallis And Futuna Islands</option>
			<option value="EH" <% = Selected(rsSQL("Country"), "EH") %>>Western Sahara</option>
			<option value="YE" <% = Selected(rsSQL("Country"), "YE") %>>Yemen</option>
			<option value="YU" <% = Selected(rsSQL("Country"), "YU") %>>Yugoslavia</option>
			<option value="ZR" <% = Selected(rsSQL("Country"), "ZR") %>>Zaire</option>
			<option value="ZM" <% = Selected(rsSQL("Country"), "ZM") %>>Zambia</option>
			<option value="ZW" <% = Selected(rsSQL("Country"), "ZW") %>>Zimbabwe</option>
		</select>
	  </td>
	</tr>
	<tr> 
	  <th>
		<div id="state_title" style="display:block;"><span class="required">*</span>State</div>
		<div id="province_title" style="display:none;"><span class="required">*</span>Province</div>
	  </th>
	  <td>
		<div id="state_info" style="display:block;">
		  <select name="state" id="state">
            <option value="" selected="selected">Choose a State</option>
            <option value="AL" <% = Selected(rsSQL("State"), "AL") %>>Alabama</option>
            <option value="AK" <% = Selected(rsSQL("State"), "AK") %>>Alaska</option>
            <option value="AS" <% = Selected(rsSQL("State"), "AS") %>>American Samoa</option>
            <option value="AZ" <% = Selected(rsSQL("State"), "AZ") %>>Arizona</option>
            <option value="AR" <% = Selected(rsSQL("State"), "AR") %>>Arkansas</option>
            <option value="CA" <% = Selected(rsSQL("State"), "CA") %>>California</option>
            <option value="CO" <% = Selected(rsSQL("State"), "CO") %>>Colorado</option>
            <option value="CT" <% = Selected(rsSQL("State"), "CT") %>>Connecticut</option>
            <option value="DE" <% = Selected(rsSQL("State"), "DE") %>>Delaware</option>
            <option value="DC" <% = Selected(rsSQL("State"), "DC") %>>District Of Columbia</option>
            <option value="FM" <% = Selected(rsSQL("State"), "FM") %>>Fed. States of Micronesia</option>
            <option value="FL" <% = Selected(rsSQL("State"), "FL") %>>Florida</option>
            <option value="GA" <% = Selected(rsSQL("State"), "GA") %>>Georgia</option>
            <option value="GU" <% = Selected(rsSQL("State"), "GU") %>>Guam</option>
            <option value="HI" <% = Selected(rsSQL("State"), "HI") %>>Hawaii</option>
            <option value="ID" <% = Selected(rsSQL("State"), "ID") %>>Idaho</option>
            <option value="IL" <% = Selected(rsSQL("State"), "IL") %>>Illinois</option>
            <option value="IN" <% = Selected(rsSQL("State"), "IN") %>>Indiana</option>
            <option value="IA" <% = Selected(rsSQL("State"), "IA") %>>Iowa</option>
            <option value="KS" <% = Selected(rsSQL("State"), "KS") %>>Kansas</option>
            <option value="KY" <% = Selected(rsSQL("State"), "KY") %>>Kentucky</option>
            <option value="LA" <% = Selected(rsSQL("State"), "LA") %>>Louisiana</option>
            <option value="ME" <% = Selected(rsSQL("State"), "ME") %>>Maine</option>
            <option value="MH" <% = Selected(rsSQL("State"), "MH") %>>Marshall Islands</option>
            <option value="MD" <% = Selected(rsSQL("State"), "MD") %>>Maryland</option>
            <option value="MA" <% = Selected(rsSQL("State"), "MA") %>>Massachusetts</option>
            <option value="MI" <% = Selected(rsSQL("State"), "MI") %>>Michigan</option>
            <option value="MN" <% = Selected(rsSQL("State"), "MN") %>>Minnesota</option>
            <option value="MS" <% = Selected(rsSQL("State"), "MS") %>>Mississippi</option>
            <option value="MO" <% = Selected(rsSQL("State"), "MO") %>>Missouri</option>
            <option value="MT" <% = Selected(rsSQL("State"), "MT") %>>Montana</option>
            <option value="NE" <% = Selected(rsSQL("State"), "NE") %>>Nebraska</option>
            <option value="NV" <% = Selected(rsSQL("State"), "NV") %>>Nevada</option>
            <option value="NH" <% = Selected(rsSQL("State"), "NH") %>>New Hampshire</option>
            <option value="NJ" <% = Selected(rsSQL("State"), "NJ") %>>New Jersey</option>
            <option value="NY" <% = Selected(rsSQL("State"), "NY") %>>New York</option>
            <option value="NC" <% = Selected(rsSQL("State"), "NC") %>>North Carolina</option>
            <option value="ND" <% = Selected(rsSQL("State"), "ND") %>>North Dakota</option>
            <option value="MP" <% = Selected(rsSQL("State"), "MP") %>>Northern Mariana Is</option>
            <option value="OH" <% = Selected(rsSQL("State"), "OH") %>>Ohio</option>
            <option value="OK" <% = Selected(rsSQL("State"), "OK") %>>Oklahoma</option>
            <option value="OR" <% = Selected(rsSQL("State"), "OR") %>>Oregon</option>
            <option value="PW" <% = Selected(rsSQL("State"), "PW") %>>Palau</option>
            <option value="PA" <% = Selected(rsSQL("State"), "PA") %>>Pennsylvania</option>
            <option value="OR" <% = Selected(rsSQL("State"), "OR") %>>Oregon</option>
            <option value="PR" <% = Selected(rsSQL("State"), "PR") %>>Puerto Rico</option>
            <option value="RI" <% = Selected(rsSQL("State"), "RI") %>>Rhode Island</option>
            <option value="SC" <% = Selected(rsSQL("State"), "SC") %>>South Carolina</option>
            <option value="SD" <% = Selected(rsSQL("State"), "SD") %>>South Dakota</option>
            <option value="TN" <% = Selected(rsSQL("State"), "TN") %>>Tennessee</option>
            <option value="TX" <% = Selected(rsSQL("State"), "TX") %>>Texas</option>
            <option value="UT" <% = Selected(rsSQL("State"), "UT") %>>Utah</option>
            <option value="VT" <% = Selected(rsSQL("State"), "VT") %>>Vermont</option>
            <option value="VI" <% = Selected(rsSQL("State"), "VI") %>>Virgin Islands</option>
            <option value="VA" <% = Selected(rsSQL("State"), "VA") %>>Virginia</option>
            <option value="WA" <% = Selected(rsSQL("State"), "WA") %>>Washington</option>
            <option value="WV" <% = Selected(rsSQL("State"), "WV") %>>West Virginia</option>
            <option value="WI" <% = Selected(rsSQL("State"), "WI") %>>Wisconsin</option>
            <option value="WY" <% = Selected(rsSQL("State"), "WY") %>>Wyoming</option>
          </select>
		</div>
		<div id="province_info" style="display:none;">
		<input name="province" id="province" type="text" size="25" maxlength="100" value="<% = rsSQL("State") %>" />
		</div></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Zip:</th>
          <td><input name="zip" type="text" id="zip" maxlength="10" style="width: 100px;" value="<% = rsSQL("Zip") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Email Address:</th>
          <td><input name="email" type="text" id="email" maxlength="100" style="width: 200px;" value="<% = rsSQL("Email") %>" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Primary Phone:</th>
          <td><input name="phone" type="text" id="phone" maxlength="14" style="width: 100px;" value="<% = rsSQL("Primary_Phone") %>" /></td>
        </tr>
        <tr>
          <th>Secondary Phone:</th>
          <td><input name="phone2" type="text" id="phone2" maxlength="14" style="width: 100px;" value="<% = rsSQL("Secondary_Phone") %>" /></td>
        </tr>
        <tr>
          <th>Preferred Method of Contact:</th>
          <td style="text-align:left;" valign="baseline">
		    <select name="preferred_contact">
              <option value="">Select...</option>
              <option value="Phone" <% = Selected(rsSQL("preferred_contact"),"Phone") %>>Phone</option>
              <option value="E-mail" <% = Selected(rsSQL("preferred_contact"),"E-mail") %>>E-mail</option>
              <option value="Mail" <% = Selected(rsSQL("preferred_contact"),"Mail") %>>Mail</option>
            </select>
		  </td>
        </tr>
        <tr>
          <th>How did you find out about us?</th>
          <td style="text-align:left;" valign="baseline">
		    <select name="how_found">
              <option value="">Select...</option>
              <option value="Newspaper" <% = Selected(rsSQL("how_found"),"Newspaper") %>>Newspaper</option>
              <option value="Magazine" <% = Selected(rsSQL("how_found"),"Magazine") %>>Magazine</option>
              <option value="Internet" <% = Selected(rsSQL("how_found"),"Internet") %>>Internet</option>
              <option value="London Event" <% = Selected(rsSQL("how_found"),"London Event") %>>London Event</option>
              <option value="Referral" <% = Selected(rsSQL("how_found"),"Referral") %>>Referral</option>
            </select>
		  </td>
        </tr>
        <tr>
          <th>Will this be your Primary Residence?</th>
          <td style="text-align:left;" valign="baseline">
		    <select name="is_primary">
              <option value="">Select...</option>
              <option value="Yes" <% = Selected(rsSQL("primary_residence"),"Yes") %>>Yes</option>
              <option value="No: 2nd" <% = Selected(rsSQL("primary_residence"),"No: 2nd") %>>No: 2nd</option>
              <option value="No: 3rd" <% = Selected(rsSQL("primary_residence"),"No: 3rd") %>>No: 3rd</option>
              <option value="No: 4th or more" <% = Selected(rsSQL("primary_residence"),"No: 4th or more") %>>No: 4th or more</option>
            </select>
		  </td>
        </tr>
        <tr>
          <th>Have you visited New Providence Island?</th>
          <td style="text-align:left;" valign="baseline">
		    <input type="radio" name="has_visited" value="Yes" <% = Checked(rsSQL("have_visited"),"Yes") %> />Yes
            <input type="radio" name="has_visited" value="No" <% = Checked(rsSQL("have_visited"),"No") %> />No 
		  </td>
        </tr>
        <tr>
          <th>Your favorite Island amenities:</th>
          <td style="text-align:left;" valign="top"><div style="width:75px; float:left; margin-right:10px;">
              <input type="checkbox" name="amenities" value="Golf" <% = Checked2(rsSQL("amenities"),"Golf") %> />Golf<br />
              <input type="checkbox" name="amenities" value="Boating" <% = Checked2(rsSQL("amenities"),"Boating") %> />Boating </div>
            <div style="width:75px; float:left; margin-right:10px;">
              <input type="checkbox" name="amenities" value="Fishing" <% = Checked2(rsSQL("amenities"),"Fishing") %> />Fishing<br />
              <input type="checkbox" name="amenities" value="Diving" <% = Checked2(rsSQL("amenities"),"Diving") %> />Diving </div>
		    <div style="width:150px; float:left;">
              <input type="checkbox" name="amenities" id="amenities" value="Other" onclick="setCheck()" <% = Checked2(rsSQL("amenities"),"Other") %> />Other
              <div id="otherField"><input name="otherDetail" type="text" id="otherDetail" style="width:100px;" value="<% = rsSQL("amenities_Other") %>" /></div>
		    </div></td>
        </tr>
        <tr>
          <th>Are you interested in a Golf Membership?</th>
          <td style="text-align:left;" valign="baseline">
		    <input type="radio" name="want_golf" value="Yes" <% = Checked(rsSQL("want_golf"),"Yes") %> />  Yes
            <input type="radio" name="want_golf" value="No" <% = Checked(rsSQL("want_golf"),"No") %> /> No </td>
        </tr>
        <tr>
          <td colspan="2"><hr size="1" noshade="noshade" color="#FFFFFF" /></td>
        </tr>
        <tr>
          <th><span class="required">*</span>Are you working with a Real Estate Agent?</th>
          <td><select name="reagent" id="reagent" onchange="changeRealtor()">
              <option value="No"  <% = Selected(rsSQL("with_agent"),"No") %>>No</option>
              <option value="Yes" <% = Selected(rsSQL("with_agent"),"Yes") %>>Yes</option>
            </select>
		  </td>
        </tr>
        <tr>
          <th><span id="reaName" name="reaName"></span>Agent Name:</th>
          <td><input name="agent_name" id="agent_name" type="text" maxlength="60" style="width: 150px;" value="<% = rsSQL("Agent_Name") %>" /></td>
        </tr>
        <tr>
          <th><span id="reaCompany" name="reaCompany"></span>Agent Company:</th>
          <td><input name="agent_company" id="agent_company" type="text" maxlength="60" style="width: 150px;" value="<% = rsSQL("Agent_Company") %>" /></td>
        </tr>
        <tr>
          <th><span id="reaCity"></span>Agent City:</th>
          <td><input name="agent_city" id="agent_city" type="text" maxlength="60" style="width: 150px;" value="<% = rsSQL("Agent_City") %>" /></td>
        </tr>
        <tr>
          <th><span id="reaPhone" name="reaPhone"></span>Agent Phone:</th>
          <td><input name="agent_phone" id="agent_phone" type="text" maxlength="60" style="width: 150px;" value="<% = rsSQL("Agent_Phone") %>" /></td>
        </tr>
        <tr>
          <th><span id="reaEmail" name="reaEmail"></span>Agent Email:</th>
          <td><input name="agent_email" id="agent_email" type="text" maxlength="60" style="width: 200px;" value="<% = rsSQL("Agent_Email") %>" /></td>
        </tr>
        <tr>
          <td style="text-align:right;" valign="top">Comments:
            </th>
          </td><td style="text-align:left;" valign="top"><textarea name="comments" cols="150" rows="3" id="comments" style="width: 200px;"><% = rsSQL("Comments") %></textarea></td>
        </tr>
        <tr>
          <th><!-- nothing in this area --></th>
          <td style="padding-top:10px; padding-bottom:10px;">
		  <input type="hidden" name="contact_id" value="<% = Request.QueryString("id") %>" />
		  <input name="Submit" type="submit" value="Submit" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input name="Reset" type="reset" />
            &nbsp;&nbsp;&nbsp;&nbsp;<span><span class="required">*</span>Required Fields</span></td>
        </tr>
      </table>
    </form>
	<!-- Start old From here -->
      </div>
    </div>
  </div>
  <div class="clear"><!-- This clears the floats --></div>
  <div id="page">&nbsp;<!-- This div used in the List page -->&nbsp;</div>
</div>
</body>
</html>
<!-- #Include Virtual = "site_admin/includes/connection_close.asp" -->