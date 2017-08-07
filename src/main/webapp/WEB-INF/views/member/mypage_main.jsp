<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/headerTravel.jsp" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
}

body, div, dl, dt, dd, ul, li, ol, h1, h2, h3, h4, h5, h6, pre, form,
	fieldset, input, textarea, p, blockquote, th, td, table {
	margin: 0;
	padding: 0;
}

img, fieldset {
	border: none;
}

address, caption, cite, code, em, strong, th {
	font-style: normal;
	font-weight: normal;
}

ol, ul {
	list-style: none;
}

caption, th {
	text-align: left;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: normal;
	font-size: 100%
}

q:after, q:before {
	content: ""
}

abbr, acronym {
	border: none;
}

img, li {
	vertical-align: middle;
}

hr {
	display: none;
}

#skipnavi, .blind {
	position: absolute;
	left: 0;
	top: 0;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	overflow: hidden;
	visibility: hidden;
}

body {
	font-size: 12px;
}

a {
	text-decoration: none;
	color: #666;
}

a:hover {
	text-decoration: underline;
	color: #000;
}

strong, th {
	font-weight: bold;
}

#wrap {
	width: 1400px;
	margin: 0 auto;
}

#article1 {
	width: 270px;
	height: 300px;
	border: 1px solid black;
	float: left;
	margin: 60px;
}

#article2 {
	width: 70%;
	height: 500px;
	border: 1px solid grey;
	float: left;
	margin-bottom: 0px;
	background-color:rgb(218,218,218);
}

.table {
	width: 200px;
	height: 400px;
	border: 1px solid black;
	float: left;
	margin: 50px;
	padding-top: 20px;
	padding-bottom: 50px;
}
#section{padding-top:250px;}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../include/header.jsp"></jsp:include>

	

		<div id="section">

			<div id="article1">
				<table>
					<tr>
						<td><img src="../images/mypage/profile.PNG" alt="프로필사진"
							 /></td>
					</tr>
					<tr>
						<td><input type="button" value="프로필 수정"
							onclick="location.href='mypageUpdatemember.do'"
							style="width: 270px" /></td>
					</tr>
				</table>
				<table border=1 width="270px">
					<tr>
						<td align="center">maryy1016</td>
					</tr>
					<tr>
						<td align="center">이다은</td>
					</tr>
				</table>

			</div>
			<!-- article1 -->
			<form action="mypageJourney.do">
				<div id="article2">
					<table class="table">
						<tr>
							<td><img src="../images/mypage/map.PNG" alt="지도" width=200px /></td>
						</tr>
						<tr>
							<td><a href="#" name="journey_name" width=200px>방콕으로!(여행이름)</a></td>
						</tr>
						<tr>
							<td><input type="submit" value="플래너 보기" onclick="#"
								style="width: 200px" /></td>
						</tr>
					</table>

					<table class=table>
						<tr>
							<td><img src="../images/mypage/map.PNG" alt="지도" width=200px /></td>
						</tr>
						<tr>
							<td><a href="#" name="journey_name" width=200px>유럽으로!</a></td>
						</tr>
						<tr>
							<td><input type="button" value="플래너 보기"
								onclick="location.href='mypageJourney.do'" style="width: 200px" /></td>
						</tr>
					</table>

					<table class="table">
						<tr>
							<td><img src="../images/mypage/new.PNG" alt="여행추가" width=200px /></td>
						</tr>
					</table>
				</div>
				<!-- article2 -->
			</form>
		</div>
		<!-- section -->

		<%-- <jsp:include page="../include/footerMain.jsp" /> --%>
	</div>
	<!-- wrap -->

</body>
</html>