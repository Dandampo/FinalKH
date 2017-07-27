<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<%@ include file="../main.jsp" %>
</head>
<body>
    <h2>회원 목록</h2>
    <table border="1" style="width:700px">
        <tr>
            <th>이메일</th>
            <th>아이디</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${row.email}</td>
            <td>${row.userid}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>