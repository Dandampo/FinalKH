<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
html,body{width:100%;height:100%;}
body,div,dl,dt,dd,ul,li,ol,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td,table{margin:0;padding:0;}
table{border-collapse:collapse;}
img,fieldset{border:none;}
address,caption,cite,code,em,strong,th{font-style:normal;font-weight:normal;}
ol,ul{list-style:none;}
caption,th{text-align:left;}
h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
q:after,q:before{content:"";}/* �ο�ǥ�� ���ֱ� */
abbr,acronym{border:none;}
img,li,input{vertical-align:middle;}/*��Ƽ�� ����� �⺻���� ����.*/
hr{display:none;}
#skipNavi,.hidden{position:absolute;left:0;top:0;width:0;height:0;font-size:0;line-height:0;text-indent:-9999px;overflow:hidden;visibility:hidden;}




#section{padding-top:250px;padding-left:800px;}
table{align:center;width:400px;height:500px;}
td{font-size:20px; }
tr{margin-top:10px;}
h2{font-size:50px;}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../include/header.jsp" />
		<div id="section">
			<h2>���� ����</h2>
			<form action="#" method="post" name="frm">
				<table>
				
					<tr>
						<td>�̸�</td>
						<td><input type="text" name="name" size="20">*</td>
					</tr>
					<tr>
						<td>���̵�</td>
						<td><input type="text" name="userid" size="20" id="userid">
					</tr>
					<tr>
						<td>�� ȣ</td>
						<td><input type="password" name="pwd" size="20"></td>
					</tr>
					<tr>
						<td width="80">��ȣ Ȯ��</td>
						<td><input type="password" name="pwd_check" size="20"></td>
					</tr>
					<tr>
						<td>�̸���</td>
						<td><input type="text" name="email" size="20"></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><input type="text" name="phone" size="20"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="Ȯ��" onclick="return joinCheck()">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="���">
						</td>
					</tr>
				</table></form>
			
		</div>
		<!-- section -->
		<%-- <jsp:include page="../include/footerMain.jsp" /> --%>
	</div>
	<!-- wrap -->
</body>
</html>