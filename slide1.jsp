<%@page contentType="text/html; charset=EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<title>section</title>
<link href="css/slide.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>���� ���� ǰ��</h2>
	<!-- �̹��� �����̵� �� -->
	<div class="slideshow-container">
	
		<!-- Full-width images with number and caption text -->
		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="img/data1.jpg" height="100%" width="100%">
		</div>
		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="img/data2.jpg" height="100%" width="100%">
		</div>
		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="img/data10.jpg"  height="100%" width="100%">
		</div>
		<!-- ������ �������� ���� ��ư -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>
	<!-- The dots/circles -->
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>

	<script>
		var slideIndex = 1;
		var timer;
		window.onload = function() {
			showSlides();
		}

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides fade");
			var dots = document.getElementsByClassName("dot");

			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			if (slideIndex < 1) {
				slideIndex = slides.length
			}

			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";

			slideIndex++;//���� ���̾ �����ֱ� ���� 1 �߰� 
			timer = setTimeout(showSlides, 2000);
		}

		function plusSlides(n) {
			clearTimeout(timer);
			slideIndex = slideIndex + (n - 1);//showSlides() �Լ����� 1�� �߰� ������ ���⼱ �̷� ������ ó���ؾ� ����
			showSlides();//�μ� ���� ȣ��
		}

		function currentSlide(n) {
			clearTimeout(timer);
			slideIndex = n;//�Լ� ȣ�� �� ����
			showSlides();//�μ� ���� ȣ��
		}
	</script>
</body>
</html>












