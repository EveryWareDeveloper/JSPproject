<!-- orderProc.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		int oid = UtilMgr.parseInt(request, "oid");
		boolean result = false;
		String msg = "������ �߻��Ͽ����ϴ�.";
		if(flag.equals("update")){
			String state = request.getParameter("state");
			if(orderMgr.updateOrder(oid, state))
				msg = "���� �Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			if(orderMgr.deleteOrder(oid))
				msg = "���� �Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderMgr.jsp";
</script>





