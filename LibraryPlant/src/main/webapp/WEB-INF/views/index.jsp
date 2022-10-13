<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style>
    .slide-image{
	    height: 450px;
	    background-size: cover; 
	    background-position: center; 
	    background-repeat: no-repeat;
    }
    
    .thumb {
      margin: 0;
      padding: 30px 50px 30px 50px;
      list-style: none;
      background-position: center;
      background-repeat: no-repeat;
      background-size: 150px;
    }
    
</style>
</head>
<body>
    <!-- ? Preloader Start -->
    <%@ include file="/WEB-INF/views/include/preloader.jsp" %>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <%@ include file="/WEB-INF/views/include/header.jsp"  %>
        <!-- Header End -->
    </header>
    <main>
        <!-- Slider Area Start-->
        <div class="slider-area white-bg ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider d-flex align-items-center slider-height ">
                    <div class="container">
                        <div class="row align-items-center justify-content-between">
                            <div class="col-xl-3 col-lg-5 col-md-9 ">
                                <div class="hero__caption">
                                    <img src="${contextPath}/resources/assets/img/logo/logo.png" data-animation="fadeInLeft" data-delay=".6s">
                                    <span data-animation="fadeInLeft" data-delay=".3s">지식을 찾아 돌아다니는 식집사들의 광장</span>
                                    
                                </div>
                            </div>
                            <div class="col-xl-8 col-lg-6">
               <div style="overflow: hidden; height: auto;" id="details_slider" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
						<li class="active thumb" data-target="#details_slider" data-slide-to="0" style="background-image: url(${contextPath}/resources/assets/img/slide/slide1.jpg);"></li>
						<li class="thumb" data-target="#details_slider" data-slide-to="1" style="background-image: url(${contextPath}/resources/assets/img/slide/slide2.jpg);"></li>											
						<li class="thumb" data-target="#details_slider" data-slide-to="2" style="background-image: url(${contextPath}/resources/assets/img/slide/slide3.jpg);"></li>											
						<li class="thumb" data-target="#details_slider" data-slide-to="3" style="background-image: url(${contextPath}/resources/assets/img/slide/slide4.jpg);"></li>											
					</ol>
                    <div class="carousel-inner">
                    	<div class="carousel-item slide-image active" onclick = "location.href='${contextPath}/encyclopedia/plant/listgroup';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/slide/slide1.jpg);" >
                             <a class="gallery_img" href="${contextPath}/resources/assets/img/slide/slide1.jpg"></a>
                        </div>
                   		<div class="carousel-item slide-image" onclick = "location.href='${contextPath}/board/freeListAll';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/slide/slide2.jpg);" >
                             <a class="gallery_img" href="${contextPath}/resources/assets/img/slide/slide2.jpg"></a>
                        </div>
                   		<div class="carousel-item slide-image" onclick = "location.href='${contextPath}/encyclopedia/diseaseandpest';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/slide/slide3.jpg);" >
                             <a class="gallery_img" href="${contextPath}/resources/assets/img/slide/slide3.jpg"></a>
                        </div>
                   		<div class="carousel-item slide-image" onclick = "location.href='${contextPath}/botanicalgarden/navermap';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/slide/slide4.jpg);" >
                             <a class="gallery_img" href="${contextPath}/resources/assets/img/slide/slide4.jpg"></a>
                        </div>
                    </div>
				</div>
                            </div>
                        </div>
                    </div>
                </div>                           
            </div>
            <!-- Slider Shape -->
            <div class="slider-shape d-none d-lg-block">
                <img class="slider-shape1" alt="">
            </div>
        </div>
        <!-- Slider Area End -->
        
    <!--? Pricing Card Start -->
    <section class="pricing-card-area fix">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="section-tittle text-center mb-90">
                        <h2>이달의 인기 식물</h2>                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                            <img src="${contextPath}/resources/assets/img/icon/price1.svg" alt="">
                            <h4>Shared Hosting</h4>
                            <p>Starting at</p>
                        </div>
                        <div class="card-mid">
                            <h4>$4.67 <span>/ month</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>2 TB of space</li>
                                <li>unlimited bandwidth</li>
                                <li>full backup systems</li>
                                <li>free domain</li>
                                <li>unlimited database</li>
                            </ul>
                            <a href="#" class="borders-btn">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                            <img src="${contextPath}/resources/assets/img/icon/price2.svg" alt="">
                            <h4>Dedicated Hosting</h4>
                            <p>Starting at</p>
                        </div>
                        <div class="card-mid">
                            <h4>$4.67 <span>/ month</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>2 TB of space</li>
                                <li>unlimited bandwidth</li>
                                <li>full backup systems</li>
                                <li>free domain</li>
                                <li>unlimited database</li>
                            </ul>
                            <a href="#" class="borders-btn">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                            <img src="${contextPath}/resources/assets/img/icon/price3.svg" alt="">
                            <h4>Cloud Hosting</h4>
                            <p>Starting at</p>
                        </div>
                        <div class="card-mid">
                            <h4>$4.67 <span>/ month</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>2 TB of space</li>
                                <li>unlimited bandwidth</li>
                                <li>full backup systems</li>
                                <li>free domain</li>
                                <li>unlimited database</li>
                            </ul>
                            <a href="#" class="borders-btn">Get Started</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Pricing Card End -->


</main>
<footer>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
</body>
</html>