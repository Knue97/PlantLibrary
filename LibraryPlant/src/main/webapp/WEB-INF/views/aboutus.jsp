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
		<div class="slider-area white-bg ">

			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height">

				<div class="container">

					<div class="single-slider d-flex align-items-center slider-height3">
						<div class="container">
							<div class="row align-items-center justify-content-center">
								<div class="col-xl-8 col-lg-9 col-md-12 ">
									<div class="hero__caption hero__caption3 text-center">
										<span data-animation="fadeInLeft" data-delay=".3s">플랜트라이브러리,
											플라</span>
										<h1 data-animation="fadeInLeft" data-delay=".6s ">About
											Us</h1>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 text-center">
									<img class="img-fluid"
										src="${contextPath}/resources/assets/img/icon/growing-plant.png"
										alt="book" data-animation="fadeInRight" data-delay="1s">
								</div>
							</div>
						</div>

					</div>

					<!-- Slider Shape -->
					<div class="slider-shape d-none d-lg-block"></div>
					<hr>

					<!--? Team -->
					<section class="team-area section-padding40 section-bg1">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-xl-12">
									<div class="section-tittle text-center mb-105">
										<h2>플라는 이것이 다르다!</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus1.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">사용자를 고려한 백과</h5>
											<p>단순히 학술적 내용만을 저장한 백과가 아닙니다. 어려운 용어는 주석을 통해 쉽게 파악하며
												사용자들이 올린 이미지를 통해 조금 더 쉽게 받아들일 수 있는 지식을 지향합니다.</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus2.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">초보 식집사를 위한 pick</h5>
											<p>백과에서 별점과 조회수 등을 통해 식집사에 입문한 사용자들이 반려 식물로 키우기 쉬운 식물들을
												쉽게 확인할 수 있습니다. 추후 랭킹 시스템을 통해 이를 더욱더 보완하고자 합니다.</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus6.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">식집사들을 위한 community</h5>
											<p>와인, 자동차 등의 특정 취미 생활에 관심이 있는 사람들은 동호회나 온라인 카페 활동을 통해
												정보를 교환합니다. 하지만 현재 식물관련 활동은 그렇지 못합니다. 식물은 주로 매매 사이트가 주류를 이루고
												있습니다. 우리 플라는 이러한 상황에서 식집사들을 위한 살롱을 열고 사용자 간의 소통을 추구합니다</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus4.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">미니 SNS</h5>
											<p>식집사들이 모인 이곳에서 내 반려식물을 공유해보세요. 또한 다른 식집사들의 식물을 구경해 보세요.
												관심사항이 분산된 대중적인 SNS보다 관심사항이 비슷한 사람들이 모인 플라에서 응원을 주고 받아보세요</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus5.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">시금치를 흔들어주세요</h5>
											<p>동식물 분양에 있어 가장 어려운 점은 키우는 수취자가 식물을 홀대하는 경우입니다. 우리 플라는
												적어도 식물인이라는 공통점을 기반으로 식물 교류를 하고자 합니다. 내 반려식물의 아이들을 믿을 수 있는
												식집사들에게 나누어 주는 건 어떨까요?</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/aboutus3.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">내 반려식물을 위한 식물케어</h5>
											<p>반려식물을 관리할 때는 여러 요소를 고려해야 합니다. 날씨, 영양제, 분갈이, 물주기 등 초보
												식집사들뿐만 아니라 중급 이상의 식집사들도 혼자 고려하기에는 어려운 사항입니다. 이에 플라는 고려사항을 같이
												부담하고자 합니다. 카카오톡을 통한 메시지를 바탕으로 조금 더 현명한 집사가되어보는건 어떨까요?</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<hr>
					<section class="team-area section-padding40 section-bg1">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-xl-12">
									<div class="section-tittle text-center mb-105">
										<h2>플라를 만든 사람</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/member1.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">홍민관</h5>
											<p>컴퓨터를 통해 세상의 진리를 찾고하자는 개발자</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/member2.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">최효선</h5>
											<p>까불까불하지만 누구보다 열성적인 개발자</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/member3.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">김예은</h5>
											<p>차분히 코드를 작성하는 내면이 뜨거운 개발자</p>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-6">
									<div class="single-cat">
										<div class="cat-icon">
											<img
												src="${contextPath}/resources/assets/img/icon/member4.png"
												alt="">
										</div>
										<div class="cat-cap">
											<h5 style="color: black;">이경섭</h5>
											<p></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>







				</div>
			</div>
		</div>
		<div style="height: 100px;"></div>



		<!-- Slider Area End -->
	</main>
	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>​
</body>
</html>