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
		<!-- �α��ν� ��� -->
		<td align="center"><%=id%>�� �湮�� �ּż� �����մϴ�.</td>
	</tr>
	<%}else{%>
	<tr>
		<!-- �α����� �ȵǾ��� ��� -->
		<td align="center">�α��� �Ͻ� �� �̿��� �ּ���.</td>
	</tr>
	<%}%>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>  