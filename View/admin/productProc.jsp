<!-- productProc.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	//insert, upgdate, delete
	String flag = request.getParameter("flag");
	String msg = "������ �߻��Ͽ����ϴ�.";
	if(flag.equals("insert")){
		if(pMgr.insertProduct(request))
			msg = "��ǰ�� ����Ͽ����ϴ�.";
	}else if(flag.equals("update")){
		if(pMgr.updateProduct(request))
			msg = "��ǰ�� �����Ͽ����ϴ�..";
	}else if(flag.equals("delete")){
		if(pMgr.deleteProduct(UtilMgr.parseInt(request, "pid")))
			msg = "��ǰ�� ����Ͽ����ϴ�.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="productMgr.jsp";
</script>