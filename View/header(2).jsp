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
		if (document.search.keyword.value == '') { //�˻�� ���� ���  
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
		<h1 align="center">game Store</h1>
		<div class="top">
			<div class="head1" name="log"></div>
			<div class="head2" align="center">game Store�� ���Ű� ȯ���մϴ�!</div>
					<form name="search" align="right" method="get" action="search.jsp">
			<div class="search-box">
				<input class="search-txt" name="keyword" placeholder="�˻�� �Է��ϼ���">
				<a href="#" class="search-btn" onclick="return keyword_check()">�˻�</a>
			</div>
		</form>
			<div class="head3">
				<div class="head3-1" name="log">
					<!-- ���� -->
					<input type='hidden' name='loginFlag' value='' />
					<%
					if (session_id == null) {
					%>
					<!-- �α��� ���� ȭ�� -->
					<a class="button" href="#" onclick="login()"> &nbsp;�α���&nbsp; </a>
					<a class="button" href="#" onclick="member()"> &nbsp;ȸ������&nbsp;
					</a>
					<%
					} else {
					%>
					<!-- �α��� ���� ȭ�� -->
					<%
					//�ؽ����̺��� ����� ��ü�� Ű���� ������.
					//Enumeration : ������ ���� ��ü
					Enumeration<Integer> hCartKey = hCart.keys();
					while (hCartKey.hasMoreElements()) {
						//Ű������ �ֹ���ü�� ����
						OrderBean order = hCart.get(hCartKey.nextElement());
						int productNo = order.getPid();
						//��ǰ��ȣ�� ��ǰ���� ����
						ProductBean pbean = pMgr.getProduct(productNo);
						String pName = pbean.getName();
						int price = pbean.getPrice(); // ��ǰ����    					
						int quantity = order.getQuantity(); // �ֹ� ����
						int discount = pbean.getDiscount();
						int subTotal = (price * quantity) - (price * quantity) * discount / 100;//�ֹ�����
						//��ü�ֹ�����
						totalPrice += subTotal;
					}
					double Mileage = 0.03;
					double Point = Math.floor(totalPrice * Mileage);
					%>
					<span><%=(session_id == null) ? "��" : session_id%>��&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="#" class="my" href="my.jsp" onclick="my()">������</a></span><br>
					<span>����Ʈ<%=Point%>P
					</span><br> <a href="logout.jsp" class="button" id='btnLogout'>�α׾ƿ�</a>
					<%
					}
					%>
				</div>
			</div>

		</div>

	</header>
</body>
</html>
