<!-- orderProc.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		int oid = UtilMgr.parseInt(request, "oid");
		boolean result = false;
		String msg = "오류가 발생하였습니다.";
		if(flag.equals("update")){
			String state = request.getParameter("state");
			if(orderMgr.updateOrder(oid, state))
				msg = "수정 하였습니다.";
		}else if(flag.equals("delete")){
			if(orderMgr.deleteOrder(oid))
				msg = "삭제 하였습니다.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderMgr.jsp";
</script>





