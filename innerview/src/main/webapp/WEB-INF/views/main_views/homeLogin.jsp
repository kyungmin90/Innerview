<%@page import="com.innerview.mvc00.main.Age"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!-- 세션 받기 -->
<%
String uID = (String)session.getAttribute("uID");

%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>이너뷰</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
     <!-- JavaScript files-->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <script src="<c:url value="/resources/js/front.js"/>"></script>
    <!-- 부트스트랩 CSS-->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <!-- 구글 fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:700,800&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400&amp;display=swap">
    <!-- 테마 stylesheet-->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.default.css"/>" id="theme-stylesheet">
    <!-- 커스텀 stylesheet - for your changes-->
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">
<script type="text/javascript">
 $(function() {
	 
	 
	 
	 //카테고리 랭킹 TOP 5 버튼
	 $(".rankBtn").click(function() {
		 iField = $(this).attr('value')
			$.ajax({
				url:"categoryAjax.do",
				data: {
					iField1: iField,
				},
				success: function(result) {
					$("#categoryDiv").html(result);
				}
			})
		})//top5 end
		
		
		//상품 클릭시 상품디테일로 이동
		$('.item').click(function() {
			
			icode = $(this).attr('id')
			iingredient = $(this).attr('name')
			
			//유저 아이디 세션으로 받아와서 값넘기고 detail.do 사용시 있는지 읽어오는 부분 컨트롤러에 추가할 것
			location.href = "/mvc00/item/itemDetail.do?iCode="+icode+"&iIngredient1="+iingredient;
			
		})
 
		
		
})//ready end


</script>
  </head>
  <body>
  
  <!-- jstl sql -->
    <sql:setDataSource
		url="jdbc:mysql://localhost:3366/iv"
		driver="com.mysql.jdbc.Driver"
		user="root"
		password="1234"
		scope="application"
		var="db"
						/>
		<!-- user 정보 불러오기 -->
		<sql:query var="userDB" dataSource="${db}">
			select * from user where uID = '<%=uID %>';
		</sql:query>
		
	<!-- 헤더연결 -->
	<jsp:include page="../../../main/header.jsp"></jsp:include>


    <!-- 메인 섹션 -->
    
    <!-- 배너 사진 -->
    <section class="bg-cover bg-top" style="background: url(<c:url value="/resources/img/main/mark1.jpg"/>);">
      <div class="container index-forward">
        <div class="row align-items-lg-center">
          <div class="col-lg-7 order-2 order-lg-1">
            <h1 class="text-uppercase text-white"><br><br><br><br><br><span class="text-primary"></span></h1>
            <p class="lead text-white mb-0"><br><br><br><br><br></p>
          </div>
        </div>
      </div>
    </section>

    <!-- 가입자 추천 상품-->
    <section class="appointment bg-light">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="card border-0 shadow-sm">
              <div class="card-body p-5 border-top border-primary border-md">
              <!-- 유저 이름 -->
              <c:forEach var="user1" items="${userDB.rows }" end="0">
              	
                <h2 class="lined">${user1.uName }님 추천 상품</h2>
                <p class="text-muted">
                ${user1.uName }님을 위한 추천상품!!</p>
				</c:forEach>
               	<br>
                <!-- 가입자 정보 상품 넣을곳 -->
              <c:forEach var="vo" items="${list}" end="4">
              <div style="width: 450px;" class="item" id="${vo.iCode }" name="${vo.iIngredient1}">
              <a href="#" style="color: black;">
              <table>
              <tr>
              <td><img style="width: 150px; height: 160px; " src="<c:url value="/resources/img/${vo.iImage}"/> "></td>
              <td>
              <p style="font-weight: bold;">${vo.iManufac}
              <i class='fas fa-star' style="color:gold;"></i>${vo.iGrade }</p>${vo.iTitle }<br>${vo.iPrice }원
              </td>
              </tr>
              </table>
              </a>
              </div>
              </c:forEach>
               <br>
             </div>
            </div>
          </div>
       <!-- 카테고리 랭킹 상품-->
           <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="card border-0 shadow-sm">
              <div class="card-body p-5 border-top border-primary border-md">
                <h2 class="lined">카테고리별 랭킹 <i class='fas fa-trophy' style="color: #ffd480;"></i></h2>
            <div id="btn_group">
            <button class="rankBtn" id="btn1" value="비타민">비타민</button>
            <button class="rankBtn" id="btn2" value="장건강">장건강</button>
            <button class="rankBtn" id="btn3" value="눈건강">눈건강</button>
            <button class="rankBtn" id="btn4" value="간건강">간건강</button>
            <button class="rankBtn" id="btn5" value="관절/뼈">관절/뼈</button>
            <button class="rankBtn" id="btn6" value="이너뷰티">이너뷰티</button>
            </div>
            <br>
   			<div id="categoryDiv" style="width: 450px;">
   			<!-- 비타민 탑5 첫화면 고정 -->
   			<p class="text-muted" style="text-align: center;">비타민 TOP 5 <i class='fas fa-trophy'></i></p>
   			<sql:query var="list1" dataSource="${db}">
					select * from item where iField1 = '비타민' order by iGrade DESC 
				</sql:query>
   			<c:forEach var="vo1" items="${list1.rows}" end="4">
   			<c:set var="i" value="${i+1}"/>
   			
              <div style="width: 450px;" class="item" id="${vo1.iCode }" name="${vo.iIngredient1}">
              <a href="#" style="color: black;">
              <table>
              <tr>
              <c:choose>
              <c:when test="${i eq '1'}">
              <td><img style="width: 70px; height: 70px; " src ="<c:url value="/resources/img/main/rank1.png"/>"></td>
              </c:when>
              <c:when test="${i eq '2'}">
              <td><img style="width: 70px; height: 70px; " src ="<c:url value="/resources/img/main/rank2.png"/>"></td>
              </c:when>
              <c:when test="${i eq '3'}">
              <td><img style="width: 70px; height: 70px; " src ="<c:url value="/resources/img/main/rank3.png"/>"></td>
              </c:when>
              <c:otherwise>
              <td style="width: 70px; text-align: center;"><h4 style="color: gray;">${i }</h4></td>
              </c:otherwise>
               </c:choose>
              <td><img style="width: 150px; height: 160px; " src="<c:url value="/resources/img/${vo1.iImage} "/> "></td>
              <td>
              <p style="font-weight: bold;">${vo1.iManufac}
              <i class='fas fa-star' style="color:gold;"></i>${vo1.iGrade }</p>${vo1.iTitle }<br>${vo1.iPrice }원
              </td>
              </tr>
              </table>
              </a>
              </div>
            
             </c:forEach>
   			
   			</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

   
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  
	<jsp:include page="../../../main/footer.jsp"></jsp:include>
	<jsp:include page="../../../main/floating.jsp"></jsp:include>
  
  
  </body>
</html>