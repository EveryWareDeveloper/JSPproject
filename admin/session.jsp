<%@ page contentType="text/html; charset=EUC-KR"%>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<title>Session</title>
</head>
<body>
<!-- ���� �ʱ�ȭ �� ùȭ�� �̵� -->
<%
      session.invalidate();
      response.sendRedirect("session.jsp");
%>
<script>
	//����â ���ΰ�ħ(�θ�â)
	opener.parent.location.reload();
	window.close(); 
	//opener.parent.location="main.jsp";
	//opener.location.reload();
	//self.close();
</script>
</body>
</html>