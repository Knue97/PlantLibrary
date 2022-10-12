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
	    height: 550px;
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
                            <div class="col-xl-5 col-lg-5 col-md-9 ">
                                <div class="hero__caption">
                                    <span data-animation="fadeInLeft" data-delay=".3s">지식을 찾아 돌아다니는 식집사들의 광장</span>
                                    <h1 data-animation="fadeInLeft" data-delay=".6s ">Plant library</h1>
                                    <p data-animation="fadeInLeft" data-delay=".8s">
                                    	환영문구 생각생각
                                    </p>
                                    
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="hero__img d-none d-lg-block f-right">
                                    <img src="${contextPath}/resources/assets/img/hero/library2.jpg" alt="" data-animation="fadeInRight" data-delay="1s">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                           
            </div>
            <!-- Slider Shape -->
            <div class="slider-shape d-none d-lg-block">
                <img class="slider-shape1" src="${contextPath}/resources/assets/img/hero/top-left-shape.png" alt="">
            </div>
        </div>
        <!-- Slider Area End -->
        <!-- Domain-search start -->
        <div class="domain-search-area section-bg1">
           <div class="container">
               <div class="row">
               
               
               
               
             <div class="col-xl-12">   
               <div style="overflow: hidden; height: 550px;" id="details_slider" class="carousel slide" data-ride="carousel">
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
               
               
               
              <div class="row" style="heigt:50px;"></div> 
               
               
                   <div class="col-xl-4 col-lg-5">
                       <h2>백과 검색</h2>
                       <p>관리자와 사용자가 함께 만든 백과를 검색해보세요</p>
                   </div>
                   <div class="col-xl-8 col-lg-7">
                    <!--Hero form -->
                    <form action="#" class="search-box">
                        <div class="input-form">
                            <input type="text" placeholder="궁금한 사항을 검색하기">
                            <!-- icon search -->
                            <div class="search-form">
                                <button><i class="ti-search"></i></button>
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
                            <img src="${contextPath}/resources/assets/img/icon/services1.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">사용자를 고려한 백과</a></h5>
                            <p>단순히 학술적 내용만을 저장한 백과가 아닙니다. 어려운 용어는 주석을 통해 쉽게 파악하며 사용자들이 올린 이미지를 통해 조금 더 쉽게 받아들일 수 있는 지식을 지향합니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-cat">
                        <div class="cat-icon">
                            <img src="${contextPath}/resources/assets/img/icon/services2.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">Commitment to Security</a></h5>
                            <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-cat">
                        <div class="cat-icon">
                            <img src="${contextPath}/resources/assets/img/icon/services3.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">Passion for Privacy</a></h5>
                            <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-cat">
                        <div class="cat-icon">
                            <img src="${contextPath}/resources/assets/img/icon/services4.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">Employee Owned</a></h5>
                            <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-cat">
                        <div class="cat-icon">
                            <img src="${contextPath}/resources/assets/img/icon/services5.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">24/7 Support</a></h5>
                            <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="single-cat">
                        <div class="cat-icon">
                            <img src="${contextPath}/resources/assets/img/icon/services6.svg" alt="">
                        </div>
                        <div class="cat-cap">
                            <h5><a href="#">100% Uptime Guaranteed</a></h5>
                            <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services End -->
    <!--? Pricing Card Start -->
    <section class="pricing-card-area fix">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="section-tittle text-center mb-90">
                        <h2>이달의 인기 식물</h2>
                        <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools. Our experts are just part of the reason Bluehost is the ideal home for your WordPress website. We're here to help you succeed!</p>
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
    <!--? About-1 Area Start -->
    <div class="about-area1 section-padding40">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-xl-5 col-lg-5 col-md-8 col-sm-10">
                    <!-- about-img -->
                    <div class="about-img ">
                        <img src="${contextPath}/resources/assets/img/gallery/about1.png" alt="">
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <div class="about-caption ">
                        <!-- Section Tittle -->
                        <div class="section-tittle section-tittle2 mb-30">
                            <h2>Global server location</h2>
                        </div>
                        <p class="mb-40">Supercharge your WordPress hosting with detailed website analytics, marketing tools. Our experts are just part of the reason Bluehost is the ideal home for your WordPress website. We're here to help you succeed!</p>
                        <ul>
                            <li>
                                <img src="${contextPath}/resources/assets/img/icon/right.svg" alt="">
                                <p>WordPress hosting with detailed website</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/assets/img/icon/right.svg" alt="">
                                <p>Our experts are just part of the reason</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/assets/img/icon/right.svg" alt="">
                                <p> Detailed website analytics</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About-1 Area End -->
    <!--? About-2 Area Start -->
    <div class="about-area1 pb-bottom">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-xl-7 col-lg-7 col-md-12">
                    <div class="about-caption about-caption3 mb-50">
                        <!-- Section Tittle -->
                        <div class="section-tittle section-tittle2 mb-30">
                            <h2>Dedicated support</h2>
                        </div>
                        <p class="mb-40">Supercharge your WordPress hosting with detailed website analytics, marketing tools. Our experts are just part of the reason Bluehost is the ideal home for your WordPress website. We're here to help you succeed!</p>
                        <ul class="mb-30">
                            <li>
                                <img src="${contextPath}/resources/assets/img/icon/right.svg" alt="">
                                <p>WordPress hosting with detailed website</p>
                            </li>
                            <li>
                                <img src="${contextPath}/resources/assets/img/icon/right.svg" alt="">
                                <p>Our experts are just part of the reason</p>
                            </li>
                        </ul>
                        <a href="#" class="btn"><i class="fas fa-phone-alt"></i>(10) 892-293 2678</a>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 col-md-8 col-sm-10">
                    <!-- about-img -->
                    <div class="about-img ">
                        <img src="${contextPath}/resources/assets/img/gallery/about2.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About-2 Area End -->
    <!-- ask questions -->
    <section class="ask-questions section-bg1 section-padding30 fix">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-9 col-md-10 ">
                    <!-- Section Tittle -->
                    <div class="section-tittle text-center mb-90">
                        <h2>Frequently ask questions</h2>
                        <p>Supercharge your WordPress hosting with detailed website analytics, marketing tools. Our experts are just part of the reason Bluehost is the ideal home for your WordPress website. We're here to help you succeed!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="single-question d-flex mb-50">
                        <span> Q.</span>
                        <div class="pera">
                            <h2>Why can't people connect to the web server on my PC?</h2>
                            <p>We operate one of the most advanced 100 Gbit networks in the world, complete with Anycast support and extensive DDoS protection.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single-question d-flex mb-50">
                        <span> Q.</span>
                        <div class="pera">
                            <h2>What domain name should I choose for my site?</h2>
                            <p>We operate one of the most advanced 100 Gbit networks in the world, complete with Anycast support and extensive DDoS protection.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single-question d-flex mb-50">
                        <span> Q.</span>
                        <div class="pera">
                            <h2>How can I make my website work without www. in front?</h2>
                            <p>We operate one of the most advanced 100 Gbit networks in the world, complete with Anycast support and extensive DDoS protection.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single-question d-flex mb-50">
                        <span> Q.</span>
                        <div class="pera">
                            <h2>Why does Internet Information Server want a password?</h2>
                            <p>We operate one of the most advanced 100 Gbit networks in the world, complete with Anycast support and extensive DDoS protection.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 ">
                    <div class="more-btn text-center mt-20">
                        <a href="#" class="btn">Go to Support</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End ask questions -->
    <!--? Testimonial Area Start -->
    <section class="testimonial-area section-bg1">    
        <div class="container" >   
            <div class="testimonial-wrapper">
                <div class="row align-items-center justify-content-center">
                    <div class=" col-lg-10 col-md-12 col-sm-11">
                        <!-- Testimonial Start -->
                        <div class="h1-testimonial-active">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center mt-55">
                                <div class="testimonial-caption">
                                    <img src="${contextPath}/resources/assets/img/icon/quotes-sign.png" alt="" class="quotes-sign">
                                    <p>Brook presents your services with flexible, convenient and cdpose layouts. You can select your favorite layouts & elements for cular ts with unlimited ustomization possibilities. Pixel-perfect replica;ition of thei designers ijtls intended csents your se.</p>
                                </div>
                                <!-- founder -->
                                <div class="testimonial-founder d-flex align-items-center justify-content-center">
                                    <div class="founder-img">
                                        <img src="${contextPath}/resources/assets/img/icon/testimonial.png" alt="">
                                    </div>
                                    <div class="founder-text">
                                        <span>Jacson Miller</span>
                                        <p>Designer @Colorlib</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center mt-55"">
                                <div class="testimonial-caption">
                                    <img src="${contextPath}/resources/assets/img/icon/quotes-sign.png" alt="" class="quotes-sign">
                                    <p>Brook presents your services with flexible, convenient and cdpose layouts. You can select your favorite layouts & elements for cular ts with unlimited ustomization possibilities. Pixel-perfect replica;ition of thei designers ijtls intended csents your se.</p>
                                </div>
                                <!-- founder -->
                                <div class="testimonial-founder d-flex align-items-center justify-content-center">
                                    <div class="founder-img">
                                        <img src="${contextPath}/resources/assets/img/icon/testimonial.png" alt="">
                                    </div>
                                    <div class="founder-text">
                                        <span>Jacson Miller</span>
                                        <p>Designer @Colorlib</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Testimonial End -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--? Testimonial Area End -->
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