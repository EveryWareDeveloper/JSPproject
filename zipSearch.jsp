<%@page import="gamestore.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="gamestore.MemberMgr"/>
<link href="css/set.css" rel="stylesheet" type="text/css">
<%
		/* db에서 주소값 검색 및 불러오기 */
		request.setCharacterEncoding("EUC-KR");
		String search = request.getParameter("search");
		String area3 = null;
		Vector<ZipcodeBean> vlist = null;
		if(search.equals("y")){ //검색 버튼을 클릭시
			area3 = request.getParameter("area3");
			vlist = mgr.zipcodeRead(area3);
		}
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset=UTF-8>
<title>우편번호 검색</title>
<script type="text/javascript">
	/* 검색란에 입력이 없을시 */
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("도로명을 입력하세요.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	/* 주소 검색후 클릭시 지정된 곳에 입력 */
	function sendAdd(zipcode, adds) {
		opener.document.regForm.zipcode.value = zipcode;
		opener.document.regForm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#141e30">
	<div align="center">
		<br/>
		<form name="zipFrm" method="post">
			<table class="button0">
				<tr>
					<td>
					<br/>도로명 입력 : 	<input name="area3">
						<input type="button" value="검색"  class="button"
						onclick="loadSearch()">
					</td>
				</tr>
				<!-- 검색후 검색된 값을 화면에 출력 -->
				<!-- 검색결과 시작 -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty()){
				%>
				<tr>
					<td align="center" class="button"><br/>검색된 결과가 없습니다.</td>
				</tr>
				<% 			
						}else{
				%>
				<tr>
					<td align="center" ><br/>
					※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
						for(int i=0;i<vlist.size();i++){
							ZipcodeBean bean = vlist.get(i);
							String rZipcode = bean.getZipcode();
							String rArea1 = bean.getArea1();
							String rArea2 = bean.getArea2();
							String rArea3 = bean.getArea3();
							String adds = rArea1 +" " + rArea2 +" " + rArea3+" ";						
				%>
				<tr>
					<td>
					<a href="#" onclick="javascript:sendAdd('<%=rZipcode%>','<%=adds%>')" class="button1">
					<%=rZipcode+" " + adds%></a></td>
				</tr>
				<%			}//---for
							}//---if2
						}//---if1	
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>