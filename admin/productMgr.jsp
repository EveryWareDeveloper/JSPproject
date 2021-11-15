<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#141e30" topmargin="100">
<%@ include file="top.jsp"%>
<table width="75%" align="center" bgcolor="#141e30">
	<tr>
		<td align="center" bgcolor="#FFF">
		<table width="95%" align="center" bgcolor="#fff" border="1">
			<tr  align="center" bgcolor="#243b55">
				<td><font color="#fff">�̸�</font></td>
				<td><font color="#fff">����</font></td>
				<td><font color="#fff">��¥</font></td>
				<td><font color="#fff">���</font></td>
				<td>&nbsp;</td>
			</tr>
			<%
				Vector<ProductBean> vResult = pMgr.getProductList();
				if (vResult.size() == 0) {
			%>
			<tr>
				<td align="center" colspan="5">��ϵ� ��ǰ�� �����ϴ�.</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < vResult.size(); i++) {
						ProductBean product = vResult.get(i);
			%>
			<tr  align="center">
				<td><%=product.getName()%></td>
				<td><%=UtilMgr.intFormat(product.getPrice())%></td>
				<td><%=product.getRdate()%></td>
				<td><%=UtilMgr.intFormat(product.getStock())%></td>
				<td>
				<a href="javascript:productDetail('<%=product.getPid()%>')">�󼼺���</a></td>
			</tr>
			<%
					}//for
				}//if
			%>
			<tr>
				<td colspan="5" align="center" bgcolor="#243b55">
					<a href="productInsert.jsp"><font color="#fff">��ǰ���</font></a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
<form name="detail" method="post" action="productDetail.jsp">
	<input type="hidden" name="pid">
</form>
</body>
</html>