<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
    request.setCharacterEncoding("EUC-KR");
    String type = request.getParameter("type"); 
    Vector<ProductBean> pvlist = pMgr.getType(type);
%>
<!DOCTYPE html>
<html>
<head>
<title><%=type %></title>
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
			<td><font size="20px"><%=type%></font></td>
			</tr>
			<table height="70%" width="75%" align="center" bgcolor="#141e30" border="1">
			  <tr>
			  <%
                    for(int i=0;i<pvlist.size();i++){
                        ProductBean pbean = pvlist.get(i);
           		 %>
      			 <td>
			<div class="list_start" align="center">
			<div class="list_detail"> <a href="productDetail.jsp?pid=<%=pbean.getPid()%>"> 
			<img width="100%" height="150px"	src="img/<%=pbean.getImg()%>"></a>
			<p><%=pbean.getName()%><p>
			</div>
			</div>
			</td>
				<%} %>	
			</tr>	
			</table>
			</table>

</body>
</html>