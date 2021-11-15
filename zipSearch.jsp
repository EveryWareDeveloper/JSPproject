<%@page import="gamestore.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="gamestore.MemberMgr"/>
<link href="css/set.css" rel="stylesheet" type="text/css">
<%
		/* db���� �ּҰ� �˻� �� �ҷ����� */
		request.setCharacterEncoding("EUC-KR");
		String search = request.getParameter("search");
		String area3 = null;
		Vector<ZipcodeBean> vlist = null;
		if(search.equals("y")){ //�˻� ��ư�� Ŭ����
			area3 = request.getParameter("area3");
			vlist = mgr.zipcodeRead(area3);
		}
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset=UTF-8>
<title>�����ȣ �˻�</title>
<script type="text/javascript">
	/* �˻����� �Է��� ������ */
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("���θ��� �Է��ϼ���.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	/* �ּ� �˻��� Ŭ���� ������ ���� �Է� */
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
					<br/>���θ� �Է� : 	<input name="area3">
						<input type="button" value="�˻�"  class="button"
						onclick="loadSearch()">
					</td>
				</tr>
				<!-- �˻��� �˻��� ���� ȭ�鿡 ��� -->
				<!-- �˻���� ���� -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty()){
				%>
				<tr>
					<td align="center" class="button"><br/>�˻��� ����� �����ϴ�.</td>
				</tr>
				<% 			
						}else{
				%>
				<tr>
					<td align="center" ><br/>
					�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
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
				<!-- �˻���� �� -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>