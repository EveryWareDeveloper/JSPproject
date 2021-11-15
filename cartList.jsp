<!-- cartList.jsp -->
<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="gamestore.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="gamestore.CartMgr" />
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr"/>
<%
request.setCharacterEncoding("EUC-KR");
if (session.getAttribute("idKey") == null) {
	response.sendRedirect("login.jsp");
	return;
}
Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
int totalPrice = 0;
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
<script>
	function payForm(){
		window.open("payForm.jsp")
	}
</script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body topmargin="100"><br>
<form>
	<table width="75%" align="center">
  <tr> 
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</table>

	<table width="75%" align="center" >
		<tr>
			<td align="center">
				<table width="95%" align="center"  border="1">
					<tr align="center" >
						<td><font color="#FFFFFF">게임</font></td>
						<td><font color="#FFFFFF">원가</font></td>
						<td><font color="#FFFFFF">할인</font></td>
						<td><font color="#FFFFFF">할인가격</font></td>
						<td><font color="#FFFFFF"></font></td>
					</tr>
					<%
					if (hCart.isEmpty()) {
					%>
					<tr>
						<td colspan="5" align="center">장바구니는 비어 있습니다.</td>
					</tr>
					<%
					} else {
					//해쉬테이블에서 저장된 객체의 키값을 가져옴.
					//Enumeration : 줄줄이 사탕 객체
					Enumeration<Integer> hCartKey = hCart.keys();
					while (hCartKey.hasMoreElements()) {
						//키값으로 주문객체를 리턴
						OrderBean order = hCart.get(hCartKey.nextElement());
						int pid = order.getPid();
						//상품번호로 상품정보 리턴
						ProductBean pbean = pMgr.getProduct(pid);
						String pName = pbean.getName();
						int price = pbean.getPrice(); // 상품가격
						int quantity = order.getQuantity();
						int discount = pbean.getDiscount();
						int subTotal = (price * quantity)-(price * quantity)*discount/100;//주문가격
						//전체주문가격
						totalPrice += subTotal;
					%>
					<tr align="center">
						<form method="post" action="cartProc.jsp">
							<input type="hidden" name="pid" value="<%=pbean.getPid()%>">
							<td><a href="javascript:productDetail('<%=pid%>')"><%=pName%></a></td>
							<td><%=price %>원</td>
							<td><%=discount %>%</td>
							<td><%=UtilMgr.monFormat(subTotal)%>원</td>
							<td> 
								<input class="button2" type="button" value="삭제" size="3"	onclick="javascript:cartDelete(this.form)">
							</td>						
							 <input type="hidden" name="flag">
						</form>
					</tr>

					<tr>
						<td class="look" colspan="4" align="right">총 주문금액 : <%=UtilMgr.monFormat(totalPrice)%>원</td>
						<td align="center"><a href="orderProc.jsp" onclick="payForm()">주문하기</a></td>							
					<%
					} //--while
					%>			
</table>
			
		</tr>
		<%	}%>
	</table>
	</td>

	</tr>
	</table>


	<form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="pid">
	</form>
</form>
</body>

<div class="bottom" ><%@ include file="bottom.jsp"%></div>
</html>













