<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.util.*, gamestore.*"%>
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr" />
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<html>
<head>
<title>gamestore</title>
<link	href="../css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#141e30" topmargin="100">
	<%@ include file="top.jsp" %>
	<table  width="75%"  align="center" bgcolor="#FFF">
	<tr> 
	<td align="center" bgcolor="#FFF">
	
		<table width="100%"  align="center" bgcolor="#FFF" border="1">
		<tr  align="center" bgcolor="#243b55"> 
			<td><font color="#FFFFFF">주문번호</font></td>
            <td><font color="#FFFFFF">주문자</font></td>
            <td><font color="#FFFFFF">제품</font></td>
            <td><font color="#FFFFFF">주문날짜</font></td>
            <td><font color="#FFFFFF">주문상태</font></td>
		</tr>
		<%
				Vector<OrderBean> vlist = orderMgr.getOrderList();
				if(vlist.isEmpty()){
		%>
		<tr>
			<td align="center" colspan="7">주문내역이 없습니다.</td>
		</tr>
		<%}else{
				for(int i=0;i<vlist.size();i++){
					OrderBean order/*주문 정보*/ = vlist.get(i);
					 ProductBean product/*제품정보*/ = pMgr.getProduct(order.getPid());
		%>
		<tr width="80%"  align="center" >
            <td><font color="#000000"><%=order.getOid()%></font></td>
            <td><font color="#000000"><%=order.getId()%></font></td>
            <td><font color="#000000"><%=product.getName()%></font></td>
            <td><font color="#000000"><%=order.getOdate()%></font></td>
            <td><font color="#000000">
            <%
                switch(order.getState()){
                    case "1" : out.println("접수중");break;
                    case "2" : out.println("접수");break;
                    case "3" : out.println("입금확인");break;
                    case "4" : out.println("배송준비");break;
                    case "5" : out.println("배송중");break;
                    default : out.println("완료");
                }
            %>
            </font>
            </td>

        </tr>
		<%	
					}//---for
				}//---if
		%>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
</body>
</html>