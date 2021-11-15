<%@ page contentType="text/html; charset=EUC-KR"%>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<title>Session</title>
</head>
<body>
<!-- 세션 초기화 및 첫화면 이동 -->
<%
      session.invalidate();
      response.sendRedirect("session.jsp");
%>
<script>
	//메인창 새로고침(부모창)
	opener.parent.location.reload();
	window.close(); 
	//opener.parent.location="main.jsp";
	//opener.location.reload();
	//self.close();
</script>
</body>
</html>