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
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600"> 
			
				<td><font color="#FFFFFF">img</font></td>
				<td><font color="#FFFFFF">�̸�</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">��¥</font></td>
				<td><font color="#FFFFFF">�帣</font></td>
			</tr>
			<%
					for(int i=0;i<pvlist.size();i++){
						ProductBean pbean = pvlist.get(i);
			%>
			<tr align="center">
				<td width="30%;"><a href="javascript:productDetail('<%=pbean.getPid()%>')"><img src="img/<%=pbean.getImg() %>" height="200px" width="100%" ></a>
				<p>�̹����� Ŭ���ϸ� ���������� �̵��մϴ�.</p></td>
				<td><%=pbean.getName() %></td>
				<td>\<%=UtilMgr.monFormat(pbean.getPrice())%></td>
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




