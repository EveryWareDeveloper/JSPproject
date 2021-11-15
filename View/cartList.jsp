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
    <th><a href="productList.jsp">��ǰ���</a></th>
    <th><a href="cartList.jsp">��ٱ���</a></th>
    <th><a href="orderList.jsp">���Ÿ��</a></th>
  </tr>
</table>

	<table width="75%" align="center" >
		<tr>
			<td align="center">
				<table width="95%" align="center"  border="1">
					<tr align="center" >
						<td><font color="#FFFFFF">����</font></td>
						<td><font color="#FFFFFF">����</font></td>
						<td><font color="#FFFFFF">����</font></td>
						<td><font color="#FFFFFF">���ΰ���</font></td>
						<td><font color="#FFFFFF"></font></td>
					</tr>
					<%
					if (hCart.isEmpty()) {
					%>
					<tr>
						<td colspan="5" align="center">��ٱ��ϴ� ��� �ֽ��ϴ�.</td>
					</tr>
					<%
					} else {
					//�ؽ����̺��� ����� ��ü�� Ű���� ������.
					//Enumeration : ������ ���� ��ü
					Enumeration<Integer> hCartKey = hCart.keys();
					while (hCartKey.hasMoreElements()) {
						//Ű������ �ֹ���ü�� ����
						OrderBean order = hCart.get(hCartKey.nextElement());
						int pid = order.getPid();
						//��ǰ��ȣ�� ��ǰ���� ����
						ProductBean pbean = pMgr.getProduct(pid);
						String pName = pbean.getName();
						int price = pbean.getPrice(); // ��ǰ����
						int quantity = order.getQuantity();
						int discount = pbean.getDiscount();
						int subTotal = (price * quantity)-(price * quantity)*discount/100;//�ֹ�����
						//��ü�ֹ�����
						totalPrice += subTotal;
					%>
					<tr align="center">
						<form method="post" action="cartProc.jsp">
							<input type="hidden" name="pid" value="<%=pbean.getPid()%>">
							<td><a href="javascript:productDetail('<%=pid%>')"><%=pName%></a></td>
							<td><%=price %>��</td>
							<td><%=discount %>%</td>
							<td><%=UtilMgr.monFormat(subTotal)%>��</td>
							<td> 
								<input class="button2" type="button" value="����" size="3"	onclick="javascript:cartDelete(this.form)">
							</td>						
							 <input type="hidden" name="flag">
						</form>
					</tr>

					<tr>
						<td class="look" colspan="4" align="right">�� �ֹ��ݾ� : <%=UtilMgr.monFormat(totalPrice)%>��</td>
						<td align="center"><a href="orderProc.jsp" onclick="payForm()">�ֹ��ϱ�</a></td>							
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













