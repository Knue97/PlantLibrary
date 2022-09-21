<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
	<!-- ? Preloader Start -->
	<%@ include file="/WEB-INF/views/include/preloader.jsp"%>
	<!-- Preloader Start -->
	<header>
		<!-- Header Start -->
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<!-- Header End -->
	</header>
	<main>
		<!-- Slider Area Start-->
		<div class="slider-area slider-bg">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<span data-animation="fadeInLeft" data-delay=".3s"><h1>백과쓰기</h1></span>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/writing.png"
								alt="book" data-animation="fadeInRight" data-delay="1s">
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">
				<img class="slider-shape1"
					src="${contextPath}/resources/assets/img/hero/top-left-shape.png"
					alt="">
			</div>
		</div>
		<div class="container">
			<div class="row row-cols-1 text-center">
				<div class="col">
					<h1>${entity.pl_koreanName} 백과 등록이 완료되었습니다.</h1>
				</div>
				<div class="col">
					<button type="button" class="btn btn-primary" onclick="location.href='/encyclopedia/plant/register'">추가
						등록하기</button>
					<button type="button" class="btn btn-primary" onclick="location.href='/encyclopedia/plant/listgroup'">백과
						리스트로 돌아가기</button>
					<button type="button" class="btn btn-primary" onclick="location.href='/'">홈으로
						가기</button>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
</body>
</html>