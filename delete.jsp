<!-- delete.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="gamestore.BoardBean"%>
<%@page import="gamestore.UtilMgr"%>
<jsp:useBean id="mgr" class="gamestore.BoardMgr"/>
<!DOCTYPE html>
<html>
<head>
<% 
		request.setCharacterEncoding("EUC-KR");
		String nowPage = request.getParameter("nowPage");
		int num = UtilMgr.parseInt(request, "num");
		//비번을 입력을 받아서 삭제를 처리하는 기능
		if(request.getParameter("pass")!=null){
			BoardBean bean = (BoardBean)session.getAttribute("bean");
			String inPass = request.getParameter("pass");//delete.jsp입력한 pass값
			String dbPass = bean.getPass();
			//inPass==dbPass : 클래스타입은 객체의 주소값을 비교
			//int a==int b : 자바기본형은 값을  비교		
			if(inPass.equals(dbPass)/*객체 내용 비교*/){
				mgr.deleteBoard(num);
				String url = "boardQna.jsp?nowPage"+nowPage;
				response.sendRedirect(url);
			}else{%>
				<script type="text/javascript">
					alert("입력하신 비밀번호가 아닙니다.");
					history.back();
				</script>
			<%}
		}else{//비번을 입력받기 위한 폼 출력
%>
<title>JSP Board</title>
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
	<table width="50%" cellspacing="0" cellpadding="3">
		<tr>
			<td bgcolor=#dddddd height="21" align="center">
				사용자의 비밀번호를 입력해주세요.
			</td>
		</tr>
	</table>
	<form name="delFrm" method="post">
		<table width="70%" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center">
					<table width=80%>
						<tr>
							<td align="center">
								<input type="password" name="pass" size="17" maxlength="15">
							</td>
						</tr>
						<tr>
							<td><hr size="1" color="#eeeeee"/></td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="삭제완료" onClick="check()"> 
								<input type="reset" value="다시쓰기">
								<input type="button" value="뒤로" onClick="history.go(-1)">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="num" value="<%=num%>">
	</form>
</div>
<%} %>
</body>
</html>