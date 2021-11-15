
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
String session_id = (String) session.getAttribute("session_id");
%>
<html>
<head>
<title>로그인 전후 화면</title>
<link href="css/log.css" rel="stylesheet" type="text/css">
</head>
<body >
    <div class='login'>
        <form name='frm_login' id='frm_login' method='post'>
            <!-- 공통 -->
            <input type='hidden' name='loginFlag' value='' />

            <%
            if (session_id == null) {
            %>
            <!-- 로그인 이전 화면 -->
            <div class="log">
                <a href="#" onclick="login()" > &nbsp;로그인&nbsp; </a> 
                <a href="#" onclick="member()"> 회원가입 </a>
            </div>
            <%
            } else {
            %>
            <!-- 로그인 이후 화면 -->
            <span><%=(session_id == null) ? "님" : session_id%> 환영합니다.</span>
            <input type='button' value='로그아웃' id='btnLogout' />
            <%
            }
            %>
        </form>
    </div>
</body>
</html>