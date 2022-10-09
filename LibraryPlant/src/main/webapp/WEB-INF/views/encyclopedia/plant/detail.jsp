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
        <div class="slider-area white-bg ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider d-flex align-items-center slider-height ">
					<div class="container">
					    <h1 class="mb-5">요약 설명</h1>
					    <h1 class="mb-5 d-none">${pl_id }</h1>
					    <h5 class="text-right">조회수: ${entity.pl_hits}</h5>
					    <h5 class="text-right"><button id ="bookmark">추가</button><span id="like">북마크: ${entity.pl_bookmarkCnt}</span></h5>
					    <div class="row">
					        <div class="col">
					        	<h2>${entity.pl_koreanName}</h2>
					            <p>
					                ${entity.pl_summary}
					            </p>					            					                                   
					        </div>
					        <div class="col">
								<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="${contextPath}/resources/assets/img/dummy/${entity.pl_image}" class="d-block w-100" alt="...">
								    </div>
								    <!-- 
								    <div class="carousel-item">
								      <img src="${contextPath}/resources/assets/img/dummy/${entity.pl_image}" class="d-block w-100" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="${contextPath}/resources/assets/img/dummy/${entity.pl_image}	" class="d-block w-100" alt="...">
								    </div>
								     -->
								  </div>
								 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </button>
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

		<div class="container">
			<h2>식물 정보</h2>
		    <div class="row">
		        <div class="col">
		            <table class="table">                		                
		                <tbody>
		                  <tr>
		                    <th>${constant.pl_koreanName }</th>
		                    <td>${entity.pl_koreanName }</td>		                    
		                  </tr>
		                  <tr>
		                    <th>${constant.pl_englishName }</th>
		                    <td>${entity.pl_englishName }</td>		                    
		                  </tr>
		                  <tr>
		                    <th>${constant.pl_scientificName }</th>
		                    <td>${entity.pl_scientificName}</td>		                    
		                  </tr>
		                  <tr>
		                    <th>${constant.pl_familyName }</th>
		                    <td>${entity.pl_familyName }</td>		                    
		                  </tr>
		                  <tr>
		                    <th>${constant.pl_classification }</th>
		                    <td>${entity.pl_classification }</td>		                    
		                  </tr><tr>
		                    <th>${constant.pl_nativeHome }</th>
		                    <td>${entity.pl_nativeHome }</td>		                    
		                  </tr>
		                  <tr>
		                    <th>${constant.pl_feature }</th>
		                    <td>${entity.pl_feature }</td>		                    
		                  </tr>                  
		                </tbody>
		            </table>
		        </div>
		    </div>
		</div>		
		
		<div class="container mt-50">
		    <h2>기르기 정보</h2>
		    <div class="row">
		        <div class="col">
		            <table class="table">                		                
		                <tbody>
		                  <tr>
		                  	<th>${constant.pl_level }</th>
		                  	<td>${entity.pl_level }</td>
		                  </tr>
		                  <tr>
		                  	<th>${constant.pl_reproduction }</th>
		                  	<td>${entity.pl_reproduction }</td>
		                  </tr>
		                  <tr>
		                  	<th>${constant.pl_water }</th>
		                  	<td>${entity.pl_water }</td>
		                  </tr>
		                  <tr>
		                  	<th>${constant.pl_growthTemperature }</th>
		                  	<td>${entity.pl_growthTemperature }</td>
		                  </tr>
		                  <tr>
		                  	<th>${constant.pl_light }</th>
		                  	<td>${entity.pl_light }</td>
		                  </tr>
		                  <tr>
		                  	<th>${constant.pl_placement }</th>
		                  	<td>${entity.pl_placement }</td>
		                  </tr>		                                    
		                </tbody>
		            </table>
		        </div>
		    </div>
		</div>
			    		
		<hr style="border: 0; height: 3px; background-color: #E77310 ">
		
		<div class="d-flex p-2 justify-content-center mt-5"  >    
		    <h1>상세 설명</h1>
		</div>
		<div class="container">
		  <div class="row row-cols-1">
			<c:if test="${entity.pl_detailLight != null }">
				<div class="col">
					<h3>${constant.pl_detailLight }</h3>
					<p>${entity.pl_detailLight}</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailTemperature != null }">
				<div>
					<h3>${constant.pl_detailTemperature }</h3>
					<p>${entity.pl_detailTemperature }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailWater != null }">
				<div>
					<h3>${constant.pl_detailWater }</h3>
					<p>${entity.pl_detailWater }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailReproduction != null }">
				<div>
					<h3>${constant.pl_detailReproduction }</h3>
					<p>${entity.pl_detailReproduction }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailSupport != null }">
				<div>
					<h3>${constant.pl_detailSupport }</h3>
					<p>${entity.pl_detailSupport }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailSoil != null }">
				<div>
					<h3>${constant.pl_detailSoil }</h3>
					<p>${entity.pl_detailSoil }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailPottingAndRoot != null }">
				<div>
					<h3>${constant.pl_detailPottingAndRoot }</h3>
					<p>${entity.pl_detailPottingAndRoot }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailFertilizer != null }">
				<div>
					<h3>${constant.pl_detailFertilizer }</h3>
					<p>${entity.pl_detailFertilizer }</p>
				</div>
			</c:if>
			<c:if test="${entity.pl_detailCaution != null }">
				<div>
					<h3>${costant.pl_detailCaution }</h3>
					<p>${entity.pl_detailCaution }</p>
				</div>
			</c:if>
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
<script>        

        $(document).ready(function(){
            $("#bookmark").click(function () {
                var form = {
                    pl_id : ${ pl_id }
                }
                $.ajax({
                    url: "${contextPaht}/encyclopedia/plant/detail/hitsup",
                    type: "POST",
                    data: form,
                    success: function (data) {
                        console.log(data);
                    },
                    error: function(){
                        alert("error");
                    }
                });
            });
            
        });
</script>
</body>
</html>