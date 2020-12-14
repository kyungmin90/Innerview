<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 유저 아이디 세션 지우고 home.jsp로 이동 -->
<%
String uID = (String)session.getAttribute("uID");
session.removeAttribute("uID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 중 입니다.</title>
<meta http-equiv="refresh" content="0.1; url=../home.jsp">
</head>
<body>

</body>
</html>