<%@ page contentType="text/html;charset=EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<jsp:useBean id="mBean" class="gamestore.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%boolean flag = mMgr.insertMember(mBean);%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<body>
<br/><br/>
<div align="center">
<%
if(flag){
	  out.println("<b>ȸ�������� ���� �帳�ϴ�.</b><p>");
	  out.println("<a href=login.jsp>�α���</a>");
	}else{
	  out.println("<b>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b><p>");
	  out.println("<a href=member.jsp>�ٽ� ����</a>");
	}
%>
</div>
</body>
</html>
