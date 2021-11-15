<!-- orderProc.jsp -->
<%@page import="java.util.Enumeration"%>
<%@page import="gamestore.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" class="gamestore.CartMgr" scope="session" />
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr"/>
<% 
		request.setCharacterEncoding("EUC-KR");
		//세션에 저장된 장바구니 객체를 리턴
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg = "";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				OrderBean order = hCart.get(hCartKey.nextElement());
				//주문처리
				orderMgr.insertOrder(order);
				//재고정리
				pMgr.reduceProduct(order);
				//장바구니에 주문한 상품삭제
				cMgr.deleteCart(order);
			}
			msg ="주문처리 하였습니다.";
		}else{
			msg = "장바구니가 비었습니다.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderList.jsp";
</script>








