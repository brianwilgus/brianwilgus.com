<% Dim strBodyID
strBodyID = "pg_export" %>

<!-- #Include Virtual = "site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual = "site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual = "site_admin/includes/connection_open.asp" -->
<%
With cmdSQL
		.CommandType = adCmdStoredProc
		.CommandText = "SPV_get_contacts_for_export"
End With

rsSQL.Open cmdSQL, , adOpenStatic

	Dim fso, fileNamePostage, fileNameEmail, fileNameComplete, writeFilePostage, writeFileEmail, writeFileComplete

	fileNamePostage = server.mappath("data_export/postage.tab")
	fileNameEmail = server.mappath("data_export/email.tab")
	fileNameComplete = server.mappath("data_export/complete.tab")
	
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	
	Set writefilePostage = fso.OpenTextFile(fileNamePostage, 2, True)
	Set writeFileEmail = fso.OpenTextFile(fileNameEmail, 2, True)
	Set writeFileComplete = fso.OpenTextFile(fileNameComplete, 2, True)
	
	Do While NOT rsSQL.EOF
		writeFilePostage.writeline(rsSQL("First_Name") & vbTab & rsSQL("Last_Name") & vbTab & rsSQL("Address1") & vbTab & rsSQL("Address2") & vbTab & rsSQL("City") & vbTab & rsSQL("State") & vbTab & rsSQL("Zip") & vbTab & rsSQL("Country"))
		writeFileEmail.writeline(rsSQL("First_Name") & vbTab & rsSQL("Last_Name") & vbTab & rsSQL("Email"))
		writeFileComplete.writeline(rsSQL("First_Name") & vbTab & rsSQL("Last_Name") & vbTab & rsSQL("Address1") & vbTab & rsSQL("Address2") & vbTab & rsSQL("City") & vbTab & rsSQL("State") & vbTab & rsSQL("Zip") & vbTab & rsSQL("Country") & vbTab & rsSQL("Primary_Phone") & vbTab & rsSQL("Secondary_Phone") & VBTab & rsSQL("Email") & vbTab & rsSQL("Preferred_Contact") & VBTab & rsSQL("How_Found") & vbTab & rsSQL("Primary_Residence") & VBTab & rsSQL("Have_Visited") & VBTab & rsSQL("Amenities") & VBTab & rsSQL("Want_Golf") & VBTab & rsSQL("Comments") & VBTab & rsSQL("Date_Entered"))
		rsSQL.MoveNext
	Loop
	writeFilePostage.Close
	writeFileEmail.Close
	writeFileComplete.Close
	set writeFilePostage = Nothing
	set writeFileEmail = Nothing
	set writeFileComplete = Nothing

	Set fso = Nothing 

	'-- Set the export time for all of these
	With cmdSQL
		.CommandType = adCmdStoredProc
		.CommandText = "SPV_update_export_time"
		'.Parameters.Delete 0
		.Execute, , adExecuteNoRecords
	End With
	%>

<!-- #Include Virtual = "site_admin/includes/connection_close.asp" -->
<!-- #Include Virtual = "site_admin/includes/header_contacts.asp" -->


	  <div id="main">
    <div id="col1" class="div_height"><img src="../admin-images/logo_seabridge_bahamas.gif" alt="Seabridge bahamas" /></div>
    <div id="col2" class="div_height">
      <div id="expo">
        <div class="border">
          <table width="100%" border="0" cellpadding="3" cellspacing="0">
            <tr valign="baseline">
              <th>Export List For US Postage Mail</th>
            </tr><tr valign="baseline">
              <td width="50%" height="70" align="center" valign="middle">Right click and select &quot;Save Target As...&quot; 
                to download list
                <p><a href="data_export/postage.tab" target="_blank">Postage Mailing List</a></p></td>
            </tr>
          </table>
        </div>
        <br />
        <div class="border">
          <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign="baseline">
              <th>Export List for Email</th>
            </tr>
            <tr valign="baseline">
              <td width="50%" height="70" align="center" valign="middle">Right click and select &quot;Save Target As...&quot; to download list
                <p><a href="data_export/email.tab" target="_blank">Email List</a></p></td>
            </tr>
          </table>
        </div>
        <br />
        <div class="border">
          <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr valign="baseline">
              <th>Export Complete List</th>
            </tr>
            <tr valign="baseline">
              <td width="50%" height="70" align="center" valign="middle" nowrap="nowrap"><p>Right click and select &quot;Save Target As...&quot; 
                to download list</p>
                <p><a href="data_export/complete.tab" target="_blank">Complete 
              Contact List</a></p></td>
            </tr>
          </table>
        </div>
		<p>&nbsp;</p>
      </div>
    </div>
  </div>
  <div class="clear"><!-- This clears the floats --></div>
  <div id="page">&nbsp;<!-- This div used in the List page -->&nbsp;</div>
</div>

</body>
</html>

