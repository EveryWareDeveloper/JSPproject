<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<html>
<head>
<title>ȸ������</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<%
	MemberBean mBean = mMgr.getMember(id);
	%>
	<div class="member-box">
		<h2>������ ����</h2>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<div class="box">
			<td><%=mBean.getName()%></td>
			ȸ������ ������ �����մϴ�.
		</div>
		<div class="box">
			<td><%=mBean.getId()%></td>
			<label>���̵�</label>
		</div>
				<div class="box">
				<input name="pwd" value="<%=mBean.getPwd()%>">
		<label>�н�����</label>
					</div>
			<div class="box">
				<input name="name" value="<%=mBean.getName()%>">
			<label>�̸�</label>
				</div>
		<div class="gender-box">
				��<input class="gender" type="radio" name="gender" value="��" <%=mBean.getGender().equals("��") ? "checked" : ""%>> 
				��<input class="gender" type="radio" name="gender" value="��" <%=mBean.getGender().equals("��") ? "checked" : ""%>>
			<label>����</label>
				</div>
		<div class="box">
				<input name="birthday" value="<%=mBean.getBirthday()%>"> 
			<label>�������</label>
		</div>
		<div class="box">
				<input name="email" value="<%=mBean.getEmail()%>">
			<label>�̸���</label>
		</div>
		<div class="box">
			<label>�����ȣ</label>
				<input name="zipcode" value="<%=mBean.getZipcode()%>"> 
		</div>
				<input class="button2" type="button" value="�����ȣã��" onClick="zipCheck()">
		<div class="box">
			<label>�ּ�</label>
				<input name="address"  value="<%=mBean.getAddress()%>">
			</div>
		<div class="box">
				<input name="hp" value="<%=mBean.getHp()%>">
			<label>����ó</label>
		</div>
				<input class="button"  type="submit" value="�����Ϸ�" onclick="inputCheck()"> 
				<input class="button"  type="reset" value="�ٽþ���">
				<input class="button"  type="submit" value="���ư���" onclick="win_close">
	</div>
	<input type="hidden" name="id" value="<%=id%>">
	</form>
</body>
</html>
