<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<title>������</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
</head>
<br>
	<div align="center">
	  <tr> 
    <th><a href="productList.jsp">��ǰ���</a></th>
    <th><a href="cartList.jsp">��ٱ���</a></th>
    <th><a href="orderList.jsp">���Ÿ��</a></th>
  </tr>
</div>
<body>
	<%@ include file="top.jsp"%>
	<%
		MemberBean mBean = mMgr.getMember(id);
	%>

	<div class="member-box">
		<h2>������</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<td><%=mBean.getId()%></td>
				<label >���̵�</label>
			</div>
			<div class="box">
				<td><%=mBean.getPwd()%></td>
				<label>��й�ȣ</label>
			</div>
			<div class="box">
				<td><%=mBean.getName()%></td> 
				<label>�̸�</label>
			</div>
			<div class="box">
				<td><%=mBean.getGender()%></td>
				<label>����</label>
			</div>
			<div class="box">
				<td><%=mBean.getBirthday()%></td>
				<label>�������</label>
			</div>
			<div class="box">
				<td><%=mBean.getEmail()%></td>
				<label>�̸���</label>
			</div>
			<div class="box">
				<td><%=mBean.getZipcode()%></td>
				<label>�����ȣ</label>
			</div>
			<div class="box">
				<td><%=mBean.getAddress()%></td> 
				<label>�ּ�</label>
			</div>
			<div class="box">
				<td><%=mBean.getHp()%></td>
				<label>��ȭ��ȣ</label>
			</div>
			<a class="button" href="#" onclick="win_close()">���ư���</a>
			<a class="button" href="deleteMember.jsp" >ȸ��Ż��</a>
			<a class="button" href="memberUpdate.jsp" onclick="memberUpdate()">�����ϱ�</a>
		</form>
	</div>
</body>
</html>
