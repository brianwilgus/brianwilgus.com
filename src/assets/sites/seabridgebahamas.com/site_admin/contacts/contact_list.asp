<% Dim strBodyID
strBodyID = "pg_list" %>
<!-- #Include Virtual="site_admin/includes/login_redirector.asp" -->
<!-- #Include Virtual="site_admin/includes/ADOVBS.INC" -->
<!-- #Include Virtual="site_admin/includes/connection_open.asp" -->
<%
'Alternate row color
Function setRowColor(bgCount)
	iLast = right(bgCount,1)
	Select Case iLast
		case "1","3","5","7","9"
			setRowColor = "row1"
		case else
			setRowColor = "row2"
	End Select
End Function

Function Selected (f,s)
	If f = s Then
		Response.Write "selected"
	End If
End Function

strSearchBy = Request("search_by")
strOrderBy = Request("order_by")
If strOrderBy = "" Then strOrderBy = "last_name, first_name"

If strSearchBy = "" Then strSearchBy = "first_name"
strSearchFor = Request("search_for")
If strSearchFor= "" Then strSearchFor = "%"

'GET CUSTOMERS FROM DATABASE
With cmdSQL
	.CommandType = adCmdStoredProc
	.CommandText = "SPV_get_contacts"
	.Parameters.Append .CreateParameter("search_by",adVarchar,adParamInput,30,strSearchBy)
	.Parameters.Append .CreateParameter("search_for",adVarchar,adParamInput,30,strSearchFor)
	.Parameters.Append .CreateParameter("order_by",adVarchar,adParamInput,30,strOrderBy)
End With

rsSQL.CursorLocation = 3
rsSQL.CursorType = 3
rsSQL.CacheSize = Application("contactpagesize")
rsSQL.PageSize = Application("contactpagesize")

rsSQL.Open cmdSQL, , adOpenStatic


' ERROR HANDLING
If Err.number <> 0 Or cnSQL.Errors.Count > 0 Then
	Response.Write Err.Description
	Response.End
End If %>
<!-- #Include Virtual="site_admin/includes/header_contacts.asp" -->
<script language="JavaScript">

function confDel(custID)
	{
		return (confirm('Are you sure you want to delete this Contact?\n\nThis operation cannot be undone'))
	}
</script>

<div id="main">
  <div id="col1" class="div_height"><img src="../admin-images/logo_seabridge_bahamas.gif" alt="Seabridge bahamas" /></div>
  <div id="col2" class="div_height">
    <!-- Sort the Data -->
    <div id="sort">
      <form name="searchForm" action="contact_list.asp" method="post">
        <ul>
          <li>Search for:</li>
          <li>
            <select name="search_by">
              <option value="first_name" <% = selected(strSearchBy,"first_name") %>>First Name</option>
              <option value="last_name" <% = selected(strSearchBy,"last_name") %>>Last Name</option>
              <option value="email" <% = selected(strSearchBy,"email") %>>Email</option>
            </select>
          </li>
          <li>
            <% If strSearchFor = "%" Then displaySearch = "" Else displaySearch = strSearchFor End If %>
            <input type="text" name="search_for" size="15" maxlength="30" value="<% = displaySearch %>" />
          </li>
          <li>Order By:</li>
          <li>
            <select name="order_by">
              <option value="last_name, first_name" <% = selected(strOrderBy,"last_name, first_name") %>>Last Name</option>
              <option value="date_entered desc" <% = selected(strOrderBy,"date_entered desc") %>>Date Entered (desc)</option>
            </select>
          </li>
          <li>
            <input type="submit" value="Go" class="saveButton" />
          </li>
        </ul>
      </form>
    </div>
    <!-- Sorted Data Next -->
    <div id="data">
      <table border="0" align="center" cellpadding="3" cellspacing="0">
        <tr valign="baseline">
          <th style="width:120px">Name</th>
          <th style="width:100px">Primary Phone</th>
          <th>Email</th>
          <th style="width:130px">Date</th>
          <th style="width:30px">&nbsp;</th>
          <th style="width:5px">&nbsp;</th>
          <th style="width:42px">&nbsp;</th>
        </tr>
      </table>
      <% If NOT rsSQL.EOF Then %>
      <% If Request.Querystring("page") = "" Then
								nPage = 1
							Else
								nPage = Request.Querystring("page")
							End If
				
							rsSQL.AbsolutePage = nPage
							
							bgCount = 0
							
							nRecordCount = rsSQL.RecordCount
							nPageCount = rsSQL.PageCount
							
							Do While NOT rsSQL.EOF AND nItem < rsSQL.PageSize %>
      <table border="0" align="center" cellpadding="3" cellspacing="0">
        <tr valign="baseline" class="<% = setRowColor(bgCount) %>">
          <td style="width:120px; text-align:left"><% = rsSQL("Last_Name") %>,
            <% = rsSQL("First_Name") %></td>
          <td style="width:100px; text-align:left"><% = rsSQL("Primary_Phone") %></td>
          <td align="left"><a href="mailto:<% = rsSQL("Email") %>">
            <% = rsSQL("Email") %>
            </a></td>
          <td style="width:130px; text-align:left" nowrap><% = rsSQL("Date_Entered") %></td>
          <td style="width:30px; text-align:right" nowrap><a href="edit_contact.asp?id=<% = rsSQL("Contact_ID") %>">Edit</a></td>
          <td style="width:5px; text-align:center" nowrap class="<% = setRowColor(bgCount) %>"><strong>:</strong></td>
          <td style="width:42px; text-align:left" nowrap><a href="create_edit_process.asp?id=<% = rsSQL("Contact_ID") %>&mode=delete" OnClick="return confDel('<% = rsSQL("Contact_ID") %>')">Delete</a></td>
        </tr>
      </table>
      <% bgCount = bgCount + 1
								rsSQL.Movenext
								nItem = nItem + 1
								Loop %>
      <% Else %>
      <table style="width:98%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr align="center" valign="middle" bgcolor="#FFFFFF">
          <td height="200"><h5>No contacts found.</h5></td>
        </tr>
      </table>
      <% End If %>
    </div>
  </div>
</div>
<div class="clear">
  <!-- This clears the floats -->
</div>
<div id="page">
  <% If nPageCount > 1 Then %>
  <div>&nbsp;Page:&nbsp;
    <% Dim pg
								   pg = 1
								   Do While pg <= nPageCount %>
    <% If pg > 1 Then %>
    |&nbsp;
    <% End If %>
    <a href="contact_list.asp?page=<% = pg %>&search_by=<% = strSearchBy %>&search_for=<% = strSearchFor %>">
    <% = pg %>
    </a>&nbsp;
    <% pg = pg + 1
									 Loop %>
  </div>
  <% End If %>
</div>
</div>
</body></html>