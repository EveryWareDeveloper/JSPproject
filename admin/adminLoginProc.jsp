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
   alert("������� �����ڴ�!")
   location.href="index.jsp";
   </script>
<%}else{%>
   <script>
   alert("�Է��� ������ ��Ȯ���� �ʽ��ϴ�.");
   location.href="adminLogin.jsp";
   </script>
<%}%>
