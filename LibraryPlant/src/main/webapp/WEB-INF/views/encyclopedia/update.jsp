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
		
			<div class="form-row col-12">
					<div class="form-group col-md-4">
						<h2><label for="ec_id">백과사전 카테고리</label></h2> <select id="ec_id"
							class="form-control" name="ec_id" onchange="onChange();">
							<option selected value="">--- 항목선택 ---</option>
							<option value="10">식물</option>
							<option value="20">병해</option>
							<option value="30">해충</option>
						</select>
					</div>
					<div class="form-group col-md-8">
						<h2><label for="searchInput">검색하기</label></h2> <input type="text"
							class="form-control" id="searchInput" placeholder="검색어를 입력하세요"
							name="searchInput">
					</div>
				</div>
					
			<div id="form_out"></div>
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
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
	
	
<script>
	function onChange(){
		
		var sort = document.getElementById("ec_id").options[document.getElementById("ec_id").selectedIndex].value;
		
		if(sort==10){
			$("#form_out").load("plantupdate");
		}
		
		else if(sort==20){
			$("#form_out").load("diseaseupdate");
		}
		
		else if(sort==30){
			$("#form_out").load("pestupdate");
		}
		
	}
	

</script>	
</body>
</html>