<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- flag에 따라 리뷰 있는지 없는지 판별 -->
<c:if test="${flag == false}">
	<div>리뷰가 없습니다.</div>
</c:if>

<c:if test="${flag== true}">
	<c:forEach var="vo" items="${list}">
		<div class="item" id="${vo.rNO}">
			<table style="width: 500px; border-radius: 10px; margin: 0px auto; text-align: left; padding-left: 10px; background-color: rgb(182,220,204); font-weight: bold;">
			<tr>
			<td>No.${vo.rNO}</td>
			<td>제목 : ${vo.rTitle}</td>
			<td>평점 : ${vo.rScore}</td>
			</tr>
			<tr>
			<td>좋아요 : ${vo.rCount}</td>
			<td>작성자 : ${vo.uID}</td>
			<td>날짜 : ${vo.rDate}</td>
			</tr>
			<tr>
			<td>내용: </td>
			<td>${vo.rContent}</td>
			<td></td>
			</tr>
			</table>
			<br>
			<c:if test="${vo.image != null}">
			<div>
			제품이미지 : <img alt="" src="../resources/img/${vo.image}">
			</div>
			</c:if>
		</div>
	</c:forEach>
	
</c:if>	
