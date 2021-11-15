<!-- productList.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>

<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> pvlist = pMgr.getProductList();

%>
<html>
<head>
<title>Game Store</title>
<style type="text/css">
body{
	color: #FFF;
}

h3{
	font-size: 20px;
}
#tr_hover:hover {
    background-color:#CCCCCC;
    color: #000000;
	opacity: 0.8;    

}
</style>
<script src="script.js"></script>
</head>
<body bgcolor="#141e30">
	<table width="100%" align="center">
	<tr> 
	<td align="center" >
	<h3>Game List</h3>
		<table class="table table-hover" border="1">
			<tr align="center" color="#">
				<td></td>
				<td>게임이름</td>
				<td>가격</td>
				<td>출시일</td>
				<td>장르</td>			
			</tr>
			<%
					for(int i=0;i<pvlist.size();i++){
						ProductBean pbean = pvlist.get(i);
			%>
			<tr id="tr_hover" align="center" >
				<td width="30%"><a href="javascript:productDetail('<%=pbean.getPid()%>')"><img src="img/<%=pbean.getImg() %>" height="150px" width="100%" ></a>
				</td>
				<td><%=pbean.getName() %></td>
				<td><%=UtilMgr.monFormat(pbean.getPrice())%></td>
				<td><%=pbean.getRdate()%></td>
				<td><%=pbean.getType()%></td>
			</tr>	
			<%}%>
			</table>
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="pid">
	</form>
</body>
</html>




