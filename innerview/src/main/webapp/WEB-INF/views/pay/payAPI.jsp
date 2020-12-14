<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String uID = (String)session.getAttribute("uID"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
	<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp88712818'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    // radio버튼에서 받은 value값
	    pay_method : '<%= request.getAttribute("payVal") %>',
	    merchant_uid : 'merchant_' + new Date().getTime(),
		// 상품명
	    name : '<%= request.getAttribute("iTitle") %>',
	    // 총금액
	    amount : '<%= request.getAttribute("pTotalPrice") %>',
	    // select userInfo(4가지) from user where uID = ?
	    buyer_email : '${userVO.uEmail}',
	    buyer_name : '${userVO.uName}',
	    buyer_tel : '${userVO.uTel}',
	    buyer_addr : '${userVO.uAddress}',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        // 결제 성공시 form submit
	        $("#payForm").submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	    }
	    alert(msg);
	});
	</script>
	
	<!-- payCheck.jsp에서 출력해 줄 정보 -->
	<form action="pay/payCheck.do" id="payForm">
		<input type="hidden" name="pTotalPrice" value="<%= request.getAttribute("pTotalPrice") %>">
		<input type="hidden" name="uID" value="<%=uID %>">
	</form>
</body>
</html>