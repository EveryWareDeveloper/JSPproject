<!-- QnA게시판-->
<%@page import="gamestore.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="boardList" class="gamestore.BoardBean" />
<jsp:useBean id="mgr" class="gamestore.BoardMgr" />
<jsp:useBean id="cmgr" class="gamestore.BCommentMgr" />
<%
request.setCharacterEncoding("EUC-KR");
String session_id = (String) session.getAttribute("idKey");
String boardid = "2";
if (request.getParameter("boardid") != null) {
	boardid = request.getParameter("boardid");
}
int totalRecord = 0;
int numPerPage = 10;
int pagePerBlock = 15;
int totalPage = 0;
int totalBlock = 0;
int nowPage = 1;
int nowBlock = 1;

if (request.getParameter("numPerPage") != null) {
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
}

String keyField = "", keyWord = "";
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
	keyField = "";
	keyWord = "";
}

totalRecord = mgr.getTotalCount(keyField, keyWord, boardid);

if (request.getParameter("nowPage") != null) {
	nowPage = UtilMgr.parseInt(request, "nowPage");
}

int start = (nowPage * numPerPage) - numPerPage;
int cnt = numPerPage;

totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A Board</title>
<link href="css/set.css" rel="stylesheet">
<script>
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
	
	function list(){
		document.listFrm.action="boardQna.jsp?boardid=2";
		document.listFrm.submit();
	}
	
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
		document.boardFrm.boardid.value=boardid;
		document.boardFrm.submit();
	}
</script>
</head>
<body>
	<div class="board" align="center">
		<br>
		<h2>Q&A게시판</h2>
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
					</form> <script type="text/javascript">
   				document.npFrm.numPerPage.value="<%=numPerPage%>
						";
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
					<th>작성자</th>
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
						%> <a
						href="javascript:read('<%=num%>')"><%=subject%></a> <%
 if (filename != null && !filename.equals("")) {
 %>
						<img alt="파일첨부" src="img/icon_file.gif" align="middle"> <%
 }
 %>
						<%
						if (bcount > 0) {
						%> <font color="red">(<%=bcount%>)
					</font> <%
 }
 %>
					</td>
					<td><%=name%></td>
					<td><%=regdate%></td>
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
 %> <a
				href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 }
 %> <!-- 페이징 -->
				<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1;
				int pageEnd = (pageStart + pagePerBlock) < totalPage ? pageStart + pagePerBlock : totalPage + 1;
				for (; pageStart < pageEnd; pageStart++) {
				%> <a href="javascript:pageing('<%=pageStart%>')"> <%
 if (nowPage == pageStart) {
 %><font
					color="blue"> <%
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
		<form name="searchFrm" method="get" action="board.jsp?boardid=2">
			<table width="600" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom"><select name="keyField"
						size="1">
							<option value="name">이 름</option>
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
					</select> <input size="16" name="keyWord"> <input type="button"
						value="찾기" onClick="javascript:check()"> <input
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
		<form name="boardFrm" method="get">
			<input type="hidden" name="boardid">
		</form>
	</div>
</body>
</html>












