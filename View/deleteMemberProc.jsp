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
		msg = "오류가 발생하였습니다.";
	}else if(id.equals("1")){
		msg="탈퇴를 성공 하였습니다";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="member.jsp";
</script>