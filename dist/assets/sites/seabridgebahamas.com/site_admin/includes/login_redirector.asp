<%

If Request.Cookies("shpv")("LoggedIn") <> "Yes" Then 
	Response.Redirect "../login/login.asp"
	Response.End()
End If 
%>