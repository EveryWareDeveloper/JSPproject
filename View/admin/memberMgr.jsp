<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, gamestore.*"%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<html>
<head>
<title>game store</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#141e30" topmargin="100">
	<%@ include file="top.jsp" %> 
	<%Vector<MemberBean> vlist = mMgr.getMemberList();%>
	<table width="75%" align="center" bgcolor="#fff">
	<tr> 
	<td align="center" bgcolor="#FFF">

		<table width="100%" align="center" bgcolor="#FFF" border="1">
		<tr align="center" bgcolor="#243b55"> 
			<td><font color="#fff">ȸ���̸�</font></td>
			<td><font color="#fff">ȸ�����̵�</font></td>
			<td><font color="#fff">�н�����</font></td>
			<td><font color="#fff">����</font></td> 
			<td><font color="#fff">�������</font></td> 
			<td><font color="#fff">�̸���</font></td>
			<td><font color="#fff">���Ϻ�����</font></td>
		</tr>
		<%
		for(int i=0; i<vlist.size(); i++){
			MemberBean mBean = vlist.get(i);
		%>
		<tr align="center" bgcolor="#fff"> 
			<td><%=mBean.getName()%></td>
			<td><%=mBean.getId()%></td>
			<td><%=mBean.getPwd()%></td>
			<td>
			<%=mBean.getGender().equals("��")?"����":"����"%> 
			</td>
			<td><%=mBean.getBirthday()%></td>
			<td><%=mBean.getEmail()%></td>
			<td><font color="#FFFFFF">
			<a href="sendAccount.jsp?id=<%=mBean.getId()%>">���Ϻ�����</a>
			</font></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
</body>
</html>
