<%@ page contentType="text/html; charset=EUC-KR"%>
<% 
		request.setCharacterEncoding("EUC-KR");

%>
<html>
<head>
<title></title>
<link href="css/set.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function id_search() { 
 	var frm = document.idfindscreen;
	/* �ƹ��͵� �Է��� �ȵ��� ���� */
 	if (frm.name.value.length < 1) {
	  alert("�̸��� �Է����ּ���");
	  return;
	 }
	/* �ڵ�����ȣ�� 13�ڸ��� �ƴ϶�� Ȯ��â */
	 if (frm.hp.value.length != 11) {
		  alert("�ڵ�����ȣ�� ��Ȯ�ϰ� �Է����ּ���");
		  return;
	 }
	/* findIdResult.jsp�� �Ѿ���� action */
 frm.method = "post";
 frm.action = "findIdResult.jsp"; //�Ѿȭ��
 frm.submit();  
 }
</script>
</head>
<body marginheight="100px">
	<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>�޴��� ����Ȯ��</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>�̸�</label>
				<input type="text" name="name" class = "btn-name" placeholder = "����� �̸�">
			<br>
			</div>
			<div class = "find-phone">
				<label>��ȣ</label>
				<input type="text"  name="hp" class = "btn-phone" placeholder = "�޴�����ȣ�� '-'���� �Է�">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input class="button" type="button" name="enter" value="ã��"  onClick="id_search()">
		<input class="button" type="button" name="cancle" value="���" onClick="window.close()">
 	</div>
 </form>
</body>
</html>