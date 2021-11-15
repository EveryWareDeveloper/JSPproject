<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="gamestore.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<jsp:useBean id="cMgr" scope="session" class="gamestore.CartMgr" />
<%
request.setCharacterEncoding("EUC-KR");
String session_id = (String) session.getAttribute("idKey");

Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
int totalPrice = 0;
%>
<html>
<head>
<title>header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function login() {
		window.open('login.jsp', "login", "width=520, height=580");
	}
	function member() {
		window.open('member.jsp', "member", "width=620, height=900");
	}

	function my() {
		window.open('my.jsp', "my", "width=620, height=900");
	}

	function keyword_check() {
		if (document.search.keyword.value == '') { //검색어가 없을 경우  
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
		<h1 align="center">game Store</h1>
		<div class="top">
			<div class="head1" name="log"></div>
			<div class="head2" align="center">game Store에 오신걸 환영합니다!</div>
					<form name="search" align="right" method="get" action="search.jsp">
			<div class="search-box">
				<input class="search-txt" name="keyword" placeholder="검색어를 입력하세요">
				<a href="#" class="search-btn" onclick="return keyword_check()">검색</a>
			</div>
		</form>
			<div class="head3">
				<div class="head3-1" name="log">
					<!-- 공통 -->
					<input type='hidden' name='loginFlag' value='' />
					<%
					if (session_id == null) {
					%>
					<!-- 로그인 이전 화면 -->
					<a class="button" href="#" onclick="login()"> &nbsp;로그인&nbsp; </a>
					<a class="button" href="#" onclick="member()"> &nbsp;회원가입&nbsp;
					</a>
					<%
					} else {
					%>
					<!-- 로그인 이후 화면 -->
					<%
					//해쉬테이블에서 저장된 객체의 키값을 가져옴.
					//Enumeration : 줄줄이 사탕 객체
					Enumeration<Integer> hCartKey = hCart.keys();
					while (hCartKey.hasMoreElements()) {
						//키값으로 주문객체를 리턴
						OrderBean order = hCart.get(hCartKey.nextElement());
						int productNo = order.getPid();
						//상품번호로 상품정보 리턴
						ProductBean pbean = pMgr.getProduct(productNo);
						String pName = pbean.getName();
						int price = pbean.getPrice(); // 상품가격    					
						int quantity = order.getQuantity(); // 주문 수량
						int discount = pbean.getDiscount();
						int subTotal = (price * quantity) - (price * quantity) * discount / 100;//주문가격
						//전체주문가격
						totalPrice += subTotal;
					}
					double Mileage = 0.03;
					double Point = Math.floor(totalPrice * Mileage);
					%>
					<span><%=(session_id == null) ? "님" : session_id%>님&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="#" class="my" href="my.jsp" onclick="my()">내정보</a></span><br>
					<span>포인트<%=Point%>P
					</span><br> <a href="logout.jsp" class="button" id='btnLogout'>로그아웃</a>
					<%
					}
					%>
				</div>
			</div>

		</div>

	</header>
</body>
</html>
