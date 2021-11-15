<!-- Ŀ�´�Ƽ�Խ��� -->
<%@page import="gamestore.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="boardList" class="gamestore.BoardBean" />
<jsp:useBean id="mgr" class="gamestore.BoardMgr" />
<jsp:useBean id="cmgr" class="gamestore.BCommentMgr" />
<%
request.setCharacterEncoding("EUC-KR");
String boardid = "1";
if (request.getParameter("boardid") != null) {
	boardid = request.getParameter("boardid");
}
int totalRecord = 0;//�ѰԽù�
int numPerPage = 10;//�������� ���ڵ� ����(5,10,15,30)
int pagePerBlock = 15;//���� ������ ����
int totalPage = 0;//�� ������ ����
int totalBlock = 0;//�� �� ����
int nowPage = 1;//���� ������
int nowBlock = 1;//���� ��

//��û�� numPerPage ó��
//��û�� ������ ó���� ������ ��û�� ������ �⺻�� 10���� ����.
if (request.getParameter("numPerPage") != null) {
	//numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
}

//�˻��� �ʿ��� ����
String keyField = "", keyWord = "";
//�˻��϶�
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

//�˻� �Ŀ� �ٽ� ó��ȭ�� ��û
if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
	keyField = "";
	keyWord = "";
}

totalRecord = mgr.getTotalCount(keyField, keyWord, boardid);
//out.print("totalRecord : " + totalRecord);

//nowPage ��û
if (request.getParameter("nowPage") != null) {
	nowPage = UtilMgr.parseInt(request, "nowPage");
}

//sql���� limit ?, ? ���� start, cnt  
int start = (nowPage * numPerPage) - numPerPage;
int cnt = numPerPage;

//��ü������ ����
totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
//��ü�� ����
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
//�����
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
<title>Community Board</title>
<link href="css/set.css" rel="stylesheet">
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}

	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function list() {//�˻��� ���ؼ� url�� ���� get��� ���ǰ� �ʱ�ȭ
		document.listFrm.action="board.jsp?boardid=1";
		document.listFrm.submit();
	}
	
	//board.jsp -> read.jsp ���� : keyField, keyWord, nowPage, numPerPage
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}

	function board(boardid){
		document.board.boardid.value=boardid;
		document.board.submit();
	}
</script>
</head>
<body>
	<div class="board" align="center">
		<br>
		<h2>���Խ���</h2>
		<br>
		<table class="table table-striped">
			<div class="item" align="left">
				<a href="javascript:board('1')">Ŀ�´�Ƽ</a> <a
					href="javascript:board('2')">QnA</a>
			</div>
			<tr>
				<td width="680"><b>Total : <%=totalRecord%>Articles( <font
						color="red"><%=nowPage%>/<%=totalPage%></font>)
				</b></td>
				<td align="right">
					<form name="npFrm" method="post">
						<select name="numPerPage" size="1"
							onchange="numPerFn(this.form.numPerPage.value)">
							<option value="5">5�� ����</option>
							<option value="10" selected>10�� ����</option>
							<option value="15">15�� ����</option>
							<option value="30">30�� ����</option>
						</select>
					</form> <script type="text/javascript">document.npFrm.numPerPage.value="<%=numPerPage%>";
					</script>
				</td>
			</tr>
		</table>
		<hr width="750">
		<table class="table table-hover" width="800px">
			<thead>
				<%
				Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt, boardid);
				int listSize = vlist.size();//������ ȭ�鿡 ǥ�õ� ��ȣ
				if (vlist.isEmpty()) {
					out.println("��ϵ� �Խù��� �����ϴ�.");
				} else {
				%>
				<tr class="tr-striped">

					<th>�� ȣ</th>
					<th>�� ��</th>
					<th>I D</th>
					<th>�� ¥</th>
					<th>��ȸ��</th>
				</tr>

				<%
				for (int i = 0; i < numPerPage; i++) {
					if (i == listSize)
						break;
					BoardBean bean = vlist.get(i);
					int num = bean.getNum();
					String subject = bean.getSubject();
					String name = bean.getName();
					String regdate = bean.getRegdate();
					int depth = bean.getDepth();
					int count = bean.getCount();
					String filename = bean.getFilename();
					//��� ����
					int bcount = cmgr.getBCommentCount(num);
				%>
			</thead>
			<tbody>
				<tr align="center">
					<td><%=totalRecord - start - i%></td>
					<td align="left">
						<%
						for (int j = 0; j < depth; j++) {
						%>&nbsp;&nbsp;<%
						} //---for
						%> <a class="button2" href="javascript:read('<%=num%>')"><%=subject%></a>
						<%
						if (filename != null && !filename.equals("")) {
						%> <img alt="����÷��" src="img/icon_file.gif" align="middle"> <%
 }
 %> <%
 if (bcount > 0) {
 %> <font color="red">(<%=bcount%>)
					</font> <%
 }
 %>
					</td>
					<td><%=name%></td>
					<td width="120"><%=regdate%></td>
					<td><%=count%></td>

					<%
					} //--for
					%>

					<%
					} //--if-else
					%>
				</tr>
			</tbody>
		</table>
		<hr width="750">
		<tr>
			<td>
				<%
				if (totalRecord > 0) {
				%> <!-- ���� �� --> <%
 if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 }
 %> <!-- ����¡ --> <%
 int pageStart = (nowBlock - 1) * pagePerBlock + 1;
 int pageEnd = (pageStart + pagePerBlock) < totalPage ? pageStart + pagePerBlock : totalPage + 1;
 for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 if (nowPage == pageStart) {
 %><font color="blue"> <%
 }
 %> [<%=pageStart%>] <%
 if (nowPage == pageStart) {
 %>
				</font> <%
 }
 %>
			</a> <%
 } //--for
 %> <!-- ���� �� --> <%
 if (nowBlock < totalBlock) {
 %> <a
				href="javascript:block('<%=nowBlock + 1%>')">..next</a> <%
 }
 %> <%
 } //---if1
 %>
			</td>
		</tr>
		<hr width="750">
		<a href="post.jsp">[�۾���]</a> <a href="javascript:list()">[ó������]</a> <a
			href="main.jsp">[Ȩ����]</a>
		<hr width="750">
		<!-- �˻� Form Start -->
		<form name="searchFrm" method="get" action="board.jsp?boardid=1">
			<table width="600" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom"><select name="keyField"
						size="1">
							<option value="name">�� ��</option>
							<option value="subject">�� ��</option>
							<option value="content">�� ��</option>
					</select> <input size="16" name="keyWord"> <input class="button2"
						type="button" value="ã��" onClick="javascript:check()"> <input
						type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
		</form>
		<!-- �˻� Form End -->
		<form name="readFrm">
			<input type="hidden" name="keyField" value="<%=keyField%>"> <input
				type="hidden" name="keyWord" value="<%=keyWord%>"> <input
				type="hidden" name="nowPage" value="<%=nowPage%>"> <input
				type="hidden" name="numPerPage" value="<%=numPerPage%>"> <input
				type="hidden" name="num">
		</form>

		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>
		<form name="board" method="get">
			<input type="hidden" name="boardid">
		</form>
	</div>
</body>
</html>
