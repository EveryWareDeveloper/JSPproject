<%@ page pageEncoding="EUC-KR"%>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>
<table width="75%" align="center" bgcolor="#fff">
  <tr bgcolor="#243b55"> 
  
    <th><a href="../admin/index.jsp"><font color="#fff">权</font></a></th>
    <th><a href="adminLogout.jsp"><font color="#fff">肺弊酒眶</font></a></th>
    <th><a href="memberMgr.jsp"><font color="#fff">雀盔包府</font></a></th>
    <th><a href="productMgr.jsp"><font color="#fff">惑前包府</font></a></th>
    <th><a href="orderMgr.jsp"><font color="#fff">林巩包府</font></a></th>
  </tr>
</table> 