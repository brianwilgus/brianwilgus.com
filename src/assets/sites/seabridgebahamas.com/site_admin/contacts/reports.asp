<%
Response.Buffer = True
Response.Expires = 60
Response.Expiresabsolute = Now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"
%>
<% Dim strBodyID
strBodyID = "pg_report" %>
<!-- #Include Virtual = "site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual = "site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual = "site_admin/includes/connection_open.asp" -->
<!-- #Include Virtual = "site_admin/includes/visit_count.asp" -->
<!-- #Include Virtual = "site_admin/includes/header_contacts.asp" -->
<%
Function setRowColor(bgCount)
	iLast = right(bgCount,1)
	Select Case iLast
		case "1","3","5","7","9"
			setRowColor = "row2"
		case else
			setRowColor = "row1"
	End Select
End Function


With cmdSQL
	.CommandType = adCmdStoredProc
	.CommandText = "SPV_get_traffic_report"
End With

rsSQL.Open cmdSQL
%>

<div id="main">
  <div id="col1" class="div_height"><img src="../admin-images/logo_seabridge_bahamas.gif" alt="Seabridge Bahamas" /></div>
  <div id="col2" class="div_height">
    <div id="reports">
<div style="padding:10px; text-align:center">&nbsp;&nbsp;&nbsp;<strong>Visit Counter:</strong>
              <% = intTotal %>
            </div>
            <div id="stats">
			<!-- WEEKS -->
			<table cellpadding="3" cellspacing="0" >
                    <%
						  bgCount = 0
						  intRegTotal = 0
						  intPercTotal = 0 %>
                    <tr>
                      <th>Week Start</b></th>
                      <th>Week End</b></th>
                      <th style="width:100px; text-align:right;"># Registrations</b></th>
                      <th style="width:80px; text-align:right;">Percentage</b></th>
                    </tr>
                    <% Do While NOT rsSQL.EOF %>
                    <tr class="<% = setRowColor(bgCount) %>">
                      <td style="text-align:left;"><% = FormatDateTime(rsSQL("Week_Start"),2)  %></td>
                      <td style="text-align:left;"><% = FormatDateTime(rsSQL("Week_End"),2) %></td>
                      <td style="text-align:right;"><% = rsSQL("Quantity") %></td>
                      <td style="text-align:right;"><% = FormatNumber(((rsSQL("Quantity") / intTotal) * 100),2) %>
                        %</td>
                    </tr>
                    <%
						  bgCount = bgCount + 1
						  intRegTotal = intRegTotal + rsSQL("Quantity")
						  intPercTotal = intPercTotal + FormatNumber(((rsSQL("Quantity") / intTotal) * 100),2) 
						  rsSQL.Movenext
						  Loop %>
                    <tr bgcolor="#FFFFFF">
                      <td align="right" colspan="2">TOTAL:</b></td>
                      <td align="right"><% = intRegTotal %>
                        </b></td>
                      <td align="right"><% = intPercTotal %>
                        %</b></td>
                    </tr>
                  </table>
			</div>
			<div id="chart1"><% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- STATE -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
						
						Do While NOT rsSQL.EOF
					    	strXML = strXML & "<set label='" & rsSQL("State") & " - " & FormatNumber(rsSQL("STPercentage"),2) & "%25 [" & rsSQL("STCount") & "]' value='" & FormatNumber(rsSQL("STPercentage"),2) & "' />"
						 rsSQL.Movenext
						 Loop
					
						strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
						strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
						strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td style="text-align:center; background-color:#FFFFFF;"><br />
                        STATE<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table>
                  <% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- HOW FOUND -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
							
							Do While NOT rsSQL.EOF
								strXML = strXML & "<set label='" & rsSQL("How_Found") & " - " & FormatNumber(rsSQL("HFPercentage"),2) & "%25 [" & rsSQL("HFound") & "]' value='" & FormatNumber(rsSQL("HFPercentage"),2) & "' />"
							 rsSQL.Movenext
							 Loop
						
							strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
							strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
							strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td style="text-align:center; background-color:#FFFFFF;"><br />
                        HOW FOUND<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table>
                  <% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- PREFERRED CONTACT -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
							
							Do While NOT rsSQL.EOF
								strXML = strXML & "<set label='" & rsSQL("Preferred_Contact") & " - " & FormatNumber(rsSQL("PCPercentage"),2) & "%25 [" & rsSQL("PContact") & "]' value='" & FormatNumber(rsSQL("PCPercentage"),2) & "' />"
							 rsSQL.Movenext
							 Loop
						
							strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
							strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
							strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td style="text-align:center; background-color:#FFFFFF;"><br />
                        PREFERRED CONTACT<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table></div>
			<div id="chart2"><% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- PRIMARY RESIDENCE -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
							
							Do While NOT rsSQL.EOF
								strXML = strXML & "<set label='" & rsSQL("Primary_Residence") & " - " & FormatNumber(rsSQL("PRPercentage"),2) & "%25 [" & rsSQL("PResidence") & "]' value='" & FormatNumber(rsSQL("PRPercentage"),2) & "' />"
							 rsSQL.Movenext
							 Loop
						
							strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
							strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
							strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td style="text-align:center; background-color:#FFFFFF;"><br />
                        PRIMARY RESIDENCE<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table>
                  <% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- HAVE VISITED -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
							
							Do While NOT rsSQL.EOF
								strXML = strXML & "<set label='" & rsSQL("Have_Visited") & " - " & FormatNumber(rsSQL("HVPercentage"),2) & "%25 [" & rsSQL("HVisited") & "]' value='" & FormatNumber(rsSQL("HVPercentage"),2) & "' />"
							 rsSQL.Movenext
							 Loop
						
							strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
							strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
							strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td  style="text-align:center; background-color:#FFFFFF;"><br />
                        HAVE VISITED NEW PROVIDENCE ISLAND<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table>
                  <% Set rsSQL = rsSQL.NextRecordset %>
                  <!-- GOLF MEMBERSHIP -->
                  <% strXML = "<chart showZeroPies='1' showPlotBorder='1' decimals='2' plotBorderColor='000000' showToolTip='0' enableRotation='1' bgColor='FFFFFF,CCCCCC' baseFont='Arial' baseFontSize='10' showValues='0'>"
							
							Do While NOT rsSQL.EOF
								strXML = strXML & "<set label='" & rsSQL("Want_Golf") & " - " & FormatNumber(rsSQL("WGPercentage"),2) & "%25 [" & rsSQL("WGolf") & "]' value='" & FormatNumber(rsSQL("WGPercentage"),2) & "' />"
							 rsSQL.Movenext
							 Loop
						
							strXML = strXML & "<styles><definition><style name='CaptionFont' type='font' font='Arial' size='14' color='666666' bold='1'/></definition>"
							strXML = strXML & "<application><apply toObject='Caption' styles='CaptionFont' /></application></styles>"
							strXML = strXML & "</chart>" %>
                  <table cellpadding="3" cellspacing="0">
                    <tr>
                      <td style="text-align:center; background-color:#FFFFFF;"><br />
                        INTERESTED IN GOLF MEMBERSHIP<br />
                        <script language="javascript">runChart("<% = strXML %>")</script></td>
                    </tr>
                  </table></div>
			
    </div>
	<div class="clear"><!-- clear the floats --></div>
  </div>
</div>
<div class="clear"><!-- This clear the floats --></div>
<div id="page">&nbsp;
  <!-- This div used in the List page -->
  &nbsp;</div>
</div>
</body></html>