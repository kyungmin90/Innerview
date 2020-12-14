<%@page import="com.innerview.mvc00.item.ItemCompareVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
	
<c:forEach var="vo" items="${complist}">
<div class="modal-header">
	<!-- header title -->
	<h4 class="modal-title">제품 비교</h4>
</div>
<!-- body -->
<div class="modal-body" style="display: inline-block;">

<div class="item" id="${vo.iCode}">
<hr>
제품번호 : ${vo.iCode}
제품이름 : ${vo.iTitle}
제품가격 : ${vo.iPrice}
제조회사 : ${vo.iManufac}
<br>
제품분야 : ${vo.iField1}
제품분야 : ${vo.iField1}
제품성분 : ${vo.iIngredient1}
제품성분 : ${vo.iComponent1}
제품성분 : ${vo.iIngredient2}
제품성분 : ${vo.iComponent2}
<br>
제품이미지 : <img alt="" src="../resources/img/${vo.iImage}"  width="200px" heigth="200px">
제품내용 : ${vo.iContent}
제품평점 : ${vo.iGrade}
</div>

</div>
<!-- Footer -->
<div class="modal-footer"></div>
</c:forEach>