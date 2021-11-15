<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<html>
<head>
<title>회원수정</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<%
	MemberBean mBean = mMgr.getMember(id);
	%>
	<div class="member-box">
		<h2>프로필 수정</h2>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<div class="box">
			<td><%=mBean.getName()%></td>
			회원님의 정보를 수정합니다.
		</div>
		<div class="box">
			<td><%=mBean.getId()%></td>
			<label>아이디</label>
		</div>
				<div class="box">
				<input name="pwd" value="<%=mBean.getPwd()%>">
		<label>패스워드</label>
					</div>
			<div class="box">
				<input name="name" value="<%=mBean.getName()%>">
			<label>이름</label>
				</div>
		<div class="gender-box">
				남<input class="gender" type="radio" name="gender" value="남" <%=mBean.getGender().equals("남") ? "checked" : ""%>> 
				여<input class="gender" type="radio" name="gender" value="여" <%=mBean.getGender().equals("여") ? "checked" : ""%>>
			<label>성별</label>
				</div>
		<div class="box">
				<input name="birthday" value="<%=mBean.getBirthday()%>"> 
			<label>생년월일</label>
		</div>
		<div class="box">
				<input name="email" value="<%=mBean.getEmail()%>">
			<label>이메일</label>
		</div>
		<div class="box">
			<label>우편번호</label>
				<input name="zipcode" value="<%=mBean.getZipcode()%>"> 
		</div>
				<input class="button2" type="button" value="우편번호찾기" onClick="zipCheck()">
		<div class="box">
			<label>주소</label>
				<input name="address"  value="<%=mBean.getAddress()%>">
			</div>
		<div class="box">
				<input name="hp" value="<%=mBean.getHp()%>">
			<label>연락처</label>
		</div>
				<input class="button"  type="submit" value="수정완료" onclick="inputCheck()"> 
				<input class="button"  type="reset" value="다시쓰기">
				<input class="button"  type="submit" value="돌아가기" onclick="win_close">
	</div>
	<input type="hidden" name="id" value="<%=id%>">
	</form>
</body>
</html>
