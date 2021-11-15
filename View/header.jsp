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
  	if(document.search.keyword.value==''){ //검색어가 없을 경우  
  		alert('검색어를 입력하세요'); //경고창 띄움 
 		document.search.keyword.focus(); //다시 검색창으로 돌아감 
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
			<div class="head2" align="center">Game Store에 오신걸 환영합니다!<br><br><br>
			<form name="search" method = "get" action="search.jsp">
				<div class="search-box">
				<input class="search-txt" name="keyword" placeholder="검색어를 입력하세요"> 
				<a href ="#" class="search-btn" onclick="return keyword_check()">검색</a>
				</div>
		</form>
			</div>
			<div class="head3">
			<div class="head3-1" name="log">
				<!-- 공통 -->
				<input type='hidden' name='loginFlag' value='' />
				<%
				if (session_id == null) {
				%>
				<!-- 로그인 이전 화면 -->
				<a class="button" href="#" onclick="login()">  &nbsp;&nbsp;로그인 </a> &nbsp;
				<a class="button" href="#" onclick="member()"> &nbsp;회원가입 </a>
				<%
				} else {
				%>
				<!-- 로그인 이후 화면 -->
				<span><%=(session_id == null) ? "님" : session_id%>님&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#" class="my" href="my.jsp" onclick="my()">내정보</a></span><br> 
				<span>포인트&nbsp;:&nbsp;&nbsp;P</span><br> 
				<a href="logout.jsp" class="button" id='btnLogout' >로그아웃</a>
				<%
				}
				%>
				</div>
			</div>
			
		</div>
<!-- 검색 -->


	</header>
</body>
</html>
