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
								<span data-animation="fadeInLeft" data-delay=".3s">아이들이
									궁금하세요?</span>
								<h1 data-animation="fadeInLeft" data-delay=".6s ">Plant
									Repository</h1>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/plant.png"
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

		<!-- Domain-search start -->
		<div class="domain-search-area section-bg1">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-4 col-lg-5">
						<h2 class="text-center">궁금한 사항을 검색하세요</h2>
						<p class="text-center">이름 또는 다양한 카테고리로 검색이 가능합니다</p>
					</div>
				</div>
				<div class="row justify-content-center align-content-center">
					<div class="col-xl-8 col-lg-7">
						<!--Hero form -->
						<form action="${contextPath}/encyclopedia/plant/search"
							class="search-box" method="get">
							<select name="category" id="category" class="text-center"
								onchange="changeSelect()">
								<option value="none">타입</option>
								<option value="pl_koreanName">한글명</option>
								<option value="pl_englishName">영명</option>
								<option value="pl_scientificName">학명</option>
								<option value="pl_familyName">과명</option>
								<option value="pl_classification">분류</option>
							</select>
							<div class="input-form">
								<input type="text" placeholder="Search for a domain"
									name="value">
								<!-- icon search -->
								<div class="search-form">
									<button>
										<i class="ti-search"></i>
									</button>
								</div>
								<!-- icon search -->
								<div class="world-form">
									<i class="fas fa-globe"></i>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Domain-search End -->
		<div class="container mt-150">
			<div class="d-flex justify-content-center">
				<div class="div">
					<h1>검색결과</h1>
				</div>
			</div>
			<div class="row row-cols-1 row-cols-md-3">
				<c:forEach var="entity" items="${list}">
					<div class="col mb-4">
						<div class="card h-100 text-center">
							<div class="card-header">${entity.pl_koreanName}</div>
							<img
								src="${contextPath}/resources/assets/img/dummy/${entity.pl_image}"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${entity.pl_englishName }</h5>
								<p class="card-text">${entity.pl_summary }</p>
								<a
									href="${contextPath}/encyclopedia/plant/detail?pl_id=${entity.pl_id}"
									class="btn btn-primary">자세히 보러가기</a>
								<footer class="blockquote-footer">
									수정일 <cite title="Source Title">Source Title</cite>
								</footer>
							</div>
						</div>
					</div>
				</c:forEach>
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
	<script>
		/*
		let selectList = document.getElementById('category');
		console.log(selectList);
		console.log(selectList.options[selectList.selectedIndex].value);
		 */

		function changeSelect() {
			let selectList = document.getElementById('category');

			removeSelect(selectList);
			setSelect(selectList);
			console.log(selectList.options[selectList.selectedIndex].value);

		}

		function setSelect(selectList) {
			let selectValue = selectList.options[selectList.selectedIndex].value;

			if (selectValue == 'pl_koreanName') {
				selectList[1].setAttribute('selected', true);
			}

			if (selectValue == 'pl_englishName') {
				selectList[2].setAttribute('selected', true);
			}

			if (selectValue == 'pl_scientificName') {
				selectList[3].setAttribute('selected', true);
			}

			if (selectValue == 'pl_familyName') {
				selectList[4].setAttribute('selected', true);
			}

			if (selectValue == 'pl_classification') {
				selectList[5].setAttribute('selected', true);
			}
		}

		function removeSelect(selectList) {
			for (let index = 0; index < selectList.length; index++) {
				selectList[index].removeAttribute('selected');
			}
		}
	</script>
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
</body>
</html>