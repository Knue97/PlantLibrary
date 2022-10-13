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
								<span data-animation="fadeInLeft" data-delay=".3s"><h1>백과수정</h1></span>								
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">                                               
                        	<img class="img-fluid" src="${contextPath}/resources/assets/img/icon/writing.png" alt="book" data-animation="fadeInRight" data-delay="1s">                        	                                   
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
<form action="${contextPath }/admin/encyclopedia/plant/update" method="post">
	<div class="form-row">
		<div class="form-group col-12">
			<h2>요약정보</h2>
		</div>
		<!--식물 정보-->
		<input type="hidden" name="pl_id" value="${plant.pl_id }">
		<input type="hidden" name="ec_id" value="10">
		<div class="form-group col-md-6">
			<label for="koreanName">한글명</label> <input type="text"
				class="form-control" id="koreanName" placeholder="한글명"
				name="pl_koreanName" value="${plant.pl_koreanName }" required>
		</div>
		<div class="form-group col-md-6">
			<label for="englishName">영문명</label> <input type="text"
				class="form-control" id="englishName" placeholder="영문명"
				name="pl_englishName" value="${plant.pl_englishName }">
		</div>
		<div class="form-group col-md-6">
			<label for="scientificName">학명</label> <input type="text"
				class="form-control" id="scientificName" placeholder="학명"
				name="pl_scientificName" value="${plant.pl_scientificName }">
		</div>
		<div class="form-group col-md-6">
			<label for="familyName">과명</label> <input type="text"
				class="form-control" id="familyName" placeholder="과명"
				name="pl_familyName" value="${plant.pl_familyName }">
		</div>
		<div class="form-group col-md-6">
			<label for="classification">식물구분</label> <input type="text"
				class="form-control" id="classification" placeholder="식물구분"
				name="pl_classification" value="${plant.pl_classification }">
		</div>
		<div class="form-group col-md-6">
			<label for="nativeHome">원산지</label> <input type="text"
				class="form-control" id="nativeHome" placeholder="원산지"
				name="pl_nativeHome" value="${plant.pl_nativeHome }">
		</div>
		<div class="form-group col-md-12">
			<label for="feature">특징 및 효능</label> <input type="text"
				class="form-control" id="feature" placeholder=""
				name="pl_feature" value="${plant.pl_feature }">
		</div>
		<!--식물 정보 end-->
		<!--기르기 정보-->
		<div class="form-group col-md-6">
			<input type="hidden" id="p_level" value="${plant.pl_level }">
			<label for="level">난이도</label> <select id="level_option"
				class="form-control" name="pl_level">
				<option value="최하">최하</option>
				<option value="하">하</option>
				<option value="중">중</option>
				<option value="상">상</option>
				<option value="최상">최상</option>
			</select>
		</div>
		<div class="form-group col-md-6">
			<label for="reproduction">번식</label> <input type="text"
				class="form-control" id="reproduction" placeholder=""
				name="pl_reproduction" value="${plant.pl_reproduction }">
		</div>
		<div class="form-group col-md-6">
			<label for="water">물주기</label> <input type="text" value="${plant.pl_water }"
				class="form-control" id="water" placeholder="" name="pl_water">
		</div>
		<div class="form-group col-md-6">
			<label for="growthTemperature">생육 적온</label> <input type="text"
				class="form-control" id="growthTemperature" placeholder=""
				name="pl_growthTemperature" value="${plant.pl_growthTemperature }">
		</div>
		<div class="form-group col-md-6">
			<label for="light">햇볕 양</label> <input type="text" value="${plant.pl_light }"
				class="form-control" id="light" placeholder="" name="pl_light">
		</div>
		<div class="form-group col-md-6">
			<label for="placement">추천 공간</label> <input type="text"
				class="form-control" id="placement" placeholder=""
				name="pl_placement" value="${plant.pl_placement }">
		</div>
		<div class="form-group">
			<label for="summary">요약 정보</label>
			<textarea class="form-control" id="summary" rows="5" cols="150"
				name="pl_summary">${plant.pl_summary }</textarea>
		</div>
		<div class="form-group">
			<label for="tip">Tip</label>
			<textarea class="form-control" id="tip" rows="5" cols="150"
				name="pl_tip">${plant.pl_tip }</textarea>
		</div>
	</div>
	<!--기르기 정보 end-->

	<div class="form-group">
		<h2>상세정보</h2>
	</div>
	<div class="form-group">
		<label for="pl_detailLight">빛</label>
		<textarea class="form-control" id="pl_detailLight" rows="5"
		cols="150" name="pl_detailLight">${plant.pl_detailLight }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailTemperature">온도</label>
		<textarea class="form-control" id="pl_detailTemperature" rows="5"
			cols="150" name="pl_detailTemperature">${plant.pl_detailTemperature }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailWater">물</label>
		<textarea class="form-control" id="pl_detailWater" rows="5"
			cols="150" name="pl_detailWater">${plant.pl_detailWater }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailReproduction">번식</label>
		<textarea class="form-control" id="pl_detailReproduction" rows="5"
			cols="150" name="pl_detailReproduction">${plant.pl_detailReproduction }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailSupport">지지대</label>
		<textarea class="form-control" id="pl_detailSupport" rows="5"
			cols="150" name="pl_detailSupport">${plant.pl_detailSupport }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailSoil">흙</label>
		<textarea class="form-control" id="pl_detailSoil" rows="5"
			cols="150" name="pl_detailSoil">${plant.pl_detailSoil }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailPottingAndRoot">분갈이,뿌리</label>
		<textarea class="form-control" id="pl_detailPottingAndRoot"
			rows="5" cols="150" name="pl_detailPottingAndRoot">${plant.pl_detailPottingAndRoot }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailFertilizer">비료</label>
		<textarea class="form-control" id="pl_detailFertilizer" rows="5"
			cols="150" name="pl_detailFertilizer">${plant.pl_detailFertilizer }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_detailCaution">주의</label>
		<textarea class="form-control" id="pl_detailCaution" rows="5"
			cols="150" name="pl_detailCaution">${plant.pl_detailCaution }</textarea>
	</div>
	<div class="form-group">
		<label for="pl_imageSource">이미지 출처</label> <input type="text" value="${plant.pl_imageSource }"
			class="form-control" id="pl_imageSource" name="pl_imageSource"
			placeholder="https://pixabay.com/ko/photos/%eb%8f%88-%ea%b3%b5%ec%9e%a5-%ed%99%a9%ea%b8%88-pothos-2749714/">
	</div>
	<div class="form-group">
		<label for="pl_contentSource">내용 출처</label> <input type="text"
			class="form-control" id="pl_contentSource" name="pl_contentSource"
			placeholder="한평 공간에 만드는 나만의 실내정원" value="${plant.pl_contentSource }">
	</div>
	<div class="form-group">
		<label for="pl_image">이미지</label> <input type="hidden" value="${plant.pl_image }"
			class="form-control-file" id="pl_image" name="pl_image">
	</div>
	<button type="submit" class="btn btn-primary">백과 등록하기</button>
	<button type="reset" class="btn btn-primary" onclick="imgreset();">백과 재작성</button>
</form>

		</div>
	</main>
	<div style="height:100px;"></div>

	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
<script src="${contextPath}/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="${contextPath}/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${contextPath}/resources/assets/js/popper.min.js"></script>
<script src="${contextPath}/resources/assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="${contextPath}/resources/assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="${contextPath}/resources/assets/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/assets/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="${contextPath}/resources/assets/js/wow.min.js"></script>
<script src="${contextPath}/resources/assets/js/animated.headline.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.magnific-popup.js"></script>

<!-- Progress -->
<script src="${contextPath}/resources/assets/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="${contextPath}/resources/assets/js/jquery.counterup.min.js"></script>
<script src="${contextPath}/resources/assets/js/waypoints.min.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.countdown.min.js"></script>
<script src="${contextPath}/resources/assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="${contextPath}/resources/assets/js/contact.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.form.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.validate.min.js"></script>
<script src="${contextPath}/resources/assets/js/mail-script.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="${contextPath}/resources/assets/js/plugins.js"></script>
<script src="${contextPath}/resources/assets/js/main.js"></script>
<script>

$(function(){

	var x = $("#p_level").val();
	console.log(x+'엥');
	
	$("#level_option").val(x).prop("selected",true);
});

</script>
</body>
</html>
