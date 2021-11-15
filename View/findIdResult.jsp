<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script src="script.js" ></script>
</head>
<link href="css/set.css" rel="stylesheet" type="text/css">
<body>
 <form name="idsearch" method="post">
	<% 
		request.setCharacterEncoding("EUC-KR");
	    String name = request.getParameter("name");
	    String hp = request.getParameter("hp");
	    MemberBean mBean = mMgr.findId(name, hp);
%>
          <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=mBean.getId()%></div>
	      <h4>  입니다 </h4>
        <div class = "found-login" align="center">
 		    <input class="button" type="button"  id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input class="button" type="button" id="btnjoin"  value="회원가입" href="member.jsp"/>
       	</div>
      </form>
</body>
</html>