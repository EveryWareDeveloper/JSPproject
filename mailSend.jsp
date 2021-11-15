<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>JSP Email</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
</head>
<body color="#FFF" bgcolor="#141e30">
<div align="center">
<br/><br/>
<table width="400"  cellpadding="3">
	<tr>
		<td height="25" align="center">비밀번호 찾기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="mailSendProc.jsp" >
<table width="400" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%"><font color="#FFF">Id</font></td>
				<td width="90%">
				<input name="id" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td><font color="#FFF">Email&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
				<td>
				<input name="email" size="30" maxlength="30">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					 <input class="button" type="submit" value="SEND">
					 <input class="button" type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>