<%@ page pageEncoding="EUC-KR"%>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#fff">
  <tr bgcolor="#243b55"> 
  
    <th><a href="../admin/index.jsp"><font color="#fff">Ȩ</font></a></th>
    <th><a href="adminLogout.jsp"><font color="#fff">�α׾ƿ�</font></a></th>
    <th><a href="memberMgr.jsp"><font color="#fff">ȸ������</font></a></th>
    <th><a href="productMgr.jsp"><font color="#fff">��ǰ����</font></a></th>
    <th><a href="orderMgr.jsp"><font color="#fff">�ֹ�����</font></a></th>
  </tr>
</table> 