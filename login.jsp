<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
	    String recentURI = request.getParameter("from");
%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
</head>
<body>
<div class="login-box">
  <h2>로그인</h2>
  <form name="loginFrm" method="post" action="loginProc.jsp">
    <div class="user-box">
      <input type="text" name="id" required="" value="">
      <label>Username</label>
    </div>
    <div class="user-box">
      <input type="password" name="pwd" required="" value="">
      <label>Password</label>
    </div>
    <a href="findid.jsp">ID 찾기</a><span>&nbsp;&nbsp;</span>
    <a href="mailSend.jsp">PW 찾기</a><br>
    <a href="#"  onclick="loginCheck()">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      로그인
    </a>
  </form>
</div>
</body>
</html>
