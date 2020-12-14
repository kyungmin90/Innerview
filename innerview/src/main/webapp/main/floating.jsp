<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

 <script type="text/javascript">
 $(function() {

 	 	//최근본상품 오른쪽으로 스크롤 따라 다니게 플로팅
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 180) {
			 scrollTop = 180;
			}
			$(".floating").stop();
			$(".floating").animate( { "top" : scrollTop });
			});//플로팅 end

			
			//최근본상품 ajax
			 $(".item").click(function() {
				 //div의 id를 iCode로 넣고 ajax data로 사용
				iCode = $(this).attr('id');
				
				$.ajax({
					url:"latelyAjax.jsp",
					data: {
						iCode1: iCode,
					},
					//ajax url에서 session 처리만 하여 result 없음
					success: function() {
					
					}
				})
			// click 후 DIV session에 값이 들어가고 새로고침하여 최근본상품 추가		
			$(".lately").load(location.href + " .lately");
			
			})//최근본상품 end 
			
			
			
			
			
			
			
			//최근본상품 ajax
			 $(".item").click(function() {
				iCode = $(this).attr('id');
				
				$.ajax({
					url:"../latelyAjax.jsp",
					data: {
						iCode1: iCode,
					},
					success: function() {
					
					}
				})
				
			// click 후 DIV 새로 고침		
			$(".lately").load(location.href + " .lately");
			
			})//최근본상품 end 	
			
			
			//제품 클릭시 상세 페이지로 이동
			$('.item').click(function() {
				
				icode = $(this).attr('id')
				iingredient = $(this).attr('name')
				
				//유저 아이디 세션으로 받아와서 값넘기고 detail.do 사용시 있는지 읽어오는 부분 컨트롤러에 추가할 것
				location.href = "/mvc00/item/itemDetail.do?iCode="+icode+"&iIngredient1="+iingredient;
				
			})
			
			
			
			
		
 })//ready end		
</script>
<!-- session을 불러와 출력 -->
<% 
ArrayList<Integer> choilist = (ArrayList) session.getAttribute("choilist");
 %>
 
 <sql:setDataSource
	url="jdbc:mysql://localhost:3366/iv"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="1234"
	scope="application"
	var="db"
	/>
  
  <div class="floating">
  <h6 style="color: white; padding-top: 7px;">최근본상품</h6>
  <div class="lately" id="lateDiv">
  
  <!-- 최근본 상품이 없을시 -->
<%if(choilist==null){ %>
  <br><br><i class='far fa-frown' style="font-size: 36px; color: gray"></i><br><br>
  <h6 style="color: gray">최근본상품이<br>없습니다.</h6><br><br>
  
  <!-- 최근본 상품이 있을시 -->
<%}else{ %>
  <%for(int i = 0; i < choilist.size(); i++){ %>
 	 <sql:query var="late" dataSource="${db}">
					select * from item where iCode='<%=choilist.get(i) %>';
	</sql:query>
	<c:forEach var="latelist" items="${late.rows }">
	<div class="item" id="${latelist.iCode}" name="${latelist.iIngredient1}">
	<a href="#" style="text-decoration: none;">									<!-- 절대 경로 -->
	<img style="width: 80px; height: 90px;" src ="${pageContext.request.contextPath}/resources/img/${latelist.iImage }">
	<br>
	<h6 style="font-size: 13px; color: black;">${latelist.iManufac }</h6>
	<h6 style="font-size: 13px; color: black;">${latelist.iTitle }</h6>
	</a>
	</div>
	<hr>
	</c:forEach>
  
  
  
  <%} 
  }%>
  </div>
  </div>