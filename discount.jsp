<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String discount = request.getParameter("discount");
	Vector<ProductBean> pvlist = pMgr.getDiscount(discount);	
%>
<!DOCTYPE html>
<html>
<head>
<title>Discount</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#141e30" topmargin="100" >
<%@ include file="header.jsp"%>
<br>
	<table width="75%" align="center" bgcolor="#141e30">
	<tr> 
	<td align="center" bgcolor="#141e30">
			<tr align="center" bgcolor="#243b55"> 
			
			<td><font size="20px">할인게임</font></td>
			
			</tr>
		<table height="70%" width="75%" align="center" bgcolor="#141e30" border="1">
			<tr>
			<%
					for(int i=0;i<pvlist.size();i++){
						ProductBean pbean = pvlist.get(i);
			%>
			<td>
			<a href="productDetail.jsp?pid=<%=pbean.getPid()%>">
				<img src="img/<%=pbean.getImg()%>" height="150px" width="100%">
			</a><p><%=pbean.getName()%><p>
			</td>
			<%}%>
			</tr>
		
		</table>
		</tr>
	</table>
</body>
</html>