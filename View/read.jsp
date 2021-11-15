<!-- read.jsp -->
<%@page import="java.util.Vector"%>
<%@page import="gamestore.BCommentBean"%>
<%@page import="gamestore.BoardBean"%>
<%@page import="gamestore.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="gamestore.BoardMgr"/>
<jsp:useBean id="cmgr" class="gamestore.BCommentMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String boardid ="1";
		if(request.getParameter("boardid")!=null){
		boardid = request.getParameter("boardid");
		}	
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		//nowPage ���������� ���⼭�� ����� �Ǵ� ���� �ƴϰ� 
		//�״�� list.jsp�� �ѱ�� ���̱� ������ ������ ��ȯ �ȵȴ�.
		String nowPage = request.getParameter("nowPage");
		String numPerPage = request.getParameter("numPerPage");
		int num = UtilMgr.parseInt(request, "num");		
		String flag = request.getParameter("flag");
		if(flag!=null){
			if(flag.equals("insert")){
				//��� �Է� ��û
				BCommentBean cbean = new BCommentBean();
				cbean.setNum(num);
				cbean.setName(request.getParameter("cName"));
				cbean.setComment(request.getParameter("comment"));
				cmgr.insertBComment(cbean);
				response.sendRedirect(request.getRequestURL()+"?"+request.getQueryString());
			}else if(flag.equals("delete")){
				//��� ���� ��û
				cmgr.deleteBComment(UtilMgr.parseInt(request, "cnum"));
			}
		}else {
			//��ȸ������
			mgr.upCount(num);
		}
		BoardBean bean = mgr.getBoard(num);
		String name = bean.getName();
		String subject = bean.getSubject();
		String regdate = bean.getRegdate();
		String content = bean.getContent();
		String filename = bean.getFilename();
		int filesize = bean.getFilesize();
		String ip = bean.getIp();
		int count = bean.getCount();
		
		//�о�� �Խù��� �亯�� ����, ������ ���ؼ� session ����
		session.setAttribute("bean", bean);
%>
<!DOCTYPE html>
<html>
<head>
<title>JSP Board</title>
<style>
td{
	color="#000000";
}
</style>
<link href="css/set.css" rel="stylesheet">
<script type="text/javascript">
	function down(filename) {
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
	function list(boardid) {
		document.listFrm.action = "board.jsp";
		document.listFrm.submit();
	}
	function cInsert() {
		if(document.cFrm.comment.value==""){
			alert("����� �Է��ϼ���.");
			document.cFrm.comment.focus();
			return;
		}
		document.cFrm.submit();
	}
	function cDel(cnum) {
		document.cFrm.cnum.value=cnum;
		document.cFrm.flag.value="delete";
		document.cFrm.submit();
	}
	
	function board(boardid){
		document.board.boardid.value=boardid;
		document.board.submit();
	}
</script>
</head>
<body>
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">���б�</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%" border=1> 
    <tr> 
  <td align="center"  width="20%"> �� �� </td>
  <td ><%=name%></td>
  <td align="center"  width="20%"> ��ϳ�¥ </td>
  <td><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" > �� ��</td>
    <td colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" >÷������</td>
     <td colspan="3">
    	<%if(filename!=null&&!filename.equals("")){%>
    	 <a href="javascript:down('<%=filename%>')"><%=filename%></a>
    	 <font color="blue">(<%=UtilMgr.intFormat(filesize)%>bytes)</font>
    	 <%}else{ %>
    	 	÷�ε� ������ �����ϴ�.
    	 <%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>�� ���� ���� ����̽��ϴ�./ ��ȸ�� <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2">
  <!-- ��� �Է��� Start -->
  <form method="post" name="cFrm">
		<table>
			<tr  align="center">
				<td width="50">�� ��</td>
				<td align="left">
					<input name="cName" size="10" value="">
				</td>
			</tr>
			<tr align="center">
				<td>�� ��</td>
				<td>
				<input name="comment" size="50"> 
				<input class="button2" type="button" value="���" onclick="cInsert()"></td>
			</tr>
		</table>
	 <input type="hidden" name="flag" value="insert">	
	 <input type="hidden" name="num" value="<%=num%>">
	 <input type="hidden" name="cnum">
    <input type="hidden" name="nowPage" value="<%=nowPage%>">
    <input type="hidden" name="numPerPage" value="<%=numPerPage%>">
   <%if(!(keyWord==null||keyWord.equals(""))){ %>
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
	</form>
  <!-- ��� �Է��� End -->
 <hr/>
 <!-- ��� List Start -->
  <%
  			Vector<BCommentBean> cvlist = cmgr.getBComment(num);
  			if(!cvlist.isEmpty()){
  %>
  <table>
  	<%
  			for(int i=0;i<cvlist.size();i++){
  				BCommentBean cbean = cvlist.get(i);
  				int cnum = cbean.getCnum();
  				String cname = cbean.getName();
  				String comment = cbean.getComment();
  				String cregdate = cbean.getRegdate();
  	%>
  		<tr>
			<td colspan="3" width="600"><b><%=cname%></b></td>
		</tr>
		<tr>
			<td>���:<%=comment%></td>
			<td align="right"><%=cregdate%></td>
			<td align="center" valign="middle">
			<input class="button2" type="button" value="����" onclick="cDel('<%=cnum%>')">
			</td>
		</tr>
		<tr>
			<td colspan="3"><br/></td>
		</tr>
 	<%}//--for%>
  </table>
  <%}//--if%>
 <!-- ��� List End -->
 [ <a href="javascript:list()" >����Ʈ</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>" >�� ��</a> |
 <a href="update2.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>" >�� ��2</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>&numPerPage=<%=numPerPage%>" >�� ��</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br/>
  </td>
 </tr>
</table>
<form method="post" name="downFrm" action="download.jsp">
	<input type="hidden" name="filename">
</form>

<form name="listFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){%>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="boardid">
	<%}%>
</form>
</body>
</html>






















