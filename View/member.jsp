<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� ����</title>
<link href="css/member.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
</head>
<body>
	<div class="member-box">
		<h2>ȸ�� ����</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<input type="text" name="id" required="" value=""> 
				<label>���̵�</label>
			</div>
			<div class="idchack">
				<input class="button" type="button" value="ID�ߺ�Ȯ��" onClick="idCheck(this.form.id.value)">
			</div>
			<div class="box">
				<input type="password" name="pwd" required="" value=""> 
				<label>��й�ȣ</label>
			</div>
			<div class="box">
				<input type="password" name="repwd" required="" value=""> 
				<label>��й�ȣ Ȯ��</label>
			</div>
			<div class="box">
				<input type="text" name="name" required="" value=""> 
				<label>�̸�</label>
			</div>
			<div class="gender-box">
				��<input class="gender" type="radio" name="gender" value="��" checked> 
				��<input class="gender" type="radio" name="gender" value="��">
				<label>����</label>
			</div>
			<div class="box">
				<input type="text" name="birthday" required="" value="ex) 9100101"> 
				<label>�������</label>
			</div>
			<div class="box">
				<input type="text" name="email" required="" value=""> 
				<label>�̸���</label>
			</div>
			<div class="">
				<input class="button" type="button" value="�����ȣã��" onClick="zipCheck()">
			</div>
			<div class="box">
				<input type="text" name="zipcode" required="" value=""> 
				<label>�����ȣ</label>
			</div>
			<div class="box">
				<input type="text" name="address" required="" value=""> 
				<label>�ּ�</label>
			</div>
			<div class="box">
				<input type="text" name="hp" required="" value="-���� �Է����ּ���"> 
				<label>��ȭ��ȣ</label>
			</div>
			<a href="#" onclick="inputCheck()"> 
			<span></span> 
			<span></span> 
			<span></span> 
			<span></span> 
			�����ϱ�
			</a>
		</form>
	</div>
</body>
</html>
