<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr" />
<%
request.setCharacterEncoding("EUC-KR");
int pid = UtilMgr.parseInt(request, "pid");
ProductBean pbean = pMgr.getProduct(pid);
%>
<html>
<head>
<title>section</title>
<script src="script.js"></script>
<link href="css/section.css" rel="stylesheet" type="text/css">
</head>
<body>

	<h3>게임 제목</h3>
	<!-- Slideshow container -->
	<div class="slideshow-container">
		<!-- 이미지 -->
		<div class="mySlides fade">
			<img src="img/a1.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a2.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a3.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a4.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a5.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a6.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a7.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<img src="img/a8.jpg" style="width: 100%">
		</div>

		<!-- 이전 다음 버튼 -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>
	<!-- Thumbnail images -->
	<div class="row"
		style="white-space: nowrap; overflow: hidden; height: auto;">
		<div class="column">
			<img class="demo cursor" src="img/a1.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(1)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a2.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(2)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a3.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(3)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a4.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(4)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a5.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(5)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a6.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(6)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a7.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(7)" alt="game1">
		</div>

		<div class="column">
			<img class="demo cursor" src="img/a8.jpg" style="width: 100%"
				style="width:100px" onclick="currentSlide(8)" alt="game1">
		</div>

		<form name="cart" action="cartProc.jsp">
			<%=pbean.getName()%>
			<%=UtilMgr.intFormat(pbean.getPrice())%>
			<input name="quantity" size="5" value="1">
		</form>
		<tr align="right">

			<td width="15%;">
			<td><font color="#FFFFFF"><input type="submit"
					value="장바구니"> </font></td>

			<td><font color="#FFFFFF"><input type="button" value="구매"
					onclick="productDetail('')"></font></td>


		</tr>
	</div>
	<input type="hidden" name="pid" value="<%=pbean.getPid()%>">
	<input type="hidden" name="flag" value="insert">
	</form>
</body>
</html>
<script>
	var slideIndex = 1;
	var timer;
	window.onload = function() {
		showSlides();
	}

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides fade");
		var thumbs = document.getElementsByClassName("column");

		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		if (slideIndex < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < thumbs.length; i++) {
			thumbs[i].className = thumbs[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		thumbs[slideIndex - 1].className += " active";

		slideIndex++;//다음 레이어를 보여주기 위해 1 추가 
		timer = setTimeout(showSlides, 2000);
	}

	function plusSlides(n) {
		clearTimeout(timer);
		slideIndex = slideIndex + (n - 1);//showSlides() 함수에서 1을 추가 함으로 여기선 이런 식으로 처리해야 맞음
		showSlides();//인수 없이 호출
	}

	function currentSlide(n) {
		clearTimeout(timer);
		slideIndex = n;//함수 호출 전 선언
		showSlides();//인수 없이 호출
	}
</script>










