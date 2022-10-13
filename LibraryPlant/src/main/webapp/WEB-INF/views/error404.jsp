<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>
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
			<div class="single-slider d-flex align-items-center slider-height2">
				<div class="container">
					<div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-6 col-lg-12 text-center">                                               
                        	<img class="img-fluid" src="${contextPath}/resources/assets/img/icon/error_200.png" alt="error" data-animation="fadeInRight" data-delay="1s">                        	                                   
                        </div>
                        <div class="col-xl-8 col-lg-9 col-md-12 ">
                            <div class="hero__caption hero__caption3 text-center">                            	
                                <h1 data-animation="fadeInLeft" data-delay=".6s ">오류발생</h1>
                            </div>                            
                        </div>
                        <div class="col-12">
							<h3>${error.getMessage()}</h3>
                        </div>                        
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