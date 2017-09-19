<%
Dim cnSQL, rsSQL, cmdSQL, strError

Set cnSQL = Server.CreateObject("ADODB.Connection")

On Error Resume Next
cnSQL.Open Application("cnSQL_ConnectionString")

If Err.number <> 0 Then
	Select Case Err.number
		Case "-2147467259"
			strError = "A connection could not be established to the SQL Server. Please contact your System Administrator."
		Case Else
			strError = Err.number & " " & Err.Description
	End Select		

	Response.Write "<font color=""red"">" & strError & "</font>"
	Response.End

End If

On Error GoTo 0
	
Set cmdSQL = Server.CreateObject("ADODB.Command")
Set cmdSQL.ActiveConnection = cnSQL
Set rsSQL = Server.CreateObject("ADODB.Recordset")
%>