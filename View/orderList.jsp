<%@page import="gamestore.ProductBean"%>
<%@page import="gamestore.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="gamestore.OrderMgr"/>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
        if(session.getAttribute("idKey")==null){
            response.sendRedirect("login.jsp");
            return;
        }
%>
<html>
<head>
<title>gamestore</title>
</head>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>    
<body  topmargin="100">
<jsp:include page="header.jsp"></jsp:include>
<br>
<table width="75%" align="center" >
  <tr bgcolor="#141e30"> 
    <th><a href="productList.jsp">��ǰ���</a></th>
    <th><a href="cartList.jsp">��ٱ���</a></th>
    <th><a href="orderList.jsp">���Ÿ��</a></th>
  </tr>
</table>

    <table width="80%" align="center" >
    <tr> 
    <td align="center" >
        <table width="95%"  bgcolor="#243b55" border="1">
        <tr bgcolor="#141e30" align="center"> 
            <td><font color="#FFFFFF">�ֹ���ȣ</font></td>
            <td><font color="#FFFFFF">��ǰ</font></td>
            <td><font color="#FFFFFF">���ż���</font></td>
            <td><font color="#FFFFFF">���ų�¥</font></td>
            <td><font color="#FFFFFF">���Ż���</font></td>
        </tr>
        <%
                String id = (String)session.getAttribute("idKey");
                Vector<OrderBean> vlist = orderMgr.getOrderList(id);
                if(vlist.isEmpty()){
        %>
        <tr>
            <td colspan="5" align="center" >
            �ֹ��Ͻ� ��ǰ�� �����ϴ�.
            </td>
        </tr>
        <%            
                }else{    
                    for(int i=0;i<vlist.size();i++){
                        OrderBean order = vlist.get(i);
                        int pid = order.getPid();
                        ProductBean pbean = pMgr.getProduct(pid);
        %>
        <tr align="center">
            <td><%=order.getOid()%></td>
            <td>
            <a href="javascript:productDetail('<%=pid%>')">
                <%=pbean.getName()%></a>
            </td>
            <td><%=order.getQuantity() %></td>
            <td><%=order.getOdate()%></td>
            <td>
            <%
                switch(order.getState()){
                    case "1": out.print("�Ϸ�"); break;
                }//---switch
            %>
            </td>
        </tr>    
        <%        
                    }//--for
                }//--if-else 
        %>
        </table> 
    </td>
    </tr>
    </table>
    
    <form name="detail" method="post" action="productDetail.jsp" >
    <input type="hidden" name="no">
    </form>
    </body>
</html>
