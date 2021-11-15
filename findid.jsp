<%@ page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");

%>
<html>
<head>
<title></title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function id_search() { 
 	var frm = document.idfindscreen;
	/* 아무것도 입력이 안됐을 경우는 */
 	if (frm.name.value.length < 1) {
	  alert("이름을 입력해주세요");
	  return;
	 }
	/* 핸드폰번호가 13자리가 아니라면 확인창 */
	 if (frm.hp.value.length != 11) {
		  alert("핸드폰번호를 정확하게 입력해주세요");
		  return;
	 }
	/* findIdResult.jsp로 넘어가도록 action */
 frm.method = "post";
 frm.action = "findIdResult.jsp"; //넘어간화면
 frm.submit();  
 }
</script>
</head>
<body marginheight="100px">
	<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="name" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text"  name="hp" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input class="button" type="button" name="enter" value="찾기"  onClick="id_search()">
		<input class="button" type="button" name="cancle" value="취소" onClick="window.close()">
 	</div>
 </form>
</body>
</html>