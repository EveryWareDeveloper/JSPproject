<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<title>ȸ�� Ż��</title>
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
				<h3>ȸ������ Ż�� �����մϴ�.</h3>
			</div>
			<br><br><br>
			<div class="point">ȸ�� Ż��� �������� ����Ʈ�� �Ҹ�˴ϴ�.<br><br>
			������ �����Ͻð� Ż�� ������ ���ּ���.
			</div>
			<br><br><br>
			<a href="#" onclick="win_close()">���ư���</a>
			<a href="javascript:memberDelete()">Ż���ϱ�</a>
		</form>
	</div>
	<form name="del" method="post" action="deleteMemberProc.jsp">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="flag" value="delete">
	</form>
</body>
</html>
