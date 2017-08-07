<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.plot.PiePlot"%>
<%@ page import="org.jfree.chart.ChartRenderingInfo"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%@ page import="org.jfree.data.general.PieDataset"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>
<script src='fullcalendar/fullcalendar.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

h1, h2, h4, h5, h6 {
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
/* main.css */
/* common */
body {
	font-size: 12px;
}

#wrap {
	width: 1400px;
	margin: 0 auto;
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

h3 {
	font-size: 40px;
}

#article1 {
	width: 410px;
	height: 500px;
	margin: 70px;
	float: left;
    margin-right: 200px;
	
}

#article2 {
	width: 410px;
	height: 500px;
	margin: 70px;
	float: left;
	padding-right:0px;
}
#calendar{
   width:500px;
   height:500px;
   }
#article2:after {
	content: "";
	display: block;
	clear: both;
}

#article3 {
	width: 410px;
	height: 600px;
	margin: 70px;
	float: left;
    margin-right: 200px;
}

#article4 {
	width: 410px;
	height: 600px;
	margin: 70px;
	float: left;
}

#article4:after {
	content: "";
	display: block;
	clear: both;
}

.map {
	width: 400px;
	height: 400px;
}

.schedule {
	width: 1154px;
	height: 368px
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../include/header.jsp" />

		<div id="section">
			<div id="article1">
				<table class="table1">
					<tr>
						<th><h3>여행루트</h3></th>
					</tr>
					<tr>
						<td><img class="map" src="../images/mypage/map.PNG" alt="루트맵" /></td>
					</tr>
					<tr>
						<td><input type="button" value="자세히" onclick="#"
							style="width: 400px" /></td>
					</tr>
					<tr>
						<td>여기서 내가 짠 루트를 쪼그마나게 보여주고 자세히 누르면 크게 볼 수있듬</td>
					</tr>
				</table>
			</div>
			<!-- article1 -->
			<div id="article2" style="border-left: 1px dotted black;  padding-left:200px;">
				<table class="table2">
					<tr>
						<th><h3>여행일정</h3></th>
					</tr>
					<tr>
						<td><div id="calendar"></div>
		<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              defaultDate : "2016-05-12"
            , editable : true
            , eventLimit : true
            , events: [
                {
                      title : "All Day Event"
                    , start : "2016-05-01"
                },
                {
                      title : "Long Event"
                    , start : "2016-05-07"
                    , end : "2016-05-10"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-09T16:00:00"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-16T16:00:00"
                },
                {
                      title : "Conference"
                    , start : "2016-05-11"
                    , end : "2016-05-13"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T10:30:00"
                    , end : "2016-05-12T12:30:00"
                },
                {
                      title : "Lunch"
                    , start : "2016-05-12T12:00:00"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T14:30:00"
                },
                {
                      title : "Happy Hour"
                    , start : "2016-05-12T17:30:00"
                },
                {
                      title : "Dinner"
                    , start : "2016-05-12T20:00:00"
                },
                {
                      title : "Birthday Party"
                    , start : "2016-05-13T07:00:00"
                },
                {
                      title : "Click for Google"
                    , url : "http://google.com/"
                    , start : "2016-05-28"
                }
            ]
        });
    });
</script></td>
					</tr>
					<!-- <tr>
						<td><input type="button" value="일기쓰기"></td>
					</tr> -->
				</table>
			</div>
			<!-- article2 -->
			<div id="article3">
				<table class="table3">
					<tr>
						<th><h3>예약정보</h3></th>
					</tr>
					<tr>
						<td>
						  <div id="donutchart" style="width:400px; height: 400px;"></div>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Item', 'cost'],
          ['항공권:85만원', 85],
          ['교통:15만원',    15],
          ['숙소:30만원',  30],
	  ['식비:8.4만원',8.4],
          ['투어/티켓:10만원', 10]
        ]);

        var options = {
          title: '예상비용(1인기준) : 148.4만원',
          pieHole: 0.4,
	colors: ['#00A0B0', '#6A4A3C', '#CC333F', '#EB6841', '#EDC951']

        };


        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>

						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>항공권(기차,버스)</td>
						<td><input type="button" value="입력"></td>
						<td>300,000원</td>
					</tr>
					<tr>
						<td>숙소</td>
						<td><input type="button" value="입력"></td>
						<td>150,000원</td>
					</tr>
					<tr>
						<td>티켓,투어</td>
						<td><input type="button" value="입력"></td>
						<td>30,000원</td>
					</tr>
					<tr>
						<td>총 예약비</td>
						<td><input type="button" value="입력"></td>
						<td>480,000원</td>
					</tr>
				</table>
			</div>
			<!-- article3 -->
			<div id="article4" style="border-left: 1px dotted black;  padding-left:300px;">
				<table class="table4">
					<tr>
						<th><h3>앨범</h3></th>
					</tr>
					<tr>
						<td><img class="map" src="../images/mypage/album.PNG" alt="표" /></td>
					</tr>
					<tr>
						<td><input type="button" value="사진 추가하기"></td>
					</tr>
				</table>
			</div>
			<!-- article4 -->
			<div id="article5">
				<table class="table5">
					<tr>
						<th><h3>스케쥴</h3></th>
					</tr>
					<tr>
						<td><img class="schedule" src="../images/mypage/shedule.PNG" alt="스케쥴" /></td>
					</tr>
				</table>
			</div>
			<!-- article5 -->
		</div>
		<!-- section -->
		<%-- <jsp:include page="../include/footerMain.jsp" /> --%>
	</div>
	<!-- wrap -->
</body>
</html>