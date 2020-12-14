<!-- review : insert.do 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>이너뷰</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- reviewwrite.jsp form action경로설정 -->
<script>
window.self.location = "http://localhost:8080/mvc00/review/list.do?rTitle=no&rScore=0.1&rContent=no&rCount=1&uID=aritaum&image=kakao.jpg";
</script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- 부트스트랩 CSS-->
<link rel="stylesheet"
	href="../resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- 구글 fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat:700,800&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400&amp;display=swap">
<!-- 테마 stylesheet-->
<link rel="stylesheet" href="../resources/css/style.default.css"
	id="theme-stylesheet">
<!-- 커스텀 stylesheet - for your changes-->
<link rel="stylesheet" href="../resources/css/main/main.css">
<!-- <link rel="stylesheet" href="resources/css/main/review.css"> --><!-- css삭제 -->
<link rel="stylesheet" href="../resources/css/main/reviewlist.css">
<!-- review : css -->
<!-- Favicon-->
<link rel="shortcut icon" href="../resources/img/favicon.ico">

</head>
<body>
	<!-- 헤더-->
	<header class="header">
		<!-- 헤더 메뉴-->
		<nav
			class="navbar navbar-expand-lg navbar-light py-4 border-bottom border-gray bg-white">
			<div
				class="container d-flex align-items-center justify-content-beween">
				<h1>
					<a class="navbar-brand" style="color: black;" href="#">3차 프로젝트
					</a>
				</h1>
				<ul class="list-inline mb-0 d-none d-lg-block">
					<li class="list-inline-item mr-3">
						<div class="d-flex">
							<div class="ml-2">
								<h6 class="text-muted text-uppercase mb-0 text-small">
									<a href="#">로그인</a>
								</h6>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<div class="d-flex">
							<div class="ml-2">
								<h6 class="text-muted text-uppercase mb-0 text-small">
									<a href="#">회원가입</a>
								</h6>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<div class="d-flex">
							<div class="ml-2">
								<h6 class="text-muted text-uppercase mb-0 text-small">
									<a href="#">마이페이지</a>
								</h6>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<div class="d-flex">
							<div class="ml-2">
								<h6 class="text-muted text-uppercase mb-0 text-small">
									<a href="#">장바구니</a>
								</h6>
							</div>
						</div>
					</li>
					<li class="list-inline-item">
						<div class="d-flex">
							<div class="ml-2">
								<h6 class="text-muted text-uppercase mb-0 text-small">
									<a href="#">리뷰페이지</a>
								</h6>
							</div>
						</div>
					</li>

				</ul>
			</div>
		</nav>
		<!-- 메뉴 바-->
		<nav
			class="navbar navbar-expand-lg navbar-light py-0 shadow-sm bg-white">
			<div class="container">
				<div class="collapse navbar-collapse py-3 py-lg-0"
					id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link pl-lg-0"
							href="#">Home <span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">비타민 </a></li>
						<li class="nav-item"><a class="nav-link" href="#">장건강 </a></li>
						<li class="nav-item"><a class="nav-link" href="#">눈건강 </a></li>
						<li class="nav-item"><a class="nav-link" href="#">간건강 </a></li>
						<li class="nav-item"><a class="nav-link" href="#">관절/뼈 </a></li>
						<li class="nav-item"><a class="nav-link" href="#">이너뷰티 </a></li>
					</ul>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link px-4 d-inline-block"
							id="searchToggler" href="#"><i
								class="fas fa-search text-muted"></i><i
								class="fas fa-times text-muted d-none"></i></a></li>
						<li class="nav-item"><a
							class="nav-link border-left px-4 bg-primary text-white d-inline-block"
							href="contact.html">Search</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="p-3 shadow-sm index-forward border-top" id="search">
			<div class="container">
				<form action="#">
					<div class="row">
						<div class="form-group col-sm-8 mb-0 mb-2 mb-sm-0">
							<input class="form-control" type="search"
								placeholder="검색어를 입력해주세요.">
						</div>
						<div class="form-group col-sm-4 text-center text-sm-left mb-0">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search mr-2"></i>SEARCH
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</header>


 	<!-- 메인 섹션 -->
	<div class="reviewContainer">
		<div class="space">
			<div class="leftspace">
				<li>
					<ul>						
						<li style="background-color:#0CB8B6; border-radius:50px;">0: ${reviewVO.rNO}</li>
						<li style="background-color:#0CB8B6; border-radius:50px;">0: ${reviewVO.uID}</li>
					</ul>
				</li>
				</div>
				<div class="rightspace">
				<li>
					<ul>
						<li style="background-color:#E8EAE9; border-radius:50px;">1: ${reviewVO.rTitle}</li>
						<li style="background-color:#E8EAE9; border-radius:50px;">2: ${reviewVO.rDate}</li>
						<li style="background-color:#E8EAE9; border-radius:50px;">2: ${reviewVO.rContent}</li>
						<li style="background-color:#E8EAE9; border-radius:50px;">3: ${reviewVO.rScore}</li>
						<li style="background-color:#E8EAE9; border-radius:50px;">3: ${reviewVO.image}</li>
					</ul>
				</li>
				</div>
			</div>
		</div>
		
	
		
	<!-- 메인 섹션 -->
	
	<!-- insert페이지에 양식 똑같이해서 list.do하단에 두기  -->
	
	
	<!-- footer 메뉴 & copywriter -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 mb-4 mb-lg-0">
					<h2 class="h5 lined text-white mb-4">About</h2>
					<p class="text-muted text-small">Joint C.E.O: jaehwa, junghoon,
						kyungmin, changhee, jungwoo</p>
					<p class="text-muted text-small">3rd project java android - the
						joeun computer academy.</p>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a class="social-link" href="#"><i
								class="fab fa-facebook-f"></i></a></li>
						<li class="list-inline-item"><a class="social-link" href="#"><i
								class="fab fa-twitter"></i></a></li>
						<li class="list-inline-item"><a class="social-link" href="#"><i
								class="fab fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a class="social-link" href="#"><i
								class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-5 mb-4 mb-lg-0">
					<h2 class="h5 text-white lined mb-4">Quick Links</h2>
					<div class="d-flex">
						<ul class="list-unstyled d-inline-block mr-4 mb-0">
							<li class="mb-2"><a class="footer-link" href="#">Home </a></li>
							<li class="mb-2"><a class="footer-link" href="#">에너지생성</a></li>
							<li class="mb-2"><a class="footer-link" href="#">장건강</a></li>
							<li class="mb-2"><a class="footer-link" href="#">눈건강</a></li>
							<li class="mb-2"><a class="footer-link" href="#">간건강</a></li>
						</ul>
						<ul class="list-unstyled d-inline-block mb-0">
							<li class="mb-2"><a class="footer-link" href="#">관절/뼈</a></li>
							<li class="mb-2"><a class="footer-link" href="#">이너뷰티</a></li>
							<li class="mb-2"><a class="footer-link" href="#">마이페이지</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<h2 class="h5 text-white lined mb-4">Newsletter</h2>
					<div class="input-group mb-3">
						<input class="form-control text-muted bg-none border-primary"
							type="text" placeholder="Email address"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" id="button-addon2" type="button">
								<i class="fas fa-paper-plane"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyrights">
			<div class="container text-center py-4">
				<p class="mb-0 text-muted">
					2020, 3rd project. &copy; designed by <a href="#">3rd project</a>.
				</p>
			</div>
		</div>
	</footer>
	<!-- JavaScript files-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/front.js"></script>
	<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
		crossorigin="anonymous">
</body>
</html>