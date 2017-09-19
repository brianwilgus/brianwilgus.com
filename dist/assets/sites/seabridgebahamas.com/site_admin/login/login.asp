<% Dim strBodyID
strBodyID = "pg_login" %>

<!-- #Include Virtual="site_admin/includes/header_login.asp" -->

      <div id="main">
    <div id="col1" class="div_height"><img src="../admin-images/logo_seabridge_bahamas.gif" alt="Seabridge bahamas" /></div>
    <div id="col2" class="div_height">
      <!-- Sort the Data -->
      <div id="login">
         <% 
			  If Request.QueryString("loginerror") = "true" Then 
			  %>
			  <br /><div align="center" class="body">Either the user name or the password was incorrect.  Please try again.</div>
			  <%
			  End If 
			  %>
			  <form action="login_process.asp" method="post" name="loginform" id="loginform">
          <h3>Log-In</h3>
          <table width="500" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35%" align="right"><label for="label">User Id</label></td>
              <td align="left"><input type="text" name="txtUserID" id="txtUserID" style="width:200px" /></td>
            </tr>
            <tr>
              <td align="right"><label for="label">Password</label></td>
              <td align="left"><input type="password" name="txtPassword" id="txtPassword" style="width:200px" /></td>
            </tr>
            <tr>
              <td align="right">&nbsp;</td>
              <td align="left"><input name="Submit" type="submit" class="button" value="   Login   "></td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
			  </form>
      </div>
      <!-- Sorted Data Next -->
    </div>
  </div>
  <div class="clear"><!-- This clears the floats --></div>
  <div id="page">&nbsp;<!-- This div used in the List page -->&nbsp;</div>
  </div>
</body>
</html>
