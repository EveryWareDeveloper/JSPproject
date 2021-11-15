<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<html>
<head>
<title>gamestore</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
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
		<form method="post" action="productProc.jsp?flag=update"
			enctype="multipart/form-data">
		<table width="100%" align="center" bgcolor="#FFF" border="1">
			<tr bgcolor="#243b55">
				<td colspan="2" align="center"><font color="#FFFFFF">상품수정</font></td>
			</tr>
			<tr>
				<td width="31%" align="center">상품이름</td>
				<td width="69%" align="left">
					<input name="name" value="<%=product.getName()%>">
				</td>
			</tr>
			<tr>
				<td height="21" align="center">상품가격</td>
				<td align="left">
					<input name="price" size="20" value="<%=product.getPrice()%>">원
				</td>
			</tr>
			<tr>
				<td align="center">상품내용</td>
				<td>
				<textarea rows="10" cols="45" name="detail"><%=product.getDetail()%></textarea>
				</td>
			</tr>
			<tr>
				<td align="center">상품입고수량</td>
				<td align="left">
					<input name="stock" size="10" value="<%=product.getStock()%>">개
				</td>
			</tr>
			<tr>
				<td align="center">상품이미지</td>
				<td align="left">
				<img src="img/<%=product.getImg()%>"><br/>
				<input type="file" name="img"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="제품수정">&nbsp;&nbsp;&nbsp; <input type="reset"
					value="다시쓰기"></td>
			</tr>
		</table>
			<input type=hidden name="pid" value="<%=product.getPid()%>">
		</form>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp"%>
</body>
</html>