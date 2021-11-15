<!-- 커뮤니티게시판 -->
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
int totalRecord = 0;//총게시물
int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
int pagePerBlock = 15;//블럭당 페이지 개수
int totalPage = 0;//총 페이지 개수
int totalBlock = 0;//총 블럭 개수
int nowPage = 1;//현재 페이지
int nowBlock = 1;//현재 블럭

//요청된 numPerPage 처리
//요청이 있으면 처리가 되지만 요청이 없으면 기본값 10개로 세팅.
if (request.getParameter("numPerPage") != null) {
	//numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
}

//검색에 필요한 변수
String keyField = "", keyWord = "";
//검색일때
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

//검색 후에 다시 처음화면 요청
if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
	keyField = "";
	keyWord = "";
}

totalRecord = mgr.getTotalCount(keyField, keyWord, boardid);
//out.print("totalRecord : " + totalRecord);

//nowPage 요청
if (request.getParameter("nowPage") != null) {
	nowPage = UtilMgr.parseInt(request, "nowPage");
}

//sql문에 limit ?, ? 들어가는 start, cnt  
int start = (nowPage * numPerPage) - numPerPage;
int cnt = numPerPage;

//전체페이지 개수
totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
//전체블럭 개수
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
//현재블럭
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
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}

	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function list() {//검색을 통해서 url에 남은 get방식 조건값 초기화
		document.listFrm.action="board.jsp?boardid=1";
		document.listFrm.submit();
	}
	
	//board.jsp -> read.jsp 조건 : keyField, keyWord, nowPage, numPerPage
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
		<h2>고객게시판</h2>
		<br>
		<table class="table table-striped">
			<div class="item" align="left">
				<a href="javascript:board('1')">커뮤니티</a> <a
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
							<option value="5">5개 보기</option>
							<option value="10" selected>10개 보기</option>
							<option value="15">15개 보기</option>
							<option value="30">30개 보기</option>
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
				int listSize = vlist.size();//브라우저 화면에 표시될 번호
				if (vlist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				} else {
				%>
				<tr class="tr-striped">

					<th>번 호</th>
					<th>제 목</th>
					<th>I D</th>
					<th>날 짜</th>
					<th>조회수</th>
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
					//댓글 개수
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
						%> <img alt="파일첨부" src="img/icon_file.gif" align="middle"> <%
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
				%> <!-- 이전 블럭 --> <%
 if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 }
 %> <!-- 페이징 --> <%
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
 %> <!-- 다음 블럭 --> <%
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
		<a href="post.jsp">[글쓰기]</a> <a href="javascript:list()">[처음으로]</a> <a
			href="main.jsp">[홈으로]</a>
		<hr width="750">
		<!-- 검색 Form Start -->
		<form name="searchFrm" method="get" action="board.jsp?boardid=1">
			<table width="600" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom"><select name="keyField"
						size="1">
							<option value="name">이 름</option>
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
					</select> <input size="16" name="keyWord"> <input class="button2"
						type="button" value="찾기" onClick="javascript:check()"> <input
						type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
		</form>
		<!-- 검색 Form End -->
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
