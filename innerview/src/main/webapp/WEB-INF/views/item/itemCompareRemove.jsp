<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 비교에 관련된 세션 전부 삭제 -->
    <%
    session.removeAttribute("list");
    session.removeAttribute("size2");
    session.removeAttribute("flag");
    %>
