
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
String session_id = (String) session.getAttribute("session_id");
%>
<html>
<head>
<title>�α��� ���� ȭ��</title>
<link href="css/log.css" rel="stylesheet" type="text/css">
</head>
<body >
    <div class='login'>
        <form name='frm_login' id='frm_login' method='post'>
            <!-- ���� -->
            <input type='hidden' name='loginFlag' value='' />

            <%
            if (session_id == null) {
            %>
            <!-- �α��� ���� ȭ�� -->
            <div class="log">
                <a href="#" onclick="login()" > &nbsp;�α���&nbsp; </a> 
                <a href="#" onclick="member()"> ȸ������ </a>
            </div>
            <%
            } else {
            %>
            <!-- �α��� ���� ȭ�� -->
            <span><%=(session_id == null) ? "��" : session_id%> ȯ���մϴ�.</span>
            <input type='button' value='�α׾ƿ�' id='btnLogout' />
            <%
            }
            %>
        </form>
    </div>
</body>
</html>