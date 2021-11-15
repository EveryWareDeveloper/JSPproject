<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String session_id = (String) session.getAttribute("idKey");
%>
<jsp:useBean id="pBean" class="gamestore.ProductBean" />
<jsp:setProperty name="pBean" property="*" />
<html>
<head>
<title>header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<script src="script.js" type="text/javascript"></script>
<script type="text/javascript">
 function keyword_check(){
  	if(document.search.keyword.value==''){ //�˻�� ���� ���  
  		alert('�˻�� �Է��ϼ���'); //���â ��� 
 		document.search.keyword.focus(); //�ٽ� �˻�â���� ���ư� 
  		return false; 
 	 }
	 document.search.submit();
 }
</script>
</head>
<body>
	<header>
		<h1 align="center"><a class="h1" href="main.jsp">Game Store</a></h1>
		<div class="top">
			<div class="head1" name="log"></div>
			<div class="head2" align="center">Game Store�� ���Ű� ȯ���մϴ�!<br><br><br>
			<form name="search" method = "get" action="search.jsp">
				<div class="search-box">
				<input class="search-txt" name="keyword" placeholder="�˻�� �Է��ϼ���"> 
				<a href ="#" class="search-btn" onclick="return keyword_check()">�˻�</a>
				</div>
		</form>
			</div>
			<div class="head3">
			<div class="head3-1" name="log">
				<!-- ���� -->
				<input type='hidden' name='loginFlag' value='' />
				<%
				if (session_id == null) {
				%>
				<!-- �α��� ���� ȭ�� -->
				<a class="button" href="#" onclick="login()">  &nbsp;&nbsp;�α��� </a> &nbsp;
				<a class="button" href="#" onclick="member()"> &nbsp;ȸ������ </a>
				<%
				} else {
				%>
				<!-- �α��� ���� ȭ�� -->
				<span><%=(session_id == null) ? "��" : session_id%>��&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#" class="my" href="my.jsp" onclick="my()">������</a></span><br> 
				<span>����Ʈ&nbsp;:&nbsp;&nbsp;P</span><br> 
				<a href="logout.jsp" class="button" id='btnLogout' >�α׾ƿ�</a>
				<%
				}
				%>
				</div>
			</div>
			
		</div>
<!-- �˻� -->


	</header>
</body>
</html>
