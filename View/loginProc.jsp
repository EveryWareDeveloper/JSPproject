<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="gamestore.MemberMgr" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	int mode = mgr.loginMember(id, pwd);

	if (mode == 0) {
		response.sendRedirect("logError.jsp?mode=0");
	} else if (mode == 1) {
		response.sendRedirect("logError.jsp?mode=1");
	} else if (mode == 2) {
		session.setAttribute("idKey", id);
	}
%>
<script>
	opener.location.reload();
	self.close();
</script>
