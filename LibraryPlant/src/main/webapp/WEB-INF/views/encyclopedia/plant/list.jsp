<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    
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
		<div class="slider-area slider-bg">
            <!-- Single Slider -->
            <div class="single-slider d-flex align-items-center slider-height3">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-8 col-lg-9 col-md-12 ">
                            <div class="hero__caption hero__caption3 text-center">
                            	<span data-animation="fadeInLeft" data-delay=".3s">Plant Repository</span>
                                <h1 data-animation="fadeInLeft" data-delay=".6s ">${type}</h1>
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
		<div class="container text-center">        
			<div class="row row-cols-1 row-cols-md-3">
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Golden pothos.webp" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Tiger 1</h5>
			        <p class="card-text">The Tiger I is the common name of a German heavy tank used in World War II, developed in 1942. The final official German designation was Panzerkampfwagen Tiger Ausf. E, often shortened to Tiger. It was an answer to the unexpectedly formidable Soviet armour encountered in the initial months of Operation: Barbarossa, particularly the T-34 and the KV-1. The Tiger I design gave the Wehrmacht its first tank mounting the 88 mm gun, which had previously demonstrated its effectiveness against both air and ground targets. During the course of the war, the Tiger I saw combat on all German battlefronts. It was usually deployed in independent tank battalions, which proved to be quite formidable.</p>
			        <a href="/encyclopedia/plant/detail?pl_id=1" class="btn btn-primary">Go somewhere</a>			        
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a short card.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col mb-4">
			    <div class="card h-100">
			      <img src="${contextPath}/resources/assets/img/dummy/Tigertank.jpg" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			</div>
		</div>            
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