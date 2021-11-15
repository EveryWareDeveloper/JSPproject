<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="gamestore.ProductBean" %>
<%@page import="gamestore.UtilMgr"%>

<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
Vector<ProductBean> pvlist = pMgr.getProductList();

%>
<html>
<head>
<meta charset="UTF-8">
<meta charset="EUC-KR">
<title>game detail</title>
	<script type="text/javascript">
		function heart(num) {
			document.frm.action = "pBlogUpHCnt";
			document.frm.num.value=num;
			document.frm.submit();
		}
	</script>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="column-layout">
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="main-column">
			<jsp:include page="section.jsp"></jsp:include>
			<div class="tab">
			<%
					for(int i=0;i<pvlist.size();i++){
						ProductBean pbean = pvlist.get(i);
			%>
				<button class="tablinks" onclick="openCity(event, 'gameshow')" id="defaultOpen">게임정보</button>
				<button class="tablinks" onclick="openCity(event, 'gamesys')">시스템 요구사항</button>
				<button class="tablinks" onclick="openCity(event, 'review')">리뷰</button>
			</div>
				<div><a href="javascript:heart('<%=pbean.getPid()%>')">
					<img src="img/heart.jpg" align="top" onclick="history.go()">
				</a>좋아요 <%=pbean.getHcnt() %>개</div>
<%}%>
			<div id="gameshow" class="tabcontent">
				<p>재미있는 게임이 왔다</p>
			</div>

			<div id="gamesys" class="tabcontent">
				<p>똥컴만 아니면 다 돌아간다</p> 
			</div>

			<div id="review" class="tabcontent">
				<p>돈이 아깝지가 않다.</p>
			</div>
			
			<div class="footer-layout">
				<jsp:include page="bottom.jsp"/>
			</div>
		</div>
	</div>
</body>
</html>
<script>
function openCity(evt, cityName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>









