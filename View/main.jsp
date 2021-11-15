<%@ page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game Store</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<div class="column-layout" id='content'>
	<!-- 왼쪽 카테고리 -->
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="main-column">

			<jsp:include page="slide1.jsp"></jsp:include>
			<%@ include file="productList.jsp" %>
		</div>
	</div>
	<!-- footer -->
</body>
<%@include file="bottom.jsp" %>
</html>