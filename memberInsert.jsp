<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mBean" class="gamestore.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<!DOCTYPE html>
<html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="css/member.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
	<div class="member-box">
		<h2>�Է��Ͻ� �����Դϴ�.</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<input type="text" name="id" value="<jsp:getProperty name="mBean" property="id" />"> 
				<label>���̵�</label>
			</div>
			<div class="box">
				<input name="pwd" value="<jsp:getProperty name="mBean" property="pwd" />" > 
				<label>��й�ȣ</label>
			</div>
			<div class="box">
				<input type="text" name="name" value="<jsp:getProperty name="mBean" property="name" />" > 
				<label>�̸�</label>
			</div>
			<div class="gender-box">
				��<input class="gender" type="radio" name="gender" value="��" <%=mBean.getGender().equals("��") ? "checked" : ""%>> 
				��<input class="gender" type="radio" name="gender" value="��" <%=mBean.getGender().equals("��") ? "checked" : ""%>>
				<label>����</label>
			</div>
			<div class="box">
				<input type="text" name="birthday" value="<jsp:getProperty name="mBean" property="birthday" />"> 
				<label>�������</label>
			</div>
			<div class="box">
				<input type="text" name="email" value="<jsp:getProperty name="mBean" property="email" />"> 
				<label>�̸���</label>
			</div>
			<div class="box">
				<input type="text" name="zipcode" value="<jsp:getProperty name="mBean" property="zipcode" />"> 
				<label>�����ȣ</label>
			</div>
			<div class="box">
				<input type="text" name="address" value="<jsp:getProperty name="mBean" property="address" />"> 
				<label>�ּ�</label>
			</div>
			<div class="box">
				<input type="text" name="hp" value="<jsp:getProperty name="mBean" property="hp" />"> 
				<label>��ȭ��ȣ</label>
			</div>
			<a href="login.jsp" onclick=>�����ϱ�</a>
			<a href="member.jsp" onclick=>�ٽþ���</a> 
		</form>
	</div>
</body>
</html>
