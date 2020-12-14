<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 	<br>
	insert : ${insert}
	size2: <%= session.getAttribute("size2") %>
	<br> --%>
	<%
	/* 중복된 제품이 들어오지 못하게 하는 insert 조건  */
	boolean insert = (boolean)request.getAttribute("insert");
	/* 세션 list의 사이즈 조건 */
	int size = (int)session.getAttribute("size2");
	/* 세션에 추가가 가능한지 지정하는 flag */
	String flag = (String)session.getAttribute("flag");
	/* 세가지 조건이 성립할때 비교창 출력 */
	if (size <= 3 && flag == null && insert == true){
	%>
	<img alt="" src="../resources/img/${image}" width="200px" heigth="200px">
	<% 
	/* 3개가 넘었을때 문구 출력 */
	}else{
	%>
	3개 까지만 담을수 있습니다.
	<%
	}
	%>
