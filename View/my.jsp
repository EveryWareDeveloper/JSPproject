<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<title>내정보</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
</head>
<br>
	<div align="center">
	  <tr> 
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</div>
<body>
	<%@ include file="top.jsp"%>
	<%
		MemberBean mBean = mMgr.getMember(id);
	%>

	<div class="member-box">
		<h2>내정보</h2>
		<form name="regForm" method="post" action="memberProc.jsp">
			<div class="box">
				<td><%=mBean.getId()%></td>
				<label >아이디</label>
			</div>
			<div class="box">
				<td><%=mBean.getPwd()%></td>
				<label>비밀번호</label>
			</div>
			<div class="box">
				<td><%=mBean.getName()%></td> 
				<label>이름</label>
			</div>
			<div class="box">
				<td><%=mBean.getGender()%></td>
				<label>성별</label>
			</div>
			<div class="box">
				<td><%=mBean.getBirthday()%></td>
				<label>생년월일</label>
			</div>
			<div class="box">
				<td><%=mBean.getEmail()%></td>
				<label>이메일</label>
			</div>
			<div class="box">
				<td><%=mBean.getZipcode()%></td>
				<label>우편번호</label>
			</div>
			<div class="box">
				<td><%=mBean.getAddress()%></td> 
				<label>주소</label>
			</div>
			<div class="box">
				<td><%=mBean.getHp()%></td>
				<label>전화번호</label>
			</div>
			<a class="button" href="#" onclick="win_close()">돌아가기</a>
			<a class="button" href="deleteMember.jsp" >회원탈퇴</a>
			<a class="button" href="memberUpdate.jsp" onclick="memberUpdate()">수정하기</a>
		</form>
	</div>
</body>
</html>
