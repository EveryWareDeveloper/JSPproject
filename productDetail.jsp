<%@page import="gamestore.DCommentBean"%>
<%@page import="gamestore.MemberBean"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<jsp:useBean id="dMgr" class="gamestore.DCommentMgr"/>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int pid = UtilMgr.parseInt(request, "pid");
	ProductBean pbean = pMgr.getProduct(pid);
	//���
	String flag = request.getParameter("flag");
	if(flag!=null){
		if(flag.equals("insert")){
			//��� �Է� ��û
			DCommentBean dbean = new DCommentBean();
			MemberBean mbean = new MemberBean();
			dbean.setNum(pid);
			dbean.setName(request.getParameter("dName"));
			dbean.setComment(request.getParameter("comment"));
			dMgr.insertDComment(dbean);
			mbean.setName(request.getParameter("name"));
			//response.sendRedirect(request.getRequestURL()+"?"+request.getQueryString());
		}else if(flag.equals("delete")){
			//��� ���� ��û
			dMgr.deleteDComment(UtilMgr.parseInt(request, "dnum"));
		}
	}
	//�о�� �Խù��� �亯�� ����, ������ ���ؼ� session ����
	session.setAttribute("bean", pbean);
%>
<html>
<head>
<meta charset="UTF-8">
<meta charset="EUC-KR">
<title>game detail</title>
<script src="script.js"></script>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function dInsert() {
		if(document.cFrm.comment.value==""){
			alert("����� �Է��ϼ���.");
			document.cFrm.comment.focus();
			return;
		}
		document.cFrm.submit();
	}
	
	function dDel(dnum) {
		document.cFrm.dnum.value=dnum;
		document.cFrm.flag.value="delete";
		document.cFrm.submit();
	}
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="column-layout">
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="main-column">
			<h3>���� ����</h3>
			<!-- �����̵� �� �̹��� -->
			<div class="slideshow-container">
				<!-- �̹��� -->
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

				<!-- ���� ���� ��ư -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<!-- ����� �̹��� -->
			<div class="row" style="white-space:nowrap;overflow:hidden;height:auto;">
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
			</div>
			<!-- �ǹ�ư -->
			<div class="system-box">
			<form name="cart" action="cartProc.jsp">
			��ǰ�� : <%=pbean.getName() %><br>
			�帣 : <%=pbean.getType() %><br>
			�߸��� : <%=pbean.getRdate() %><br>
			���� : <%=UtilMgr.intFormat(pbean.getPrice())%> ��<br>                       
            </div>
            <input name="quantity" size="5" value="1">
                <tr align="right">
                    <td width="15%;">
                    <td><font color="#FFFFFF"><input class="button2" type="submit"
                            value="��ٱ���"> </font></td>
                </tr>

        <input type="hidden" name="pid" value="<%=pbean.getPid()%>">
        <input type="hidden" name="flag" value="insert">
        
        <div>
				<a href="javascript:heart('<%=pbean.getPid()%>')"><img
					src="img/heart.jpg" >
				</a>���ƿ�
				<%=pbean.getHcnt()%>��
			</div>
    </form>
			<tr>
			<td colspan="3">
			<!-- ��� �Է��� Start -->
			<form method="post" name="cFrm" action="productDetail.jsp">
				<table align="center">
					<tr>
						<td align="right">
						<input name="comment" size="50">
						<input class="button2" type="button" value="���" onclick="dInsert()"></td>
					</tr>
				</table>
			 <input type="hidden" name="flag" value="insert">	
			 <% String session_id = (String) session.getAttribute("idKey");
			 	String dName = mMgr.getMember(session_id).getName(); %>
			 <input type="hidden" name="dName" value="<%=dName%>">	
			 <input type="hidden" name="pid" value="<%=pid%>">
			 <input type="hidden" name="dnum">
			</form>
		
			</td>
			</tr>
			
		<!-- ��� �Է��� End -->
		<hr/>
		<!-- ��� List Start -->
		<%
  			Vector<DCommentBean> cvlist = dMgr.getDComment(pid);
			//Vector<MemberBean> nvlist = mMgr.getMemberList();
  			if(!cvlist.isEmpty()){
		%>
		<table>
		<%
  			for(int i=0;i<cvlist.size();i++){
  				DCommentBean cbean = cvlist.get(i);
  				int dnum = cbean.getDnum();
  				String comment = cbean.getComment();
  				String cregdate = cbean.getRegdate();
  				String nname = cbean.getName();
		%>
	  		<tr>
				<td colspan="3" width="600"><font color="#FFF"><b><%=nname%></b></font></td>
			</tr>
			<tr>
				<td style="color:white;">���:<%=comment%></td>
				<td align="right" style="color:white;"><%=cregdate%></td>
				<td align="center" valign="middle">
				<input type="button" value="����" onclick="dDel('<%=dnum%>')">
				</td>
			</tr>
			<tr>
				<td colspan="3"><br/></td>
			</tr>
		<%}//---for %>
		</table>
		<%}//--if%>
		<!-- ��� List End -->
			<div class="footer-layout">
				<jsp:include page="bottom.jsp"/>
			</div>
		</div>
	</div>
	<form method="post" name="frm">
		<input type="hidden" name="pid">
		<input type="hidden" name="comment">
		<input type="hidden" name="rnum">
		<input type="hidden" name="id">
	</form>
		<form method="post" name="frm1" action="productDetail.jsp">
		<input type="hidden" name="id">
	</form>
</body>
</html>
<script>
	//�̹��� �����̵�
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