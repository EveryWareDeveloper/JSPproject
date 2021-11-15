<%@ page contentType="text/html; charset=EUC-KR" %>
<% 
		request.setCharacterEncoding("EUC-KR");
		String session_id = (String) session.getAttribute("idKey");
		String boardid ="1";
		if(request.getParameter("boardid")!="1"){
			boardid = request.getParameter("boardid");
		}
%>
<!-- HTML5 선언 -->
<!DOCTYPE html>
<html>
<head>
<title>JSP Board</title>
<link href="css/set.css" rel="stylesheet">
<script src="script.js" type="text/javascript"></script>
</head>
<body>
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">글쓰기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="gamestorePost" 
enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">작성자</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8" value="<%=session_id %>"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass" size="15" maxlength="15" value="1234"></td>
			</tr>
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>내용타입</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
 			<tr>
 				<td>BoardId</td>
 				<td> 커뮤니티<input type=radio name="boardid" value="1" checked>&nbsp;&nbsp;&nbsp;
  			 	QnA<input type=radio name="boardid" value="2" >
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='board.jsp?boardid=1'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
<form name="qna" method="get">
	<input type="hidden" name="boardid" value="1">
</form>
</div>
</body>
</html>