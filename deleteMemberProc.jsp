<!-- productProc.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	//delete
	String id = request.getParameter("id");
	String msg = "";
	if(id.equals("0")){
		msg = "������ �߻��Ͽ����ϴ�.";
	}else if(id.equals("1")){
		msg="Ż�� ���� �Ͽ����ϴ�";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="member.jsp";
</script>