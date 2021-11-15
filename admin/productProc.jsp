<!-- productProc.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	//insert, upgdate, delete
	String flag = request.getParameter("flag");
	String msg = "오류가 발생하였습니다.";
	if(flag.equals("insert")){
		if(pMgr.insertProduct(request))
			msg = "상품을 등록하였습니다.";
	}else if(flag.equals("update")){
		if(pMgr.updateProduct(request))
			msg = "상품을 수정하였습니다..";
	}else if(flag.equals("delete")){
		if(pMgr.deleteProduct(UtilMgr.parseInt(request, "pid")))
			msg = "상품을 등록하였습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="productMgr.jsp";
</script>