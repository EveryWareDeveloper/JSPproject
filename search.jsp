<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="gamestore.ProductMgr"/>
<%
		/* db���� ��ǰ �̸����� �˻� �� �ҷ����� */
		request.setCharacterEncoding("EUC-KR");
		String keyword = null;
		Vector<ProductBean> vlist = null;
		keyword = request.getParameter("keyword");
		vlist = mgr.searchRead(keyword);
%>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<meta charset=UTF-8>
<title>��ǰ �˻�</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#141e30">
<jsp:include page="header.jsp"></jsp:include>
<br>
	<table width="75%" align="center" bgcolor="#141e30">
	<tr>
	<td align="center" bgcolor="#141e30">
				<tr>
				<%
							if(vlist.isEmpty()){
				%>
					<td align="center" class="button"><br/>�˻��� ����� �����ϴ�.</td>
				</tr>
		<table height="70%" width="75%" align="center" bgcolor="#141e30" border="1">
					<tr>
				<% 			
						}else{
				%>
				<%
						for(int i=0;i<vlist.size();i++){
							ProductBean bean = vlist.get(i);
							String pname = bean.getName();
							String img = bean.getImg();
				%>
					<td align="center">
					<a href="productDetail.jsp?pid=<%=bean.getPid()%>">
						<img src="img/<%=bean.getImg()%>" height="150px" width="200px">
					</a><p><%=bean.getName()%><p>
					</td>
							<%}//---for
						}//---if1	
				%>
				</tr>
				</table>
	</tr>
	</table>
</body>
</html>