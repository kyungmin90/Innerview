<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
int iCode = Integer.parseInt(request.getParameter("iCode1"));
ArrayList<Integer> choilist = (ArrayList) session.getAttribute("choilist");


//ArrayList가 비어있으면 생성, 세션 set
if (choilist == null) {
	choilist = new ArrayList<Integer>();
	session.setAttribute("choilist", choilist);
}

//List 5개 미만이면 add
if(choilist.size() < 5){
//List에 값 저장시 같은 값이 있으면 remove 후 add
	if(choilist.contains(iCode)){
		choilist.remove((Integer)iCode);
	}
	choilist.add(iCode);

//List 5개 이상이면,
}else if(choilist.size() >= 5){
//List에 값 저장시 같은 값이 있으면 remove 후 제일 끝으로 add	
	if(choilist.contains(iCode)){
		choilist.remove((Integer)iCode);
		choilist.add(iCode);
	}else{
//같은 값이 없으면 제일 앞자리 remove 후 add
	choilist.remove(0);
	choilist.add(iCode);
	}
}




System.out.println(iCode + "  추가됨");
System.out.println("리스트사이즈: " + choilist.size());
System.out.println("리스트안에 뭐있냐: " + choilist);
%>