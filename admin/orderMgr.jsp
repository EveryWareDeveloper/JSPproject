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
			<td><font color="#FFFFFF">�ֹ���ȣ</font></td>
            <td><font color="#FFFFFF">�ֹ���</font></td>
            <td><font color="#FFFFFF">��ǰ</font></td>
            <td><font color="#FFFFFF">�ֹ���¥</font></td>
            <td><font color="#FFFFFF">�ֹ�����</font></td>
		</tr>
		<%
				Vector<OrderBean> vlist = orderMgr.getOrderList();
				if(vlist.isEmpty()){
		%>
		<tr>
			<td align="center" colspan="7">�ֹ������� �����ϴ�.</td>
		</tr>
		<%}else{
				for(int i=0;i<vlist.size();i++){
					OrderBean order/*�ֹ� ����*/ = vlist.get(i);
					 ProductBean product/*��ǰ����*/ = pMgr.getProduct(order.getPid());
		%>
		<tr width="80%"  align="center" >
            <td><font color="#000000"><%=order.getOid()%></font></td>
            <td><font color="#000000"><%=order.getId()%></font></td>
            <td><font color="#000000"><%=product.getName()%></font></td>
            <td><font color="#000000"><%=order.getOdate()%></font></td>
            <td><font color="#000000">
            <%
                switch(order.getState()){
                    case "1" : out.println("������");break;
                    case "2" : out.println("����");break;
                    case "3" : out.println("�Ա�Ȯ��");break;
                    case "4" : out.println("����غ�");break;
                    case "5" : out.println("�����");break;
                    default : out.println("�Ϸ�");
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