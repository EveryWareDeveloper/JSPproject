<%@ page contentType="text/html;charset=EUC-KR" %>
<html>
<head>
<title>������ �α���</title>
<link href="../css/set.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#141e30" topmargin="100">
	<table width="75%" align="center" bgcolor="#243b55">
	<tr bordercolor="#141e30">  
	<td height="190">
		<form method="post" action="adminLoginProc.jsp">
		<table width="50%" border="1" align="center">
		<tr bordercolor="#FFFF66"> 
		<td colspan="2" align="center" bgcolor="#141e30">������ �α���</td>
		</tr>
		<tr  align="center"> 
		<td width="47%">Admin ID</td>
		<td width="53%"><input name="admin_id" value="admin"></td>
		</tr>
		<tr align="center"> 
		<td>Admin Password</td>
		<td><input name="admin_pwd" value="1234"></td>
		</tr>
		<tr bgcolor="#141e30"> 
		<td colspan="2" align="center"><input class="button" type="submit" value="login">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="button" type="reset" value="reset">
		</td>
		</tr>
		</table>
		</form>	
	</td>
	</tr>
	</table>
</body>
</html>