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
            <h3>���� ī�װ�</h3>
        <ul>
         <li><a href="typeList.jsp?type=action">�׼�</a></li>
                <li><a href="typeList.jsp?type=adv">��庥��</a></li>
                <li><a href="typeList.jsp?type=kid">Ű��</a></li>
                <li><a href="typeList.jsp?type=rol">���÷���</a></li>
                <li><a href="discount.jsp?discount!=0">���ΰ���</a></li>
        <h3>���Խ���</h3>
        <ul>
            <li><a href="boardQna.jsp?boardid=2">Q&A</a></li>
            <li><a href="board.jsp?boardid=1">board</a></li>
        </ul>
    
    </div>

    <div class="sidebar-two">
        <h3>����</h3>
        <img src="img/data3.jpg" style="width: 100%"/>
    </div>
    
           <!-- <form action="typeList.jsp?type=action" method="post" >
           �ѱ��Է� : <input type="button" name="action"><br>                                
           <input type="hidden" value="action">
     </form> -->


</body>
</html>