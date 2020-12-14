<%@page import="com.innerview.mvc00.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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



<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
   
   //달력 한글화를 위한 코드
   ( function(factory) {
      if (typeof define === "function" && define.amd) {

         // AMD. Register as an anonymous module.
         define([ "../widgets/datepicker" ], factory);
      } else {

         // Browser globals
         factory(jQuery.datepicker);
      }
   }(function(datepicker) {

      //달력 영문 => 한글
      datepicker.regional.ko = {
         closeText : "닫기",
         prevText : "이전달",
         nextText : "다음달",
         currentText : "오늘",
         monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
               "9월", "10월", "11월", "12월" ],
         monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",
               "9월", "10월", "11월", "12월" ],
         dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
         dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
         dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
         weekHeader : "주",
         dateFormat : "yymmdd", //데이터포멧변경가능
         firstDay : 0,
         isRTL : false,
         showMonthAfterYear : true,
         yearSuffix : "년"
      };
      datepicker.setDefaults(datepicker.regional.ko);

      return datepicker.regional.ko;

   }));//factory 

   $(function() {
      var idBoolean=false;
      var pwBoolean=false;
      var pwValue=null;
      
      var spe = /[~!@#$%^&*()_+|<>?:{}]/; //특수문자확인을 위한 변수

      $('#uID').keyup(function() { //id 자리수 확인
         if($(this).val().length < 4 || $(this).val().length > 10){
            $('.idcheck').html("<font color=red>4자 이상, 10자 이하만 가능합니다</font>")
         }else{
            $('.idcheck').html("")
         }
      })//keyup
      
      $("#checkID").click(function() {
         $.ajax({
            
            url : "checkID2.do", 
            data :{
               uID : $("#uID").val()
            },
            success : function(result) {
               if(result==1){
                  alert("아이디 중복")
               }else{
                  alert("아이디 사용가능")
                  idBoolean = true;
               }
            }//success
            
         })//ajax
         
      })//checkID.click
      
      
      
      $('#uPW').keyup(function() { //pw 자리수 확인
         if($(this).val().length < 6 || $(this).val().length > 10){
            $('.pwcheck1').html("<font color=red>6자 이상 10자 이하만 가능합니다.</font>")
         }else{
            if(!(spe.test($(this).val()))){ //특수문자입력안했을때
               $('.pwcheck1').html("<font color=red>특수문자를포함해주세요</font>")
            }else{
               $('.pwcheck1').html("")
               pwValue = $(this).val() //pwcheck 와 비교를 위해 해당 값 저장
            }
         }
      })//keyup
      
      $('#pwcheck').keyup(function() { //pw 와 pwcheck 일치 여부 확인
         if($(this).val() != pwValue){
            $('.pwcheck2').html("<font color=red>비밀번호가 일치하지 않습니다.</font>")
         }else{
            $('.pwcheck2').html("")
            pwBoolean = true; // pw와 pwcheck 일치 시 true 저장
         }
      })//keyup
      
      
      $('#signUP').click(function() { // 유효성검사
         if(idBoolean == false){
            alert("중복 확인 해주세요")
         }else{
             if(idBoolean == false || pwBoolean == false || $('#uName').val().length ==0 || $('#uBirth').val().length ==0 || $('#uGender').val().length ==0 || $('#uTel').val().length ==0
                   ||  $('#uAddress').val().length ==0 || $('#uEmail').val().length ==0){
               alert("빈칸을 확인해주세요")            
            }else{
            	alert("회원가입이 완료되었습니다.")
               insertForm.submit() // 유효성 검사 완료 후 create2.do 호출
               session.removeAttribute("result1");
               session.removeAttribute("result2");
               session.removeAttribute("result3");
            } 
         }
         
      })//signUP.click
            
      $("#uBirth").datepicker({
         changeYear : true, // 년도 select box 로 선택
         yearRange : "-100:+0", //년도 범위 지정
      })//datepicker

   });//$function
</script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
   //주소찾기 api
   function searchAddress() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("uAddress2").value = extraAddr;

                  } else {
                     document.getElementById("uAddress2").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById("uAddress").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("uAddress1").focus();
               }
            }).open();
   }
</script>
</head>
   <body>
	<!-- 헤더연결 -->
	<jsp:include page="main/header.jsp"></jsp:include>
	
	
    <!-- 가입자 추천 상품-->
    <section class="appointment bg-light">
      <div class="register_wrapper">
         <form action="create2.do" name = "insertForm" id = "insertForm" method="post">
         <h4>아이디</h4>
         <div>
            <input style="text-align: center" class = "form-control" type="text" name="uID" id="uID" placeholder="4~10자리" maxlength="10" oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9]/g, '')">
            <button class="btn btn-sm btn-primary" type="button" id="checkID">중복확인</button>
         </div>
         <div class="idcheck"></div><br>
   
         <h4>비밀번호</h4>
         <div>
            <input style="text-align: center" class = "form-control" type="password" name="uPW" id="uPW" placeholder="6~10자리" maxlength="10" oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|~!@#$%^&*()_+|<>?:{}]/g, '')">
         </div>
         <div class="pwcheck1"></div><br>
   
         <h4>비밀번호 확인</h4>
         <div>
            <input class = "form-control" style="text-align: center" type="password" name="pwcheck" id="pwcheck"
               placeholder="비밀번호 확인" maxlength="10" maxlength="10" oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|~!@#$%^&*()_+|<>?:{}]/g, '')">
         </div>
         <div class="pwcheck2"></div><br>
   
         <h4>이름</h4>
         <div>
            <input class = "form-control" style="text-align: center" type="text" name="uName" id="uName" placeholder="이름" maxlength="4" oninput="this.value = this.value.replace(/[^ㄱ-ㅎ|가-힣]/g, '')"
            <c:if test="${result1 ne 'null'}">value=${result1 }</c:if>>
         </div>
         <div class="namecheck"></div><br>
   
         <h4>생년월일</h4>
         <div>
            <input class="btn btn-sm btn-primary" type="button" value="달력" onclick="$('#uBirth').datepicker('show')"/> 
            <input class = "form-control"  style="text-align: center" type="text" name= "uBirth" id="uBirth" readonly="readonly"><br>
         </div>
         
         <h4>주소</h4>
         <div>
         <input class="btn btn-sm btn-primary" type="button" onclick="searchAddress()" value="주소 찾기"
                     readonly="readonly"><br>
         <input class = "form-control" style="text-align: center" type="text" name="uAddress" id="uAddress"
                     placeholder="주소" readonly="readonly"><br>
                  <input  class = "form-control" style="text-align: center" type="text" name="uAddress1"
                     id="uAddress1" placeholder="상세주소" oninput="this.value = this.value.replace(/[^ㄱ-ㅎ|가-힣|0-9|-]/g, '')"><br>
                  <input class = "form-control" style="text-align: center" type="text" name="uAddress2"
                     id="uAddress2" placeholder="참고항목" readonly="readonly"><br>
         </div>
         
         <h4>성별</h4>
         <div>
            <select class="btn btn-secondary dropdown-toggle" name="uGender" id="uGender">
               <option <c:if test="${result3 eq 'male'}">selected</c:if>>남자</option>
               <option <c:if test="${result3 eq 'female'}">selected</c:if>>여자</option>
            </select>
         </div><br>
   
         <h4>전화번호</h4>
         <div>
            <input class = "form-control" style="text-align: center" type="text" maxlength="11" name="uTel" id="uTel" oninput="this.value = this.value.replace(/[^0-9]/g, '')" />
         </div><br>
         
         <h4>이메일</h4>
         <div>
            <input class = "form-control" style="text-align: center" type="text" maxlength="25" name="uEmail" id="uEmail" oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|@.]/g, '')"
            <c:if test="${result2 ne 'null'}">value=${result2 }</c:if>>
         </div><br>
         
         <h4>관심분야</h4>
            <select class="btn btn-secondary dropdown-toggle" name = "uInterest" id="uInterest">
               <option>비타민</option>
               <option>장건강</option>
               <option>눈건강</option>
               <option>간건강</option>
               <option>관절/뼈</option>
               <option>이너뷰티</option>
            </select>
         <br><br>
      
      <button class="btn btn-lg btn-primary" id="signUP" type="button">회원가입</button>
   </form>
      
      </div>
      
    
    </section>
    
    
    <jsp:include page="main/footer.jsp"></jsp:include>
    
    

    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  </body>
</html>