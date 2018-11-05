<%

If Request.Querystring("logout") = "true" Then 
	Response.Cookies("shpv")("loggedin") = ""
	Response.Redirect("login.asp")
	Response.End
Else

	Dim UserID, Password

	UserID = Trim(Request.Form("txtUserID"))
	Password = Trim(Request.Form("txtPassword"))
	
	If UserID = Application("AdminUserID") And Password = Application("AdminPassword") Then 
		Response.Cookies("shpv")("loggedin") = "Yes"
		Response.Redirect("../contacts/contact_list.asp")
	Else
		Response.Redirect("login.asp?loginerror=true")
	End If

End If 
%>
