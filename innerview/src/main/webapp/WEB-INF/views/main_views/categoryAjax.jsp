<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {

		//최근본상품 ajax
		$(".item").click(function() {
			iCode = $(this).attr('id');

			$.ajax({
				url : "latelyAjax.jsp",
				data : {
					iCode1 : iCode,
				},
				success : function() {

				}
			})

			// click 후 DIV 새로 고침		
			$(".lately").load(location.href + " .lately");

		})//최근본상품 end

		//최근본상품 ajax
		$(".item").click(function() {
			iCode = $(this).attr('id');

			$.ajax({
				url : "../latelyAjax.jsp",
				data : {
					iCode1 : iCode,
				},
				success : function() {

				}
			})

			// click 후 DIV 새로 고침		
			$(".lately").load(location.href + " .lately");

		})//최근본상품 end 

		
		
		
		
		
		$('.item').click(
				function() {

					icode = $(this).attr('id')
					iingredient = $(this).attr('name')

					//유저 아이디 세션으로 받아와서 값넘기고 detail.do 사용시 있는지 읽어오는 부분 컨트롤러에 추가할 것
					location.href = "/mvc00/item/itemDetail.do?iCode=" + icode
							+ "&iIngredient1=" + iingredient;

				})

				
				
				
				
				
	})//ready end
</script>




<!-- c tag forEach를 사용하여 상품 5개 출력/ choose, when을 사용하여 순위 조건부 출력 -->
<c:forEach var="vo" items="${category}" end="0">
	<p class="text-muted" style="text-align: center;">${vo.iField1}
		TOP5 <i class='fas fa-trophy'></i>
	</p>
</c:forEach>
<c:forEach var="vo" items="${category }" end="4">
	<c:set var="i" value="${i+1}" />
	<div class="item" style="width: 450px;" id="${vo.iCode }" name="${vo.iIngredient1}">
		<a href="#" style="color: black;" class="itemLink">
			<table>
				<tr>
					<c:choose>
						<c:when test="${i eq '1'}">
							<td><img style="width: 70px; height: 70px;"
								src="<c:url value="/resources/img/main/rank1.png"/>"></td>
						</c:when>
						<c:when test="${i eq '2'}">
							<td><img style="width: 70px; height: 70px;"
								src="<c:url value="/resources/img/main/rank2.png"/>"></td>
						</c:when>
						<c:when test="${i eq '3'}">
							<td><img style="width: 70px; height: 70px;"
								src="<c:url value="/resources/img/main/rank3.png"/>"></td>
						</c:when>
						<c:otherwise>
							<td style="width: 70px; text-align: center;"><h4
									style="color: gray;">${i }</h4></td>
						</c:otherwise>
					</c:choose>
					<td><img style="width: 150px; height: 160px;"
						src="${pageContext.request.contextPath}/resources/img/${vo.iImage}" /></td>
					<td><p style="font-weight: bold;">${vo.iManufac}
							<i class='fas fa-star' style="color: gold;"></i>${vo.iGrade }</p>${vo.iTitle }<br>${vo.iPrice }원</td>
				</tr>
			</table>
		</a>
	</div>
</c:forEach>