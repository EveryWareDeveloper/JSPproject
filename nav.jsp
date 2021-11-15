<%@page import="gamestore.UtilMgr"%>
<%@page import="gamestore.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="gamestore.ProductMgr"/>
<html>
<head>
<title>nav</title>
<script src="script.js"></script>

<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

    <!-- second example -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    <div class="sidebar-one">
            <h3>게임 카테고리</h3>
        <ul>
         <li><a href="typeList.jsp?type=action">액션</a></li>
                <li><a href="typeList.jsp?type=adv">어드벤쳐</a></li>
                <li><a href="typeList.jsp?type=kid">키즈</a></li>
                <li><a href="typeList.jsp?type=rol">롤플레잉</a></li>
                <li><a href="discount.jsp?discount!=0">할인게임</a></li>
        <h3>고객게시판</h3>
        <ul>
            <li><a href="boardQna.jsp?boardid=2">Q&A</a></li>
            <li><a href="board.jsp?boardid=1">board</a></li>
        </ul>
    
    </div>

    <div class="sidebar-two">
        <h3>광고</h3>
        <img src="img/data3.jpg" style="width: 100%"/>
    </div>
    
           <!-- <form action="typeList.jsp?type=action" method="post" >
           한글입력 : <input type="button" name="action"><br>                                
           <input type="hidden" value="action">
     </form> -->


</body>
</html>