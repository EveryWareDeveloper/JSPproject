<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<html>
<head>
<title>ȸ������</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#141e30">
	<br>
	<%@ include file="top.jsp"%>
	<%
		String id = request.getParameter("id");
		MemberBean mBean = mMgr.getMember(id);
	%>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<table width="75%" align="center" bgcolor="#FFF">
			<tr>
				<td align="center" bgcolor="#FFF">
					<table width="100%" align="center" bgcolor="#FFf" border="1">
						<tr align="center" bgcolor="#243b55">
							<td colspan="3"><font color="#FFFFFF"><b> <%=mBean.getName()%>
										ȸ������ ������ �����մϴ�.
								</b></font></td>
						</tr>
						<tr>
							<td>���̵�</td>
							<td><%=mBean.getId()%></td>
						</tr>
						<tr>
							<td>�н�����</td>
							<td><input name="pwd" value="<%=mBean.getPwd()%>"></td>
						</tr>
						<tr>
							<td>�̸�</td>
							<td><input name="name" value="<%=mBean.getName()%>"></td>
						</tr>
						<tr>
							<td>����</td>
							<td>��<input type="radio" name="gender" value="��"
								<%=mBean.getGender().equals("��") ? "checked" : ""%>> ��<input
								type="radio" name="gender" value="��"
								<%=mBean.getGender().equals("��") ? "checked" : ""%>>
							</td>
						</tr>
						<tr>
							<td>�̸���</td>
							<td><input name="email" size="30"
								value="<%=mBean.getEmail()%>"></td>
						</tr>
						<tr>
							<td>�������</td>
							<td><input name="birthday" value="<%=mBean.getBirthday()%>"></td>
						</tr>
						<tr>
							<td>�����ȣ</td>
							<td><input name="zipcode" value="<%=mBean.getZipcode()%>">
								<input type="button" value="�����ȣã��" onClick="zipCheck()">
							</td>
						</tr>
						<tr>
							<td>�ּ�</td>
							<td><input name="address" size="50"
								value="<%=mBean.getAddress()%>"></td>
						</tr>
						<tr>
							<td>H.P</td>
							<td><input name="hp" size="50"
								value="<%=mBean.getHp()%>"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="�����Ϸ�"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="�ٽþ���"></td>
						</tr>
						<input type="hidden" name="id" value="<%=id%>">
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>
