<%@ page contentType="text/html;charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<%
	String admin_id = request.getParameter("admin_id");
	String admin_pwd = request.getParameter("admin_pwd");
	boolean adminCheck = mMgr.adminCheck(admin_id, admin_pwd);
    if(adminCheck) {
	    session.setAttribute("adminKey", admin_id);
%>
   <script>
   alert("어서오세요 관리자님!")
   location.href="index.jsp";
   </script>
<%}else{%>
   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="adminLogin.jsp";
   </script>
<%}%>
