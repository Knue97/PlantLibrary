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
		<div class="slider-area slider-bg ">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<h1 data-animation="fadeInLeft" data-delay=".6s ">식물원 등록</h1>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/open-book.png"
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
			<form action="${contextPath}/botanicalgarden/update" method="get">
				<div class="form-group d-none">
					<input type="text" class="form-control"
						 name="g_id" value="${VO.g_id}"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>지역</label><input type="text" class="form-control"
						placeholder="지역" name="g_id" value="${VO.g_region }"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>이름</label> <input type="text" class="form-control"
						placeholder="식물원 또는 수목원 이름" name="g_name" value="${VO.g_name }"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>주소</label> <input type="text" class="form-control"
						placeholder="식물원 또는 수목원 주소" name="address" id="address_kakao"
						value="${VO.g_detailedAddress }" readonly="readonly">
				</div>

				<div class="form-group">
					<label>홈페이지</label> <input type="url" class="form-control"
						placeholder="식물원 또는 수목원 홈페이지" name="g_url" value="${VO.g_url }"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>요약 정보</label>
					<textarea class="form-control" rows="5" name="g_summary"
						readonly="readonly">${VO.g_summary }</textarea>
				</div>
				<div class="form-group">
					<label>위도</label> <input type="number" class="form-control"
						placeholder="식물원 또는 수목원 위도" name="g_latitude" id="g_latitude"
						step="any" readonly="readonly" value="${VO.g_latitude }">
				</div>
				<div class="form-group">
					<label>경도</label> <input type="number" class="form-control"
						placeholder="식물원 또는 수목원 경도" name="g_longitude" id="g_longitude"
						step="any" readonly="readonly" value="${VO.g_longitude }">
				</div>
				<button type="submit"  id="updateBtn">수정</button>
				<button type="button" onclick="" id="removeBtn">삭제</button>
				<div id="message"></div>
			</form>
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
	<script>
	 
     let removeBtn = document.getElementById('removeBtn');

     updateBtn.addEventListener('click',function(){
         location.href = '${contextPath}/botanicalgarden/update?g_id=${VO.g_id}';
     });		
	</script>

</body>
</html>