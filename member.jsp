<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<link href="css/member.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
</head>
<body>
	<div class="member-box">
		<h2>회원 가입</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<input type="text" name="id" required="" value=""> 
				<label>아이디</label>
			</div>
			<div class="idchack">
				<input class="button" type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)">
			</div>
			<div class="box">
				<input type="password" name="pwd" required="" value=""> 
				<label>비밀번호</label>
			</div>
			<div class="box">
				<input type="password" name="repwd" required="" value=""> 
				<label>비밀번호 확인</label>
			</div>
			<div class="box">
				<input type="text" name="name" required="" value=""> 
				<label>이름</label>
			</div>
			<div class="gender-box">
				남<input class="gender" type="radio" name="gender" value="남" checked> 
				여<input class="gender" type="radio" name="gender" value="여">
				<label>성별</label>
			</div>
			<div class="box">
				<input type="text" name="birthday" required="" value="ex) 9100101"> 
				<label>생년월일</label>
			</div>
			<div class="box">
				<input type="text" name="email" required="" value=""> 
				<label>이메일</label>
			</div>
			<div class="">
				<input class="button" type="button" value="우편번호찾기" onClick="zipCheck()">
			</div>
			<div class="box">
				<input type="text" name="zipcode" required="" value=""> 
				<label>우편번호</label>
			</div>
			<div class="box">
				<input type="text" name="address" required="" value=""> 
				<label>주소</label>
			</div>
			<div class="box">
				<input type="text" name="hp" required="" value="-빼고 입력해주세요"> 
				<label>전화번호</label>
			</div>
			<a href="#" onclick="inputCheck()"> 
			<span></span> 
			<span></span> 
			<span></span> 
			<span></span> 
			가입하기
			</a>
		</form>
	</div>
</body>
</html>
