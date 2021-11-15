<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script  src="script.js"></script>
</head>
<body bgcolor="#141e30" topmargin="100">
<%@ include file="top.jsp"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProductBean product = pMgr.getProduct(pid);
%>
<table width="75%" align="center" bgcolor="#FFF">
	<tr>
		<td align="center" bgcolor="#FFF">
		<table width="100%" align="center" bgcolor="#FFF" border="1">
			<tr bgcolor="#243b55">
				<td colspan="3" align="center"><font color="#FFFFFF"><%=product.getName()%></font></td>
			</tr>
			<tr>
				<td width="20%">
					<img src="../img/<%=product.getImg()%>"
					height="150" width="100%">
				</td>
				<td width="30%" valign="top">
				<table border="1" width="100%" height="100%">
					<tr>
						<td><b>��ǰ�̸� : </b><%=product.getName()%></td>
					</tr>
					<tr>
						<td><b>�� �� : </b><%=UtilMgr.intFormat(product.getPrice())%></td>
					</tr>
					<tr>
						<td><b>�԰�¥ : </b><%=product.getRdate()%></td>
					</tr>
					<tr>
						<td><b>�� �� : </b><%=UtilMgr.intFormat(product.getStock())%></td>
					</tr>
				</table>
				</td>
				<td width="50%" valign="top"><b>�󼼼���</b><br/>
				<pre><%=product.getDetail()%></pre></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				<a href="javascript:productUpdate('<%=product.getPid()%>')">�����ϱ�</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:productDelete('<%=product.getPid()%>')">�����ϱ�</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="update" method="post" action="productUpdate.jsp"><input
	type=hidden name=pid></form>
<form name="del" method="post" action="productProc.jsp?flag=delete">
<input type=hidden name=pid></form>
</body>
</html>


