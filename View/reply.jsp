<!-- reply.jsp -->
<%@page import="gamestore.BoardBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- read.jsp 세션에 저장한 원글을 리턴 -->
<!-- scope가 session이면 같은 id가 있으면 가져와서 사용하고 없으면 생성 -->
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
   <td bgcolor="#CCCC00" height="21" align="center">답변하기</td>
  </tr>
</table>
<form method="post" action="gamestoreReply" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>제 목</td>
     <td>
	  <input name="subject" size="50" value="답변 : <%=subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="12" cols="50">
      	<%=content %>
      	========답변 글을 쓰세요.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>비밀 번호</td> 
     <td>
	  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <input class="button2" type="submit" value="답변등록" >
      <input class="button2" type="reset" value="다시쓰기">
      <input class="button2" type="button" value="뒤로" onClick="history.back()"></td>
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