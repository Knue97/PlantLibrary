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
	    <div class="slider-area slider-bg ">
            <!-- Single Slider -->
            <div class="single-slider d-flex align-items-center slider-height3">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-xl-8 col-lg-9 col-md-12 ">
                            <div class="hero__caption hero__caption3 text-center">
                            	<span data-animation="fadeInLeft" data-delay=".3s">식집사들이 기다려왔던</span>
                                <h1 data-animation="fadeInLeft" data-delay=".6s ">백과사전</h1>
                            </div>                            
                        </div>
                        <div class="col-xl-6 col-lg-6 text-center">                                               
                        	<img class="img-fluid" src="${contextPath}/resources/assets/img/icon/open-book.png" alt="book" data-animation="fadeInRight" data-delay="1s">                        	                                   
                        </div>
                    </div>                    
                </div>
            </div>    
            <!-- Slider Shape -->
            <div class="slider-shape d-none d-lg-block">
                <img class="slider-shape1" src="${contextPath}/resources/assets/img/hero/top-left-shape.png" alt="">
            </div>
        </div>
        
        <!-- Domain-search start -->
        <div class="domain-search-area section-bg1">
           <div class="container">
               <div class="row justify-content-center">
                   <div class="col-xl-4 col-lg-5">
                       <h2 class="text-center">궁금한 사항을 검색하세요</h2>
                       <p class="text-center">운영자와 사용자가 함께 집필하는 백과</p>
                   </div>
               </div>
               <div class="row justify-content-center">
                   <div class="col-xl-8 col-lg-7">
                    <!--Hero form -->
                    <form action="/encyclopedia/plant" class="search-box" method="get">
                        <div class="input-form">
                            <input type="text" placeholder="Search for a domain" name="value">
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
    	
		<div class="container mt-6">
		    <div class="row">
		        <div class="col">
		            <div class="d-flex flex-column">
		                <div class="row">
		                    <div class="col">
		                        <h2>Explore plants, flowers,weeds and more</h2>
		                    </div>
		                </div>
		                <div class="row">
		                    <div class="col">
								<p>
									There are roughly 400,000 known species of plants on planet Earth, of which the great majority, some 300,000 species, produce seeds.
									Green plants provide a substantial proportion of the world’s molecular oxygen, and are the basis of most of Earth’s ecosystems.
									
									Plants that produce grain, fruit, and vegetables also form basic human foods and have been domesticated for millennia.
									
									Plants have many cultural and other uses, as ornaments, building materials, writing material and, in great variety, they have been the source of medicines and psychoactive drugs.
									
									There are four main groups of plants in the plant kingdom:								
								</p>		                       
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="col">
		            <img src="${contextPath}/resources/assets/img/plant/가울테리아.jpg" alt="" class="img-fluid">
		        </div>
		    </div>
		</div>
		
		<div class="container mt-6">
		    <div class="row">
		        <div class="col">
		            <h1>Search by plant group</h1>
		        </div>
		    </div>
		    <div class="row justify-content-center">
		        <div class="col">
		            <div class="card" style="width: 18rem;">
		                <img src="${contextPath}/resources/assets/img/plant/sample1.jpg" class="card-img-top" alt="...">
		                <div class="card-body">
		                    <h5 class="card-title">Angiosperms</h5>
		                    <p class="card-text">The flowering plants, also known as Angiospermae, or Magnoliophyta, are the most diverse group of land plants, with 64
		                    orders, 416 families, approximately 13,000 known genera and 300,000 known species</p>
		                    <a href="#" class="btn btn-primary">view more</a>
		                </div>
		            </div>
		        </div>
		        <div class="col">
		            <div class="card" style="width: 18rem;">
		                <img src="${contextPath}/resources/assets/img/plant/sample2.jpg" class="card-img-top" alt="...">
		                <div class="card-body">
		                    <h5 class="card-title">Gymnosperms</h5>
		                    <p class="card-text">The gymnosperms, also known as Acrogymnospermae, are a group of seed-producing plants that includes conifers, cycads,
		                    Ginkgo, and gnetophytes. The gymnosperms and angiosperms together compose the spermatophytes or seed plants.</p>
		                    <a href="#" class="btn btn-primary">view more</a>
		                </div>
		            </div>
		        </div>        
		    </div>
		    <div class="row justify-content-center">
		        <div class="col">
		            <div class="card" style="width: 18rem;">
		                <img src="${contextPath}/resources/assets/img/plant/sample3.jpg" class="card-img-top" alt="...">
		                <div class="card-body">
		                    <h5 class="card-title">Pteridophytes</h5>
		                    <p class="card-text">A pteridophyte is a vascular plant (with xylem and phloem) that disperses spores. Ferns, horsetails, and lycophytes are
		                    all pteridophytes.</p>
		                    <a href="#" class="btn btn-primary">view more</a>
		                </div>
		            </div>
		        </div>
		        <div class="col">
		            <div class="card" style="width: 18rem;">
		                <img src="${contextPath}/resources/assets/img/plant/sample4.jpg" class="card-img-top" alt="...">
		                <div class="card-body">
		                    <h5 class="card-title">Bryophytes</h5>
		                    <p class="card-text">Bryophytes are an informal group consisting of three divisions of non-vascular land plants (embryophytes): the
		                    liverworts, hornworts and mosses.</p>
		                    <a href="#" class="btn btn-primary">view more</a>
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