<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="gamestore.MemberMgr" />
<jsp:useBean id="mBean" class="gamestore.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%boolean flag = mMgr.updateMember(mBean);
if(flag){%>
	<script>
		alert("���������� �����Ͽ����ϴ�");
		window.close();
	</script>
<%}else{%>
	<script>
		alert("�������� ������ �߻��Ͽ����ϴ�.");
		history.back();
		window.close();
	</script>
<%}%>


