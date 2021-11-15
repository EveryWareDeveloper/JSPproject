<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="gamestore.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Vector"%>
<%@page import="gamestore.UtilMgr"%>

<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<jsp:useBean id="cMgr" scope="session" class="gamestore.CartMgr"/>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("EUC-KR");
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
			return;
		}
		
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		int totalPrice = 0;
%>	
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제시스템</title>
<script src="script.js"></script>
<link href="css/set.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="member-box">
		<h2>payForm</h2>
		<form name="loginFrm" action="payProc.jsp" method="post">
			<div class="box">
				<input type="text" name="id" required=""> <label>User ID:</label>
			</div>
			<div class="box">
			<input name="name" required=""><label>name:</label> 
			</div>
			
			<div class="box">
			<input name="email" required=""><label>email:</label> 
			</div>			
			<div class="box">
			<input name="phone" required=""><label>phone:</label> 
			</div>
			<div class="box">
			<input name="address" required=""><label>address:</label> 
			</div>
			<% 
				//해쉬테이블에서 저장된 객체의 키값을 가져옴.
				//Enumeration : 줄줄이 사탕 객체
				Enumeration<Integer> hCartKey = hCart.keys();
				while(hCartKey.hasMoreElements()){
					//키값으로 주문객체를 리턴
					OrderBean order = hCart.get(hCartKey.nextElement());
					int productNo = order.getPid();
					//상품번호로 상품정보 리턴
					ProductBean pbean = pMgr.getProduct(productNo);
					String pName = pbean.getName();
					int price = pbean.getPrice(); // 상품가격    					
					int quantity = order.getQuantity(); // 주문 수량
					int discount = pbean.getDiscount();
					int subTotal = (price * quantity)-(price * quantity)*discount/100;//주문가격
					//전체주문가격
					totalPrice += subTotal;					
				}
			%>
			<div class="box">
			<input name="totalPrice" value="<%=UtilMgr.monFormat(totalPrice) %>"><label>totalPrice:</label> 
			</div>
			<div >
				<input class="button" type="submit" value="결제하기" href="payProc.jsp">				
				<input type="hidden" name="flag" value="oid">
			</div>
			<br>
			<div>
				<a class="button2" href="cartList.jsp" >취소하기</a>
			</div>
		</form>
	</div>
		<form name="pay" method="post" >
		<input type="hidden" name="id">
	</form>	
</body>
</html>