<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>

.disease-pest-list { display:none; }

.customizing-check{

	margin-right : 10px;
	padding: 0;
	border: none;
	background: none;
	font-size: 23px;
	font-weight: bold;
	text-decoration: underline;
	
}

.customizing{

	margin-right : 10px;
	padding: 0;
	border: none;
	background: none;
	font-size: 23px;

}

.card {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #FFFEFE;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 1.5rem;
  height: 320px;
}

.overflow-hidden {
  overflow: hidden !important;
}

.shadow {
  -webkit-box-shadow: 0 6.25rem 5rem 0 rgba(0, 0, 0, 0.02), 0 4.05063rem 2.92813rem 0 rgba(0, 0, 0, 0.0152), 0 2.4075rem 1.5925rem 0 rgba(0, 0, 0, 0.0121), 0 1.25rem 0.8125rem 0 rgba(0, 0, 0, 0.01), 0 0.50938rem 0.4075rem 0 rgba(0, 0, 0, 0.0079), 0 0.11563rem 0.19687rem 0 rgba(0, 0, 0, 0.0048) !important;
  box-shadow: 0 6.25rem 5rem 0 rgba(0, 0, 0, 0.02), 0 4.05063rem 2.92813rem 0 rgba(0, 0, 0, 0.0152), 0 2.4075rem 1.5925rem 0 rgba(0, 0, 0, 0.0121), 0 1.25rem 0.8125rem 0 rgba(0, 0, 0, 0.01), 0 0.50938rem 0.4075rem 0 rgba(0, 0, 0, 0.0079), 0 0.11563rem 0.19687rem 0 rgba(0, 0, 0, 0.0048) !important;
}

.card-img,
.card-img-top,
.card-img-bottom {
  width: 100%;
  height: 260px;
}

.card-img,
.card-img-top {
  border-top-left-radius: calc(1.5rem - 1px);
  border-top-right-radius: calc(1.5rem - 1px);
}

.fit-cover {
  -o-object-fit: cover;
  object-fit: cover;
}

.card-body {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  padding: 1rem 1rem;
}

.d-flex {
  display: -webkit-box !important;
  display: -ms-flexbox !important;
  display: flex !important;
}

.flex-column {
  -webkit-box-orient: vertical !important;
  -webkit-box-direction: normal !important;
  -ms-flex-direction: column !important;
  flex-direction: column !important;
}

.flex-lg-row {
    -webkit-box-orient: horizontal !important;
    -webkit-box-direction: normal !important;
    -ms-flex-direction: row !important;
    flex-direction: row !important;
  }

.justify-content-between {
  -webkit-box-pack: justify !important;
  -ms-flex-pack: justify !important;
  justify-content: space-between !important;
}

.text-secondary {
  color: #5E6282 !important;
}

.fw-semi-bold {
  font-weight: 600 !important;
}

.link-900 {
  color: #5E6282 !important;
}

.text-decoration-none {
  text-decoration: none !important;
}

.stretched-link::after {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1;
  content: "";
}

 .col-md-3 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: 25%;
  }
  
.mb-3 {
  margin-bottom: 1rem !important;
}

.py-2 {
  padding-top: 0.5rem !important;
  padding-bottom: 0.5rem !important;
}

.px-3 {
  padding-right: 1rem !important;
  padding-left: 1rem !important;
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
 
                <!-- Single Slider -->
                 <div class="single-slider d-flex align-items-center slider-height">
                
                    <div class="container">
                    
                   <div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<span data-animation="fadeInLeft" data-delay=".3s">내 식물들이
									아프다면?</span>
								<h1 data-animation="fadeInLeft" data-delay=".6s ">Disease and Pest
									Repository</h1>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/pests.png"
								alt="book" data-animation="fadeInRight" data-delay="1s">
						</div>
					</div>
				</div>
				
			</div>
			
			            <!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">

			</div>
			
			
			<!-- Domain-search start -->
		<div class="domain-search-area section-bg1">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-5 col-lg-5">
						<h2 class="text-center">궁금한 사항을 검색하세요</h2>
						<p class="text-center">병해명 또는 해충명으로 검색이 가능합니다</p>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-7">
						<!--Hero form -->
						<form action="${contextPath }/encyclopedia/diseaseandpest/search" class="search-box" method="get">
							<div class="input-form">
								<input type="text" id="searchInput" placeholder="Search for a disease and pest"
									name="searchword">
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
		<br><hr>
		
                    	<button class="customizing-check" style="color:black;" id="popular-disease-button">자주 찾는 병해 <img src="${contextPath}/resources/assets/img/icon/leaf.png" style="height:22px;"></button>
                    	<button class="customizing" style="color:black;" id="popular-pest-button">자주 찾는 해충 <img src="${contextPath}/resources/assets/img/icon/worm.png" style="height:22px;"></button>
                    	<hr>
                    	<div class="row justify-content-center" id="popular-top3">
                    	<c:forEach var="popular" items="${popularDisease }">
                    		
                    <div style="margin-left: 20px; margin-right: 20px;" >
						<div class="card overflow-hidden shadow" style="width:325px; margin-bottom: 7px;">
							<img class="card-img-top fit-cover" src="${contextPath}/resources/assets/img/disease/${popular.di_image }" alt="${popular.di_image }"/>
							<div class="card-body py-2 px-3 ">
								<div class="d-flex flex-column flex-lg-row justify-content-between mb-3 ">
								<h5 class="text-secondary fw-semi-bold" style="padding-top:10.5px;"><a class="link-900 text-decoration-none stretched-link"
								href="${contextPath }/encyclopedia/disease/detail?di_id=${popular.di_id}">${popular.di_alias }</a></h5>
								</div>
							</div>
						</div>
					</div>
                    	</c:forEach>
                    	
                    	
                    	
                    	</div>
                    	<hr>
                    	
                    	                    	
                    	
                    	<button class="customizing-check" style="color:black;" id="show-disease-list">병해백과 목록 <img src="${contextPath}/resources/assets/img/icon/leaf.png" style="height:22px;"></button>
                    	<button class="customizing" style="color:black;" id="show-pest-list">해충백과 목록 <img src="${contextPath}/resources/assets/img/icon/worm.png" style="height:22px;"></button>
                    	<hr>
                    	
				        <div class="row" id="insert-list">
                    	</div>

                    	
                    	<div class="row justify-content-center">
                    	
                    	<button type="button" id="load" class="genric-btn info-border radius more">MORE</button>

                    	
                    	</div>
                    	
                    	
                   	 </div>
                 </div>   
                 </div>         
			<div style="height:100px;"></div>


           
        <!-- Slider Area End -->
	</main>
<footer>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>​
<script>

	$(function(){
		
		diseaseList();
		
		//인기순위
		$("#popular-disease-button").on('click',function(){
			
			var htmls = '';
			htmls += '<div class="row justify-content-center" id="popular-top3">';
        	htmls += '<c:forEach var="popular" items="${popularDisease }">';
        	htmls += '<div style="margin-left: 20px; margin-right: 20px;" >';
        	htmls += '<div class="card overflow-hidden shadow" style="width:325px; margin-bottom: 7px;">';
        	htmls += '<img class="card-img-top fit-cover" src="${contextPath}/resources/assets/img/disease/${popular.di_image }" alt="${popular.di_image }"/>';
        	htmls += '<div class="card-body py-2 px-3 ">';
        	htmls += '<div class="d-flex flex-column flex-lg-row justify-content-between mb-3 ">';
        	htmls += '<h5 class="text-secondary fw-semi-bold" style="padding-top:10.5px;"><a class="link-900 text-decoration-none stretched-link"';
        	htmls += 'href="${contextPath }/encyclopedia/disease/detail?di_id=${popular.di_id}">${popular.di_alias }</a></h5>';
        	htmls += '</div></div></div></div></c:forEach></div>';
			
			
			$("#popular-top3").replaceWith(htmls);
			
			$("#popular-disease-button").attr("class", "customizing-check");
			$("#popular-pest-button").attr("class", "customizing");
		})
		
		
		$("#popular-pest-button").on('click',function(){
			
			var htmls = '';
			htmls += '<div class="row justify-content-center" id="popular-top3">';
        	htmls += '<c:forEach var="popular" items="${popularPest }">';
        	htmls += '<div style="margin-left: 20px; margin-right: 20px;" >';
        	htmls += '<div class="card overflow-hidden shadow" style="width:325px; margin-bottom: 7px;">';
        	htmls += '<img class="card-img-top fit-cover" src="${contextPath}/resources/assets/img/pest/${popular.pe_image }" alt="${popular.pe_image }"/>';
        	htmls += '<div class="card-body py-2 px-3 ">';
        	htmls += '<div class="d-flex flex-column flex-lg-row justify-content-between mb-3 ">';
        	htmls += '<h5 class="text-secondary fw-semi-bold" style="padding-top:10.5px;"><a class="link-900 text-decoration-none stretched-link"';
        	htmls += 'href="${contextPath }/encyclopedia/pest/detail?pe_id=${popular.pe_id}">${popular.pe_name }</a></h5>';
        	htmls += '</div></div></div></div></c:forEach></div>';
			
			
			$("#popular-top3").replaceWith(htmls);
			$("#popular-disease-button").attr("class", "customizing");
			$("#popular-pest-button").attr("class", "customizing-check");
			
			
		})
		
		
		// 더보기버튼
		
		$(document).on('click','.more',function(){
			$(".disease-pest-list:hidden").slice(0, 4).show();
			
			if($(".disease-pest-list:hidden").length == 0){ // check if any hidden divs still exist
				$('#load').replaceWith('<button type="button" id="load" class="genric-btn info-border radius fold">FOLD</button>');
		
				}
		})	
		
		$(document).on('click','.fold',function(){
			$('.disease-pest-list').slice(8,$('.disease-pest-list').length).hide();
			$('#load').replaceWith('<button type="button" id="load" class="genric-btn info-border radius more">MORE</button>');
			$("#show-disease-list").focus();
		})
		
		
		
		
		
		
	
		
		});
	
	
	//해충백과 리스트 ajax 불러오기
	$("#show-pest-list").click(function() {
		
		$("#show-pest-list").attr("class", "customizing-check");
		$("#show-disease-list").attr("class", "customizing");
		
		$.ajax({
			
			url: "${contextPath}/encyclopedia/pest/list",
			dataType: 'json',
			type: 'GET',
			success: function(result){
	
				var htmls = "";
				
				$(result).each(function(){
					
					htmls += ' <div class="col-md-3 mb-3 disease-pest-list" >';
					htmls += ' <div class="card overflow-hidden shadow" style="width:260px;margin-bottom: 7px;">'
					htmls += '<img class="card-img-top fit-cover" src="${contextPath}/resources/assets/img/pest/' + this.pe_image + '" alt="'+ this.pe_name +'"/>';
					htmls += '<div class="card-body py-2 px-3 ">';
					htmls += '<div class="d-flex flex-column flex-lg-row justify-content-between mb-3 ">';
					htmls += '<h5 class="text-secondary fw-semi-bold" style="padding-top:10.5px;"><a class="link-900 text-decoration-none stretched-link"';
					htmls += 'href="${contextPath }/encyclopedia/pest/detail?pe_id=' + this.pe_id +'">'+ this.pe_name +'</a></h5>';
					htmls += '</div></div></div></div>';
					
				});
				
				$("#insert-list").html(htmls);
				
				$(".disease-pest-list").slice(0, 8).show();
				
				
			},
			error: function(result){
				
				alert('실패');
				
			}
			
			
		})

		
	})
	

	$('#show-disease-list').click(function(){
		
		$("#show-pest-list").attr("class", "customizing");
		$("#show-disease-list").attr("class", "customizing-check");
		
		diseaseList();
		
	});
	
	
	
	
	function diseaseList() {
		

		
		$.ajax({
			
			url: "${contextPath}/encyclopedia/disease/list",
			dataType: 'json',
			type: 'GET',
			success: function(result){

				var htmls = "";
				
				$(result).each(function(){
					
					htmls += ' <div class="col-md-3 mb-3 disease-pest-list" >';
					htmls += ' <div class="card overflow-hidden shadow" style="width:260px;margin-bottom: 7px;">'
					htmls += '<img class="card-img-top fit-cover" src="${contextPath}/resources/assets/img/disease/' + this.di_image + '" alt="'+ this.di_alias +'"/>';
					htmls += '<div class="card-body py-2 px-3 ">';
					htmls += '<div class="d-flex flex-column flex-lg-row justify-content-between mb-3 ">';
					htmls += '<h5 class="text-secondary fw-semi-bold" style="padding-top:10.5px;"><a class="link-900 text-decoration-none stretched-link"';
					htmls += 'href="${contextPath }/encyclopedia/disease/detail?di_id=' + this.di_id +'">'+ this.di_alias +'</a></h5>';
					htmls += '</div></div></div></div>';
					
				});
				
				$("#insert-list").html(htmls);
				
				$(".disease-pest-list").slice(0, 8).show(); // select the first 8
				
				
			},
			error: function(result){
				
				alert('실패');
				
			}
			
			
		})

		
	}
	
	
	
	
</script>

</body>
</html>