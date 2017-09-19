<%
Response.Buffer = True
Response.Expires = 60
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>

<% Dim strBodyID
strBodyID = "Body ID Goes Here" %>

<!-- #Include Virtual="site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual="site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual="site_admin/includes/connection_open.asp" -->
<!-- #Include Virtual="site_admin/includes/visit_count.asp" -->

<!-- #Include Virtual="site_admin/includes/header_contacts.asp" -->

<%
Function setRowColor(bgCount)
	iLast = right(bgCount,1)
	Select Case iLast
		case "1","3","5","7","9"
			setRowColor = "#EFEFEF"
		case else
			setRowColor = "#FFFFFF"
	End Select
End Function


With cmdSQL
	.CommandType = adCmdStoredProc
	.CommandText = "SPV_get_traffic_report"
End With

rsSQL.Open cmdSQL
%>

	<div id="newContent">
		<table width="705" border="0" cellspacing="0" cellpadding="15">
			  <tr> 
				<td class="body">
				  <div align="center">&nbsp;&nbsp;&nbsp;<strong>Visit Counter:</strong> <% = intTotal %><br /><br /></div>
				  <table width="675" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
					<tr> 
					  <td align="left" valign="top">
						<!-- WEEKS -->
						<table width="335" border="0" cellpadding="3" cellspacing="0" >
						  <%
						  bgCount = 0
						  intRegTotal = 0
						  intPercTotal = 0 %>
						  <tr>
							  <th>Week Start</b></th>
							  <th>Week End</b></th>
							  <th width="100" align="right"># Registrations</b></th>
							  <th width="80" align="right">Percentage</b></th>
						  </tr>
						  <% Do While NOT rsSQL.EOF %>
							<tr bgcolor="<% = setRowColor(bgCount) %>">
							  <td align="left"><% = FormatDateTime(rsSQL("Week_Start"),2)  %></td>
							  <td align="left"><% = FormatDateTime(rsSQL("Week_End"),2) %></td>
							  <td align="right"><% = rsSQL("Quantity") %></td>
							  <td align="right"><% = FormatNumber(((rsSQL("Quantity") / intTotal) * 100),2) %>%</td>
							</tr>
						  <%
						  bgCount = bgCount + 1
						  intRegTotal = intRegTotal + rsSQL("Quantity")
						  intPercTotal = intPercTotal + FormatNumber(((rsSQL("Quantity") / intTotal) * 100),2) 
						  rsSQL.Movenext
						  Loop %>
						  <tr bgcolor="#FFFFFF">
							<td align="right" colspan="2">TOTAL:</b></td>
							<td align="right">
							<% = intRegTotal %></b></td>
							<td align="right">
							<% = intPercTotal %>%</b></td>
						  </tr>
						</table>
						<br />
						
						<% Set rsSQL = rsSQL.NextRecordset %>
						
						<!-- STATE -->
						<% bgCount = 0 %>
						<table width="335" border="0" cellpadding="3" cellspacing="0" >
						  <tr>
							<th>State</th>
							<th width="100" align="right"># Registrations</th>
							<th width="80" align="right">Percentage</th>
						  </tr>
						  <% Do While NOT rsSQL.EOF %>
						  <tr bgcolor="<% = setRowColor(bgCount) %>">
							<td align="left"><% = rsSQL("State")  %></td>
							<td align="right"><% = rsSQL("STCount") %></td>
							<td align="right"><% = FormatNumber(rsSQL("STPercentage"),2) %>
							%</td>
						  </tr>
						  <%
						  bgCount = bgCount + 1
						  rsSQL.Movenext
						  Loop %>
						</table>
						<br />
						<% Set rsSQL = rsSQL.NextRecordset %>
						<!-- HOW FOUND -->
						<% bgCount = 0 %>
						<table width="335" border="0" cellpadding="3" cellspacing="0" >
						  <tr>
							<th>How Found</th>
							<th width="100" align="right"># Registrations</th>
							<th width="80" align="right">Percentage</th>
						  </tr>
						  <% Do While NOT rsSQL.EOF %>
						  <tr bgcolor="<% = setRowColor(bgCount) %>">
							<td align="left"><% = rsSQL("How_Found")  %></td>
							<td align="right"><% = rsSQL("HFound") %></td>
							<td align="right"><% = FormatNumber(rsSQL("HFPercentage"),2) %>
							%</td>
						  </tr>
						  <%
						  bgCount = bgCount + 1
						  rsSQL.Movenext
						  Loop %>
						</table>
					  </td>
					</tr>
				  </table></td>
			  </tr>
		</table>
	</div>
  </div>
</body>
</html>