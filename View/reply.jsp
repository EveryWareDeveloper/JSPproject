<!-- reply.jsp -->
<%@page import="gamestore.BoardBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- read.jsp ���ǿ� ������ ������ ���� -->
<!-- scope�� session�̸� ���� id�� ������ �����ͼ� ����ϰ� ������ ���� -->
<jsp:useBean id="bean" class="gamestore.BoardBean" scope="session"/>
<%
	//BoardBean bean = (BoardBean)session.getAttribute("bean");
	String nowPage = request.getParameter("nowPage");
	String numPerPage = request.getParameter("numPerPage");
	String subject = bean.getSubject();
	String content = bean.getContent();
%>
<html>
<head>
<title>JSPBoard</title>
<link href="css/set.css" rel="stylesheet">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br><br>
 <table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#CCCC00" height="21" align="center">�亯�ϱ�</td>
  </tr>
</table>
<form method="post" action="gamestoreReply" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">�� ��</td>
     <td width="80%">
	  <input name="name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>�� ��</td>
     <td>
	  <input name="subject" size="50" value="�亯 : <%=subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td>�� ��</td>
     <td>
	  <textarea name="content" rows="12" cols="50">
      	<%=content %>
      	========�亯 ���� ������.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>��� ��ȣ</td> 
     <td>
	  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <input class="button2" type="submit" value="�亯���" >
      <input class="button2" type="reset" value="�ٽþ���">
      <input class="button2" type="button" value="�ڷ�" onClick="history.back()"></td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="numPerPage" value="<%=numPerPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form> 
</div>
</body>
</html>