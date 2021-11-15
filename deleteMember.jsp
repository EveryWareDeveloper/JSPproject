<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js" ></script>
</head>
<body>

	<%
		String id = (String)session.getAttribute("idKey");
		MemberBean mBean = mMgr.getMember(id);
	%>
	<div class="member-box">
		<h2></h2>
		<form name="regForm" method="post" >
			<div class="box">
				<h1><%=mBean.getName()%></h1>
				<h3>회원님의 탈퇴를 진행합니다.</h3>
			</div>
			<br><br><br>
			<div class="point">회원 탈퇴시 보유중인 포인트는 소멸됩니다.<br><br>
			신중히 생각하시고 탈퇴 진행을 해주세요.
			</div>
			<br><br><br>
			<a href="#" onclick="win_close()">돌아가기</a>
			<a href="javascript:memberDelete()">탈퇴하기</a>
		</form>
	</div>
	<form name="del" method="post" action="deleteMemberProc.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="flag" value="delete">
	</form>
</body>
</html>
