<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.List"%>
<%@page import="com.innerview.mvc00.item.ItemCompareVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

    <!-- 구글 fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:700,800&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400&amp;display=swap">

    <!-- 커스텀 stylesheet - for your changes-->
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css"/>">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>

<!-- 모달 받아오는곳 -->
<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>



<script type="text/javascript">
	$(function() {
	// key(소문자로 지정)  =  value(값)
	icode = '${vo.iCode}' //상품번호
	iimage = '${vo.iImage}' //상품 이미지
	icontent = '${vo.iContent}' //상품 상세 내용
	iingredient1 ='${vo.iIngredient1}' //상품 주 성분
	ccount = 1 // 상품 초기 카운트
	flag = 0 //찜 상태
	uid = null 
	
	//uid세션이 있는지 판단, 있으면 uid에 저장
	if(<%=uID != null%>){
		uid = '<%=session.getAttribute("uID")%>' 
	}	
	
	//페이지 시작시 user가 제품을 찜 했는지 확인 후 색상과 flag 상태 변경
	if(${zzim} == 1){
		$("#b6").css("background","coral");
		flag = 1;
	}

		//제품 상세 이미지 띄우는 버튼
		$("#b1").click(function() {
			$.ajax({
				url : "itemContentImage.do",
				data :{
					iContent : icontent
				},
				success : function(result){
					$("#d1").html(result);
				}//success
			})//ajax
		})//b1.click

		//제품 리뷰 연결 버튼
		$('#b2').click(function() {
			$.ajax({
				url : "../review/itemReview.do",
				data :{
					iCode : icode,
				},
				success : function(result){
					$("#d1").html(result);
				}//success
			})//ajax
		})//b2.click
		
		//비교함 저장 버튼, iCode와 image를 세션으로 저장
		 $("#b3").click(function() {
			$.ajax({
				url : "itemCompareImage.do",
				data:{
					iCode : icode,
					iImage : iimage
				},
				success : function(result){
						$("#compare").append(result);
				}//success
			})//ajax
		})//b3.click
		
		
		//비교함에 저장한 제품 modal에서 비교하는 버튼
		$("#b4").click(function(){
			//uid세션이 있는지 판단, 있으면 uid에 저장
			if(<%=session.getAttribute("list") != null%>){
	    	    $('div.modal').modal(
	        		$.ajax({
	        		url : "itemCompareModal.do",
	        		data : {},
	        		success : function(result){
						$(".modal").html(result);
	        		}//success
	        	}));//modal ajax
			}else{
				alert("비교함에 제품이 없습니다.")
			}	
	    })//b4.click
		

		//비교함 비우기 버튼 - 지정한 세션("list") 끊기 
		$("#b5").click(function() {
			$.ajax({
				url :"itemCompareRemove.do",
				data : {
					iCode : icode
					},
				success : function(result){
		          	  location.reload(); 
				}
			})//ajax
		})//b5.click
		
		
		//찜하기 버튼 session으로 uid가 저장되어있는지,
		//찜이 되어있는지(flag)판단 해서 각각 저장, 삭제
		$("#b6").click(function() {
			if(uid == null){
				//비 로그인시 alert창 출력
				alert("로그인하세요.")
			}else{//로그인시, 저장되어있는 값을
				if(flag == 0){
					console.log("찜하기 눌렀음");
					$.ajax({
						url : "../zzim/zzimresult.do",
						data : {
							iCode : icode,
							uID : uid
							},
						success : function(result){
								$("#b6").css("background","coral");
								flag++;
								console.log(flag);
							}//success
						})//ajax
				}else if(flag == 1){
					console.log("찜하기 눌렀음");
					$.ajax({
						url : "../zzim/zzimdelete.do",
						data : {
							iCode : icode,
							uID : uid
							},
						success : function(result){
								$("#b6").css("background","white");
								flag--;
								console.log(flag);
						}//success
					})//ajax
				}//else if
			}//else
		})//b6.click
		
		//수량 버튼 클릭시, 수량 변경
		$('#btn-plus').click(function() { //text/val/value
			ccount = $('#inp-totalCnt').val(); //text박스에 있는 ccount의 값 저장
			ccount++; //ccount 증가
			if (ccount > 1) {
				$('#btn-minus').prop('disabled', false); //ccount가 1보다 크면 마이너스 버튼 활성화
			}
			$('#inp-totalCnt').val(ccount); //ccount의 값을 text박스에 저장
		})//btn-plus click
		$('#btn-minus').click(function() {
			ccount = $('#inp-totalCnt').val(); //text박스에 있는 ccount의 값 저장
			if (ccount > 2) {
				ccount--; //ccount 감소
				$('#btn-minus').attr('disabled', false);
			} else if (ccount <= 2) {
				ccount--; //ccount 감소
				$('#btn-minus').attr('disabled', true); //ccount가 2와 같거나 작아지면 마이너스 버튼 비활성화
			}
			$('#inp-totalCnt').val(ccount); //ccount의 값을 text박스에 저장
		})//btn-miuns click
		
		//장바구니에 담는 버튼 
		$("#b7").click(function() {
			//비 로그인시 alert창 출력
			if(uid == null){
				alert("로그인하세요.")
			}else{
				//수량, 제품코드, 유저 아이디를 저장 
				$.ajax({
					url : "../cart/createCart.do",
					data:{
						cCount : ccount,
						iCode : icode,
						uID : uid
						},
					success: function(result){
						alert("장바구니에 담겼습니다.")
					}//success
				})//ajax
			}//if
		})//b7.click
		
		//바로구매하기 버튼 
		$("#b8").click(function() {
			//비 로그인시 alert창 출력
			if(uid == null){
				alert("로그인하세요.")
			}else{
				//제품 이름, 제품 가격, 수량 넘기기
				ititle = '${vo.iTitle}'
				iprice = '${vo.iPrice}'
				location.href = "/mvc00/pay.jsp?iTitle="+ititle+"&iPrice="+iprice+"&cCount="+ccount;
			}//if
		})//b8.click
		
		//하단에 생기는 추천제품 눌렀을때 이동하기 
		$('.item').click(function() {
			icode = $(this).attr('id')
			iingredient = $(this).attr('name')
			location.href = "/mvc00/item/itemDetail.do?iCode="+icode+"&iIngredient1="+iingredient;
		})//item.click
		
	})//function
	
</script>
	
 <br><br>

	
<div style="width: 1000px; margin: 0px auto; text-align: center;">
	<h3>제품 상세 페이지</h3>
<!--  1  -->

	<!--  모달창 -->
	<div class="modal fade" >
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote ajax call이 되는영역 -->
			</div>
		</div>
	</div>
	
	

	<!-- 본문 -->
	<div>
		<div>
			<img alt="" src="../resources/img/${vo.iImage}">
		</div>
		<!--  2  -->
		<table class="IDtb">
			<tr>
				<td>No :</td>
				<td> ${vo.iCode}</td>
			</tr>
			<tr>
				<td>제조사 :</td>
				<td> ${vo.iManufac}</td>
			</tr>
			<tr>
				<td>상품명 :</td>
				<td> ${vo.iTitle}</td>
			</tr>
			<tr>
				<td>가격 :</td>
				<td> ${vo.iPrice}원</td>
			</tr>
			<tr>
				<td>평점 :</td>
				<td><i class='fas fa-star' style="color:gold;"></i>${vo.iGrade}</td>
			</tr>
			<tr>
				<td>제푼분야 :</td>
				<td>${vo.iField1} &emsp; ${vo.iField2} </td>
			</tr>
		</table>
			
		</div>
	
	<!--  2  -->
			<!-- 수량조절 버튼 -->
			<div>
			<button type="button" class="btn_minus" id="btn-minus"disabled="">-</button> 
			<input type="text" maxlength="3" value="1" name="inp-totalCnt" 
			id="inp-totalCnt" style="text-align: center">
			<button type="button" class="btn_plus" id="btn-plus">+</button>
			</div>
			
			<div>
			<button class="IDbtn" id="b6">찜</button>
			<%-- <div id="zbox">${zzim}</div> --%>
			<button class="IDbtn" id="b7">장바구니</button>
			<button class="IDbtn" id="b8">바로구매</button>

		<table class="IDtb">
		<tr>
			<td>제품성분 : </td>
			<td>${vo.iIngredient1} (${vo.iComponent1})</td>
			<td>${vo.iIngredient2} (${vo.iComponent2})</td>
		</tr>
		</table>
		<button class="IDbtn" id="b3">비교함 담기</button>
		<button class="IDbtn" id="b4">비교하기</button>
		<button class="IDbtn" id="b5">비우기</button>
	<br><br>
		<div id="compare" >
			<!-- 세션에 저장하는 부분 -->
			<%
			if (session.getAttribute("list") != null) {
			 ArrayList<ItemCompareVO> list = (ArrayList<ItemCompareVO>) session.getAttribute("list");

			for (int i = 0; i < list.size(); i++) {
				ItemCompareVO vo = list.get(i);
			%>
			<div style="display : inline-block; heigth:200px;">
					<img alt=""src="../resources/img/<%=vo.getiImage()%>" width="200px" heigth="200px">
			</div>
			
			<%
				}
			}
			%>

		</div>
	</div>
	<hr>
	<div id="drco">
		<h5>추천 상품</h5> 


		<c:forEach var="vo" items="${list}">

			<c:if test="${vo.iCode == 0}">
				<div>추천제품이 없습니다.</div>
			</c:if>

			<c:if test="${vo.iCode !=0 }">
				<div class="item" id="${vo.iCode}" style="display: inline-block;">
				<a href="#" style="text-decoration: none; color: black;">
					<img alt="" src="../resources/img/${vo.iImage}" width="200px"
						heigth="200px"><br> 제품번호 :&ensp;${vo.iCode}
				</a>
				</div>
			</c:if>
		</c:forEach>

	</div>
	<hr>
	<div>
		<button class="IDbtn" id="b1">상세 페이지</button>
		<button class="IDbtn" id="b2">제품 리뷰</button>
	</div>
	<hr>
	<div id="d1">
		<br> 
		<img alt=""src="../resources/img/${vo.iContent}">
	</div>
	<hr>
</div>	


 <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<jsp:include page="../../../main/floating.jsp"></jsp:include>
</body>
</html>