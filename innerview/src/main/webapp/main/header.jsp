<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%//user 로그인 세션
String uID = (String)session.getAttribute("uID"); 

%> 
    
    
<script type="text/javascript">
			
$(function() {
	
	//검색
	//검색 form에 입력값을 submit
	$("#searchform").submit(function() {
	searchInput = $("#searchInput").text();
	})//검색end

	
	//로그아웃
	$('#logout').click(function() {
		
		var result = confirm("로그아웃 하시겠습니까?");
		
	if (result) { //확인
	//로그아웃 확인 클릭시 logout.jsp로 이동하여 유저아이디 session remove
	location.replace("/mvc00/main/logout.jsp");

	
	}else{
		//취소 동작 없음
	}
		
	})//로그아웃 end



})
</script>

	<sql:setDataSource
	url="jdbc:mysql://localhost:3366/iv"
	driver="com.mysql.jdbc.Driver"
	user="root"
	password="1234"
	scope="application"
	var="db"
		/>


		<sql:query var="userDB" dataSource="${db}">
			select * from user where uID = '<%=uID %>';
		</sql:query>
    
      <!-- 헤더-->
    <header class="header">
      <!-- 헤더 메뉴-->
      <nav class="navbar navbar-expand-lg navbar-light py-4 border-bottom border-gray bg-white">
																										
        <div class="container d-flex align-items-center justify-content-beween"><h1 class="navbar-brand" style="color:black;">이너뷰</h1>

 <ul class="list-inline mb-0 d-none d-lg-block">
 
 <!-- user 정보 불러오기 -->
 	<!-- 미로그인시 헤더 메뉴 -->
 	<%if(uID == null){%>
            <li class="list-inline-item mr-3">
              <div class="d-flex">
                <div class="ml-2">
                  <h6 class="text-muted text-uppercase mb-0 text-small"><a href="<c:url value="/login.jsp"/>">로그인</a></h6>
                </div>
              </div>
            </li>
            <li class="list-inline-item">
              <div class="d-flex">
                <div class="ml-2">
                  <h6 class="text-muted text-uppercase mb-0 text-small"><a href="<c:url value="/registercheck.jsp"/>">회원가입</a></h6>
                </div>
              </div>
            </li>
            <%}else{ %>
       
       <!-- 로그인시 헤더 메뉴 -->
       <li class="list-inline-item">
              <div class="d-flex">
                <div class="ml-2">
                <!-- 로그인 유저 이름 -->
                <c:forEach var="user" items="${userDB.rows}" end="0">
                  <h6>${user.uName } 님</h6>
                </c:forEach>
                </div>
              </div>
            </li>
            <li class="list-inline-item mr-3">
              <div class="d-flex">
                <div class="ml-2">
                <button id = "logout">로그아웃</button>
                </div>
              </div>
            </li>
            <li class="list-inline-item">
              <div class="d-flex">
                <div class="ml-2">
                  <h6 class="text-muted text-uppercase mb-0 text-small"><a href="<c:url value="/myPage.jsp"/>">마이페이지</a></h6>
                </div>
              </div>
            </li>
            <li class="list-inline-item">
              <div class="d-flex">
                <div class="ml-2">
                  <h6 class="text-muted text-uppercase mb-0 text-small"><a href="<c:url value="/cart.jsp"/>">장바구니</a></h6>
                </div>
              </div>
            </li>
            <li class="list-inline-item">
              <div class="d-flex">
                <div class="ml-2">
                  <h6 class="text-muted text-uppercase mb-0 text-small"><a href="/mvc00/reviewwrite.jsp">리뷰페이지</a></h6>
                </div>
              </div>
            </li>
       <%} %>
          </ul>
        </div>
      </nav>
      
      
      <!-- 메뉴 바-->
      <nav class="navbar navbar-expand-lg navbar-light py-0 shadow-sm bg-white">
        <div class="container">
          <div class="collapse navbar-collapse py-3 py-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            
            <!-- 로그인시, 로그인 아닐시 Home버튼 클릭시 경로 다름 -->
            
           <%  if(uID == null){%>
              <li class="nav-item active"><a class="nav-link pl-lg-0" href="<c:url value="/home.jsp"/>">Home <span class="sr-only">(current)</span></a></li>            
            <% }else{ %>
            	<li class="nav-item active"><a class="nav-link pl-lg-0" href="<c:url value="/main_views/homeLogin.do"/>">Home <span class="sr-only">(current)</span></a></li> 
            <% } %>
            
            
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=비타민">비타민 </a></li>
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=장건강">장건강 </a></li>
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=눈건강">눈건강 </a></li>
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=간건강">간건강 </a></li>
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=관절/뼈">관절/뼈 </a></li>
              <li class="nav-item"><a class="nav-link" href="/mvc00/item/itemList.do?iField1=이너뷰티">이너뷰티 </a></li>
            </ul>
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a class="nav-link px-4 d-inline-block" id="searchToggler" href="#"><i class="fas fa-search text-muted"></i><i class="fas fa-times text-muted d-none"></i></a></li>
              <li class="nav-item"><a class="nav-link border-left px-4 bg-primary text-white d-inline-block" href="#">Search</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="p-3 shadow-sm index-forward border-top" id="search">
        <div class="container">
        
        
           <!-- 검색 폼 -->
           <!-- input값을 가지고 MainController의 search.do로 -->
          <form action="<c:url value="/main_views/search.do"/>" id="searchform">
            <div class="row">
              <div class="form-group col-sm-8 mb-0 mb-2 mb-sm-0">
                <input id="searchInput" name="searchInput" class="form-control" type="text" placeholder="검색어를 입력해주세요.">
              </div>
              <div class="form-group col-sm-4 text-center text-sm-left mb-0">
                <button id="searchBtn" class="btn btn-primary" type="submit"> <i class="fas fa-search mr-2"></i>SEARCH</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </header>