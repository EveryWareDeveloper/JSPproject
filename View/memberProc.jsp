<%@ page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<jsp:useBean id="mBean" class="gamestore.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%boolean flag = mMgr.insertMember(mBean);%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 확인</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<body>
<br/><br/>
<div align="center">
<%
if(flag){
	  out.println("<b>회원가입을 축하 드립니다.</b><p>");
	  out.println("<a href=login.jsp>로그인</a>");
	}else{
	  out.println("<b>다시 입력하여 주십시오.</b><p>");
	  out.println("<a href=member.jsp>다시 가입</a>");
	}
%>
</div>
</body>
</html>
