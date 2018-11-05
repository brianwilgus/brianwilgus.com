<%
On Error Resume Next
If IsObject(rsSQL) Then
	rsSQL.Close
	Set rsSQL = Nothing
End If
If IsObject(cmdSQL) Then
	Set cmdSQL.ActiveConnection = Nothing
	Set cmdSQL = Nothing
End If
If IsObject(DataConn) Then
	DataConn.Close
	Set DataConn = Nothing
End If
On Error Goto 0
%>
