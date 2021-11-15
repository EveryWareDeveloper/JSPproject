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
<title>회원가입 확인</title>
<link href="css/member.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
	<div class="member-box">
		<h2>입력하신 내용입니다.</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<input type="text" name="id" value="<jsp:getProperty name="mBean" property="id" />"> 
				<label>아이디</label>
			</div>
			<div class="box">
				<input name="pwd" value="<jsp:getProperty name="mBean" property="pwd" />" > 
				<label>비밀번호</label>
			</div>
			<div class="box">
				<input type="text" name="name" value="<jsp:getProperty name="mBean" property="name" />" > 
				<label>이름</label>
			</div>
			<div class="gender-box">
				남<input class="gender" type="radio" name="gender" value="남" <%=mBean.getGender().equals("남") ? "checked" : ""%>> 
				여<input class="gender" type="radio" name="gender" value="여" <%=mBean.getGender().equals("여") ? "checked" : ""%>>
				<label>성별</label>
			</div>
			<div class="box">
				<input type="text" name="birthday" value="<jsp:getProperty name="mBean" property="birthday" />"> 
				<label>생년월일</label>
			</div>
			<div class="box">
				<input type="text" name="email" value="<jsp:getProperty name="mBean" property="email" />"> 
				<label>이메일</label>
			</div>
			<div class="box">
				<input type="text" name="zipcode" value="<jsp:getProperty name="mBean" property="zipcode" />"> 
				<label>우편번호</label>
			</div>
			<div class="box">
				<input type="text" name="address" value="<jsp:getProperty name="mBean" property="address" />"> 
				<label>주소</label>
			</div>
			<div class="box">
				<input type="text" name="hp" value="<jsp:getProperty name="mBean" property="hp" />"> 
				<label>전화번호</label>
			</div>
			<a href="login.jsp" onclick=>가입하기</a>
			<a href="member.jsp" onclick=>다시쓰기</a> 
		</form>
	</div>
</body>
</html>
