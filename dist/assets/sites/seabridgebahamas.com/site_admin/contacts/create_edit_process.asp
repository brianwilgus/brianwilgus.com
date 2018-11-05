<%
Response.Buffer = True

%>
<!-- #Include Virtual="site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual="site_admin/includes/connection_open.asp" -->

<%	
Function ToBool(strInput)
	Select Case strInput
		Case "Yes"
			ToBool = 1
		Case "No"
			ToBool = 0
	End Select
End Function

Function NullString(strInput)
	If Trim(strInput) = "" Then 
		NullString = NULL
	ELSE
		NullString = Trim(strInput)
	End If
End Function
Function FixCheckboxValues(strInput)
	Dim strNew
	strNew = Replace(strInput,", ",",")
	FixCheckboxValues = strNew
End Function 


Dim PageMode, PageSource

PageMode = Request.QueryString("mode")
PageSource = Request.QueryString("source")

'-- Dimension variables for form objects
Dim strFirstName, strLastName, strPhone2, strAddress1, strAddress2, strCity, strState, strZip, strDayPhone, strEmail
Dim strComments, strContactID, strHowFound, strHowFoundOther, strOtherMagazine, strOtherNewspaper
Dim strWithAgent, strAgentName, strAgentCompany, strAgentCity, strAgentPhone, strAgentEmail, strAmenitiesOther

		'-- Get values
		strContactID = Trim(Request.Form("Contact_ID"))
		strFirstName = NullString(Request.Form("first_name"))
		strLastName = NullString(Request.Form("last_name"))
		strAddress1 = NullString(Request.Form("address")) 
		strAddress2 = NullString(Request.Form("address2")) 
		strCity = NullString(Request.Form("city")) 
		strState = NullString(Request.Form("state")) 
		strZip = NullString(Request.Form("zip")) 
		strCountry = NullString(Request.Form("country")) 
		strEmail = NullString(Request.Form("email"))
		strPrimaryPhone = NullString(Request.Form("phone")) 
		strSecondaryPhone = NullString(Request.Form("phone2")) 
		strPreferred = NullString(Request.Form("preferred_contact")) 
		strHowFound = NullString(Request.Form("how_found"))
		strPrimary = NullString(Request.Form("is_primary"))
		strHasVisited = NullString(Request.Form("has_visited"))
		strAmenities = NullString(Request.Form("amenities"))
		strAmenitiesOther = NullString(Request.Form("otherDetail"))
		strProvince =  NullString(Request.Form("province"))
		
		If ISNULL(strProvince) = False Then
			strState = strProvince
		End If
		
		If ISNULL(strAmenities) = False Then
			strAmenities = REPLACE(strAmenities,", ",",")
		End If
		
		strWantGolf = NullString(Request.Form("want_golf"))
		strWithAgent = NullString(Request.Form("reagent"))
		strAgentName = NullString(Request.Form("agent_name"))
		strAgentCompany = NullString(Request.Form("agent_company"))
		strAgentCity = NullString(Request.Form("agent_city"))
		strAgentPhone = NullString(Request.Form("agent_phone"))
		strAgentEmail = NullString(Request.Form("agent_email"))
		strComments = NullString(Request.Form("Comments"))
	
		If ISNULL(strComments) = False Then
			strComments = REPLACE(strComments,VbCrLf," ")
		End If

Select Case PageMode
	Case "add"
	
		' Call stored procedure 
		With cmdSQL
		.CommandType = adCmdStoredProc
		.CommandText = "SPV_add_contact"
			.Parameters.Append .CreateParameter("first_name",adVarchar,adParamInput,50,strFirstName)
			.Parameters.Append .CreateParameter("last_name",adVarchar,adParamInput,50,strLastName)
			.Parameters.Append .CreateParameter("address1",adVarchar,adParamInput,60,strAddress1)
			.Parameters.Append .CreateParameter("address2",adVarchar,adParamInput,60,strAddress2)
			.Parameters.Append .CreateParameter("city",adVarchar,adParamInput,50,strCity)
			.Parameters.Append .CreateParameter("state",adVarchar,adParamInput,50,strState)
			.Parameters.Append .CreateParameter("zip",adVarchar,adParamInput,10,strZip)
			.Parameters.Append .CreateParameter("country",adVarchar,adParamInput,100,strCountry)
			.Parameters.Append .CreateParameter("email",adVarchar,adParamInput,60,strEmail)
			.Parameters.Append .CreateParameter("primary_phone",adVarchar,adParamInput,14,strPrimaryPhone)
			.Parameters.Append .CreateParameter("secondary_phone",adVarchar,adParamInput,14,strSecondaryPhone)
			.Parameters.Append .CreateParameter("preferred_contact",adVarchar,adParamInput,20,strPreferred)
			.Parameters.Append .CreateParameter("how_found",adVarchar,adParamInput,500,strHowFound)
			.Parameters.Append .CreateParameter("primary",adVarchar,adParamInput,20,strPrimary)
			.Parameters.Append .CreateParameter("has_visited",adVarchar,adParamInput,3,strHasVisited)
			.Parameters.Append .CreateParameter("amenities",adVarchar,adParamInput,200,strAmenities)
			.Parameters.Append .CreateParameter("amenitiesOther",adVarchar,adParamInput,100,strAmenitiesOther)
			.Parameters.Append .CreateParameter("wants_golf",adVarchar,adParamInput,3,strWantGolf)
			.Parameters.Append .CreateParameter("with_agent",adVarchar,adParamInput,3,strWithAgent)
			.Parameters.Append .CreateParameter("agent_name",adVarchar,adParamInput,60,strAgentName)
			.Parameters.Append .CreateParameter("agent_company",adVarchar,adParamInput,60,strAgentCompany)
			.Parameters.Append .CreateParameter("agent_city",adVarchar,adParamInput,60,strAgentCity)
			.Parameters.Append .CreateParameter("agent_phone",adVarchar,adParamInput,14,strAgentPhone)
			.Parameters.Append .CreateParameter("agent_email",adVarchar,adParamInput,100,strAgentEmail)
			.Parameters.Append .CreateParameter("comments",adVarchar,adParamInput,2000,strComments)
			.Execute, , adExecuteNoRecords
		End With
		
		' ERROR HANDLING
		If Err.number <> 0 Or cnSQL.Errors.Count > 0 Then
			Response.Write Err.Description
			Response.End
		End If
		
		'-- Send Emails
		If PageSource = "live" Then 
			If ISNULL(strEmail) = False Then
			'Send Confirmation Email to the Contact
			Dim Mail, strBody, strHTML
			Set Mail = Server.CreateObject("CDO.Message")
			Dim iConf : Set iConf = Server.CreateObject("CDO.Configuration")
			Dim Flds
			Set Flds = iConf.Fields
			  
			With Flds
				.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = Application("smtp")
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
				.Update
			End With
			
			With Mail
				Set .Configuration = iConf
				.To = strEmail
				.From = "Seabridge Bahamas" & "<" & Application("admin_email") & ">"
				.Subject = "Thank you for registering with Seabridge Bahamas"
				strBody =   "Dear " & strFirstName &"," & VBNewLine &_
							"Thank you for registering with Seabridge Bahamas, a new community conveniently located " & VBNewLine &_
							"on the northwest shore of New Providence Island. Gently rising from sea level to 85 feet " & VBNewLine &_
							"above the world renowned crystal clear waters of The Bahamas, Seabridge offers breathtaking " & VBNewLine &_
							"ocean views combined with the quiet seclusion of a gated residential enclave. The sights " & VBNewLine &_
							"and sounds of Paradise Island, Cable Beach and downtown Nassau are minutes away but a " & VBNewLine &_
							"world apart. The oasis that is Seabridge awaits you." & VBNewLine & VBNewLine &_
							
							"Whether you're looking for a retreat or you want to live the island lifestyle as a " & VBNewLine &_
							"full-time resident, Seabridge Bahamas is an ideal way to experience luxurious island " & VBNewLine &_
							"living. A sales representative will be contacting you shortly with more information " & VBNewLine &_
							"about this exciting community. We look forward to seeing you soon." & VBNewLine & VBNewLine &_
							
							"Regards,"& VBNewLine & VBNewLine &_
							
							"Property Sales Team" & VBNewLine &_
							"Seabridge" & VBNewLine &_
							"www.seabridgebahamas.com" & VBNewLine &_
							"1.866.649.6631"
							
							
				.TextBody = strBody
				
				strHTML =   "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"" ""http://www.w3.org/TR/html4/loose.dtd"">" &_
							"<html>" &_
							"<head>" &_
							"<meta http-equiv=""Content-Type"" content=""text/html; charset=ISO-8859-1"">" &_
							"<title>Seabridge Bahamas</title>" &_
							"</head>" &_
							
							"<body bgcolor=""#DCD7AA"" leftmargin=""0"" topmargin=""0"" marginwidth=""0"" marginheight=""0"">" &_
							  "<div style=""border-bottom: 1px solid #625528;"">" &_
								"<div style=""background: url(http://www.seabridgebahamas.com/images_email/bkgrd.gif) repeat-y; text-align: center; margin: 0px auto; padding: 0px; width: 600px;""><img src=""http://www.seabridgebahamas.com/images_email/logo_seabridge.gif"" alt=""Seabridge Bahamas""></div>" &_
							  "</div>" &_
							  "<div style=""background: url(http://www.seabridgebahamas.com/images_email/bkgrd.gif) repeat-y; text-align: center; margin: 0px auto; padding: 0px; width: 502px; padding-left:49px; padding-right:49px;"">" &_
								"<div style=""background-color:#756734;"">&nbsp;</div>" &_
								"<div style=""font: 12px/16px 'Times New Roman', Times, serif;color: #766734;text-align: left;padding-right: 30px; padding-left: 30px;"">" &_
								  "<p>Dear " & strFirstName &",</p>" &_
								  "<p>Thank you for registering with Seabridge Bahamas, a new community conveniently located on the northwest shore of New Providence Island. Gently rising from sea level to 85 feet above the world renowned crystal clear waters of The Bahamas, Seabridge offers breathtaking ocean views combined with the quiet seclusion of a gated residential enclave. The sights and sounds of Paradise Island, Cable Beach and downtown Nassau are minutes away but a world apart. The oasis that is Seabridge awaits you.</p>" &_
								  "<p>Whether you&#8217;re looking for a retreat or you want to live the island lifestyle as a full-time resident, Seabridge Bahamas is an ideal way to experience luxurious island living. A sales representative will be contacting you shortly with more information about this exciting community. We look forward to seeing you soon.</p>" &_
								   "<p>Regards,</p>" &_
								   "<p>Property Sales Team<br>" &_
									 "Seabridge<br>" &_
									 "<a href=""http://www.seabridgebahamas.com/"" style=""color:#756734"">www.seabridgebahamas.com</a><br>" &_
									 "1.866.649.6631</p>" &_
								"</div>" &_
								"<div style=""border-bottom: 1px solid #625528;""><img src=""http://www.seabridgebahamas.com/images_email/img_foot.jpg""></div>" &_
							  "</div>" &_
							"</body>" &_
							"</html>"


				.HTMLBody = strHTML
			End With
			
			On Error Resume Next
			Mail.Send
			If Err <> 0 Then
				Response.Write "Error encountered: " & Err.Description
				Response.End
			End If
			On Error Goto 0
			Set Mail = Nothing
		End If	
				
			'Send Email to Site Administrator
			Set Mail = Server.CreateObject("CDO.Message")
			Dim Conf : Set Conf = Server.CreateObject("CDO.Configuration")
			
			Dim Flds2
			Set Flds2 = Conf.Fields
			
			With Flds2
				.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = Application("smtp")
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
				.Update
			End With
			
			With Mail
				Set .Configuration = Conf
				.To = Application("admin_email")
				If ISNULL(strEmail) = False Then
				.From = strFirstName & " " & strLastName & "<" & strEmail & ">"
				Else 
				.From = Application("admin_email")
				End If
				.Subject = "Seabridge Bahamas - New Web Contact"
				strBody =   "This individual has registered for the Seabridge Bahamas" & VBNewLine &_
							"===================================================" & VBNewLine &_
							"First Name: " & strFirstName & VBNewLine &_
							"Last Name: " & strLastName & VBNewLine &_
							"Address: " & strAddress1 & VBNewLine &_
							"Address2: " & strAddress2 & VBNewLine &_
							"City: " & strCity & VBNewLine &_
							"State/Province: " & strState & VBNewLine &_
							"Zip: " & strZip & VBNewLine &_
							"Country: " & strCountry & VBNewLine &_
							"E-mail: " & strEmail & VBNewLine &_
							"Primary Phone: " & strPrimaryPhone & VBNewLine &_
							"Secondary Phone: " & strSecondaryPhone & VBNewLine &_
							"Preferred Method of Contact: " & strPreferred & VBNewLine &_
							"How Contact Found Us: " & strHowFound & VBNewLine &_
							"Will be the Primary Residence? " & strPrimary & VBNewLine &_
							"Have visited New Providence Island? " & strHasVisited & VBNewLine &_
							"Favorite lifestyle amenities: " & strAmenities & " " & strAmenitiesOther & VBNewLine &_
							"Is interested in a Golf Membership? " & strWantGolf & VBNewLine &_
							"Comments: " & strComments & VBNewLine &_
							"===================================================" & VBNewLine &_
							"Is working with a real estate agent?" & VBNewLine &_
							"A: " & strWithAgent & VBNewLine & VBNewLine
				If UCase(strWithAgent) = "YES" Then 
					strBody = strBody &_
							"If yes, agent information:" & VBNewLine &_
							"   Agent Name:     " & strAgentName & VBNewLine  &_
							"   Realty Company: " & strAgentCompany & VBNewLine  &_
							"   City:           " & strAgentCity & VBNewLine  &_
							"   Agent Phone:    " & strAgentPhone & VBNewLine  &_
							"   Agent Email:    " & strAgentEmail & VBNewLine  &_
							"==================================================="
				Else
					strBody = strBody &_
							"If yes, agent information:" & VBNewLine &_
							"   Agent Name:     N/A" & VBNewLine  &_
							"   Realty Company: N/A" & VBNewLine  &_
							"   City:           N/A" & VBNewLine  &_
							"   Agent Phone:    N/A" & VBNewLine  &_
							"   Agent Email:    N/A" & VBNewLine  &_
							"==================================================="
				End If 
							
				.TextBody = strBody
			End With
			
			On Error Resume Next
			Mail.Send
			If Err <> 0 Then
				Response.Write "Error encountered: " & Err.Description
				Response.End
			End If
			On Error Goto 0
			Set Mail = Nothing
			
			'If the person is working with an agent, send an email to the agent.
			If UCASE(strWithAgent) = "YES" AND (ISNULL(strAgentEmail) = False OR strAgentEmail <> "") Then 
				'-- Send email to the agent
				Set Mail = Server.CreateObject("CDO.Message")
				Dim Confi : Set Confi = Server.CreateObject("CDO.Configuration")
				Dim Flds3
				Set Flds3 = Confi.Fields
			
				With Flds3
					.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
					.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = Application("smtp")
					.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
					.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
					.Update
				End With
				
				With Mail
					Set .Configuration = Confi
					.To = strAgentEmail
					.From = "Seabridge Bahamas" & "<" & Application("admin_email") & ">"
					.Subject = "Your client has registered with Seabridge Bahamas"
					strBody = strFirstName & " " & strLastName & " has indicated that you are the ""agent of record"" when registering" &_
								"on the Seabridge Bahamas Priority List. A sales representative will be contacting you and your client shortly. " & VBNewLine & VBNewLine &_
								"Thank you." & VBNewLine & VBNewLine &_
								"===================================================" & VBNewLine &_
								"First Name: " & strFirstName & VBNewLine &_
								"Last Name: " & strLastName & VBNewLine &_
								"Address: " & strAddress1 & VBNewLine &_
								"Address2: " & strAddress2 & VBNewLine &_
								"City: " & strCity & VBNewLine &_
								"State/Province: " & strState & VBNewLine &_
								"Zip: " & strZip & VBNewLine &_
								"Country: " & strCountry & VBNewLine &_
								"E-mail: " & strEmail & VBNewLine &_
								"Primary Phone: " & strPrimaryPhone & VBNewLine &_
								"Secondary Phone: " & strSecondaryPhone & VBNewLine &_
								"Preferred Method of Contact: " & strPreferred & VBNewLine &_
								"How Contact Found Us: " & strHowFound & VBNewLine &_
								"Will be the Primary Residence? " & strPrimary & VBNewLine &_
								"Have visited New Providence Island? " & strHasVisited & VBNewLine &_
								"Favorite lifestyle amenities: " & strAmenities & " " & strAmenitiesOther & VBNewLine &_
								"Is interested in a Golf Membership? " & strWantGolf & VBNewLine &_
								"Comments: " & strComments & VBNewLine &_
								"==================================================="
					.TextBody = strBody
					
					
					strHTML = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"" ""http://www.w3.org/TR/html4/loose.dtd"">" &_
								"<html>" &_
								"<head>" &_
								"<meta http-equiv=""Content-Type"" content=""text/html; charset=ISO-8859-1"">" &_
								"<title>Seabridge Bahamas</title>" &_
								"</head>" &_
								
								"<body bgcolor=""#DCD7AA"" leftmargin=""0"" topmargin=""0"" marginwidth=""0"" marginheight=""0"">" &_
								  "<div style=""border-bottom: 1px solid #625528;"">" &_
									"<div style=""background: url(http://www.seabridgebahamas.com/images_email/bkgrd.gif) repeat-y; text-align: center; margin: 0px auto; padding: 0px; width: 600px;""><img src=""http://www.seabridgebahamas.com/images_email/logo_seabridge.gif"" alt=""Seabridge Bahamas""></div>" &_
								  "</div>" &_
								  "<div style=""background: url(http://www.seabridgebahamas.com/images_email/bkgrd.gif) repeat-y; text-align: center; margin: 0px auto; padding: 0px; width: 502px; padding-left:49px; padding-right:49px;"">" &_
									"<div style=""background-color:#756734;"">&nbsp;</div>" &_
									"<div style=""font: 12px/16px 'Times New Roman', Times, serif;color: #766734;text-align: left;padding-right: 30px; padding-left: 30px;"">" &_
									  "<p>" & strFirstName & " " & strLastName & " has indicated that you are the &#8220;agent of record&#8221; when registering<br>" &_
								"on the Seabridge Bahamas Priority List. A sales representative will be contacting you and your client shortly. </p>" &_
									  "<table style=""width:442px; border: 0px none; padding-bottom:4px; padding-top:4px;"" cellspacing=""0"">" &_
										"<tr>" &_
										   "<td valign=""baseline"" style=""width:25%; text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px; padding-bottom:3px; padding-top:3px;"">First Name:</td>" &_
										   "<td valign=""baseline"">" & strFirstName & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Last Name:</td>" &_
										   "<td valign=""baseline"">" & strLastName & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Address:</td>" &_
										   "<td valign=""baseline"">" & strAddress1 & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Address2:</td>" &_
										   "<td valign=""baseline"">" & strAddress2 & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">City:</td>" &_
										   "<td valign=""baseline"">" & strCity & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">State/Province:</td>" &_
										   "<td valign=""baseline"">" & strState & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Zip:</td>" &_
										   "<td valign=""baseline"">" & strZip & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Country:</td>" &_
										   "<td valign=""baseline"">" & strCountry & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">E-mail:</td>" &_
										   "<td valign=""baseline"">" & strEmail & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Primary Phone:</td>" &_
										   "<td valign=""baseline"">" & strPrimaryPhone & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Secondary Phone:</td>" &_
										   "<td valign=""baseline"">" & strSecondaryPhone & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Preferred Method <br>" &_
										   "of Contact:</td>" &_
										   "<td valign=""baseline"">" & strPreferred & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">How Contact <br>" &_
										   "Found Us:</td>" &_
										   "<td valign=""baseline"">" & strHowFound & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Will be the Primary Residence?</td>" &_
										   "<td valign=""baseline"">" & strPrimary & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Have visited New Providence Island?</td>" &_
										   "<td valign=""baseline"">" & strHasVisited & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Favorite lifestyle amenities:</td>" &_
										   "<td valign=""baseline"">" & strAmenities & " " & strAmenitiesOther & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Is interested in a <br>" &_
										   "Golf Membership?</td>" &_
										   "<td valign=""baseline"">" & strWantGolf & "</td>" &_
										"</tr>" &_
										 "<tr>" &_
										   "<td valign=""baseline"" style=""text-align:right; padding-right:4px; padding-bottom:3px; padding-top:3px;"">Comments:</td>" &_
										   "<td valign=""baseline"">" & strComments & "</td>" &_
										"</tr>" &_
									   "</table>" &_
									   "<p>Regards,</p>" &_
									   "<p>Property Sales Team<br>" &_
										 "Seabridge<br>" &_
								  "<a href=""http://www.seabridgebahamas.com/"" style=""color:#756734"">www.seabridgebahamas.com</a><br>" &_
										 "1.866.649.6631</p>" &_
									"</div>" &_
									"<div style=""border-bottom: 1px solid #625528;""""><img src=""http://www.seabridgebahamas.com/images_email/img_foot.jpg""></div>" &_
								  "</div>" &_
								"</body>" &_
								"</html>"
							
				.HTMLBody = strHTML

				End With
					
				On Error Resume Next
				Mail.Send
				If Err <> 0 Then
					Response.Write "Error encountered: " & Err.Description
					Response.End
				End If
				On Error Goto 0
				Set Mail = Nothing
			End If
			
			Response.Redirect("../../thank_you.htm")

		Else 'PageSource must be admin
			'-- Emails aren't sent here
			Response.Redirect("contact_list.asp")
		End If 	
	
	Case "edit"
		
		' Call stored procedure 
		With cmdSQL
		.CommandType = adCmdStoredProc
		.CommandText = "SPV_update_contact"
			.Parameters.Append .CreateParameter("contact_id",adInteger,adParamInput,,strContactID)
			.Parameters.Append .CreateParameter("first_name",adVarchar,adParamInput,50,strFirstName)
			.Parameters.Append .CreateParameter("last_name",adVarchar,adParamInput,50,strLastName)
			.Parameters.Append .CreateParameter("address1",adVarchar,adParamInput,60,strAddress1)
			.Parameters.Append .CreateParameter("address2",adVarchar,adParamInput,60,strAddress2)
			.Parameters.Append .CreateParameter("city",adVarchar,adParamInput,50,strCity)
			.Parameters.Append .CreateParameter("state",adVarchar,adParamInput,50,strState)
			.Parameters.Append .CreateParameter("zip",adVarchar,adParamInput,10,strZip)
			.Parameters.Append .CreateParameter("country",adVarchar,adParamInput,100,strCountry)
			.Parameters.Append .CreateParameter("email",adVarchar,adParamInput,60,strEmail)
			.Parameters.Append .CreateParameter("primary_phone",adVarchar,adParamInput,14,strPrimaryPhone)
			.Parameters.Append .CreateParameter("secondary_phone",adVarchar,adParamInput,14,strSecondaryPhone)
			.Parameters.Append .CreateParameter("preferred_contact",adVarchar,adParamInput,20,strPreferred)
			.Parameters.Append .CreateParameter("how_found",adVarchar,adParamInput,500,strHowFound)
			.Parameters.Append .CreateParameter("primary",adVarchar,adParamInput,20,strPrimary)
			.Parameters.Append .CreateParameter("has_visited",adVarchar,adParamInput,3,strHasVisited)
			.Parameters.Append .CreateParameter("amenities",adVarchar,adParamInput,200,strAmenities)
			.Parameters.Append .CreateParameter("amenitiesOther",adVarchar,adParamInput,100,strAmenitiesOther)
			.Parameters.Append .CreateParameter("wants_golf",adVarchar,adParamInput,3,strWantGolf)
			.Parameters.Append .CreateParameter("with_agent",adVarchar,adParamInput,3,strWithAgent)
			.Parameters.Append .CreateParameter("agent_name",adVarchar,adParamInput,60,strAgentName)
			.Parameters.Append .CreateParameter("agent_company",adVarchar,adParamInput,60,strAgentCompany)
			.Parameters.Append .CreateParameter("agent_city",adVarchar,adParamInput,60,strAgentCity)
			.Parameters.Append .CreateParameter("agent_phone",adVarchar,adParamInput,14,strAgentPhone)
			.Parameters.Append .CreateParameter("agent_email",adVarchar,adParamInput,100,strAgentEmail)
			.Parameters.Append .CreateParameter("comments",adVarchar,adParamInput,2000,strComments)
			.Execute, , adExecuteNoRecords
		End With
		
		' ERROR HANDLING
		If Err.number <> 0 Or cnSQL.Errors.Count > 0 Then
			Response.Write Err.Description
			Response.End
		End If

		Response.Redirect("contact_list.asp")
	
	Case "delete"

		With cmdSQL
			.CommandType = adCmdStoredProc
			.CommandText = "SPV_delete_contact"
			.Parameters.Append .CreateParameter("contact_id",adInteger,adParamInput,,CInt(Request.Querystring("id")))
			.Execute, , adExecuteNoRecords
		End With
		
		' ERROR HANDLING
		If Err.number <> 0 Or cnSQL.Errors.Count > 0 Then
			Response.Write Err.Description
			Response.End
		End If
		
		Response.Redirect("contact_list.asp")
	
	Case Else
		Response.Write "Unauthorized Use. Your IP address has been logged." ' Really doesn't log the IP.  Just a scare tactic.
		Response.End
End Select



%>
<!-- #Include Virtual="site_admin/includes/connection_close.asp" -->