<%@page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title>Simple Shopping Mall </title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body>
<%@ include file="top.jsp" %>
<table>
	<%if(id != null){%>
	<tr> 
		<!-- 로그인시 출력 -->
		<td align="center"><%=id%>님 방문해 주셔서 감사합니다.</td>
	</tr>
	<%}else{%>
	<tr>
		<!-- 로그인이 안되었을 경우 -->
		<td align="center">로그인 하신 후 이용해 주세요.</td>
	</tr>
	<%}%>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>  