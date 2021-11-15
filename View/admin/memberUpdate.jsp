<%@ page contentType="text/html;charset=EUC-KR"%>
<%@ page import="java.util.*,gamestore.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<html>
<head>
<title>회원수정</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#141e30">
	<br>
	<%@ include file="top.jsp"%>
	<%
		String id = request.getParameter("id");
		MemberBean mBean = mMgr.getMember(id);
	%>
	<form name="regForm" method="post" action="memberUpdateProc.jsp">
		<table width="75%" align="center" bgcolor="#FFF">
			<tr>
				<td align="center" bgcolor="#FFF">
					<table width="100%" align="center" bgcolor="#FFf" border="1">
						<tr align="center" bgcolor="#243b55">
							<td colspan="3"><font color="#FFFFFF"><b> <%=mBean.getName()%>
										회원님의 정보를 수정합니다.
								</b></font></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><%=mBean.getId()%></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input name="pwd" value="<%=mBean.getPwd()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" value="<%=mBean.getName()%>"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>남<input type="radio" name="gender" value="남"
								<%=mBean.getGender().equals("남") ? "checked" : ""%>> 여<input
								type="radio" name="gender" value="여"
								<%=mBean.getGender().equals("여") ? "checked" : ""%>>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input name="email" size="30"
								value="<%=mBean.getEmail()%>"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input name="birthday" value="<%=mBean.getBirthday()%>"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input name="zipcode" value="<%=mBean.getZipcode()%>">
								<input type="button" value="우편번호찾기" onClick="zipCheck()">
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input name="address" size="50"
								value="<%=mBean.getAddress()%>"></td>
						</tr>
						<tr>
							<td>H.P</td>
							<td><input name="hp" size="50"
								value="<%=mBean.getHp()%>"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="수정완료"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<input type="reset" value="다시쓰기"></td>
						</tr>
						<input type="hidden" name="id" value="<%=id%>">
					</table>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="bottom.jsp"%>
</body>
</html>
