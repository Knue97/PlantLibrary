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
					    <h2 >${disease.di_alias }<img src="${contextPath}/resources/assets/img/icon/empty.png" id="bookmark"
										style="float:right; height:35px;cursor:pointer;" class="bookmarkno" onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>
										</h2>
										
									<c:if test="${user != null}">
										<a href="${contextPath }/encyclopedia/modifyrequest?mr_name=${disease.di_id}&ec_id=${disease.ec_id}&name=${disease.di_alias}"
										style="color: black; float: right;">수정문의</a>
									</c:if>
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
								      <img src="${contextPath}/resources/assets/img/plant/${entity.pl_image}" class="d-block w-100" alt="...">
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
	
	function onMouseEnter() {
		if($("#bookmark").attr('class') == 'bookmarkno')
			
	     	$("#bookmark").attr("src", $("#bookmark").attr("src").replace("empty","full"));
		else
			$("#bookmark").attr("src", $("#bookmark").attr("src").replace("full","empty"));
		
	}
	
	function onMouseLeave() {
		if($("#bookmark").attr('class') == 'bookmarkno')
	     	$("#bookmark").attr("src", $("#bookmark").attr("src").replace("full","empty"));
		else
			$("#bookmark").attr("src", $("#bookmark").attr("src").replace("empty","full"));	
	
	}

	// 즐겨찾기버튼에 마우스 올렸을시 hover 효과로 추가효과, 제거효과 만들기
	// cnt => db에서 즐겨찾기 조건 동일한 것의 개수

	let cnt = 0;
		
	$(document).ready(function() {

		isbookmarked();

		$(document).on('click', '#bookmark', function() {
			
			if('${user.u_id}' == ""){
				alert('즐겨찾기는 로그인 후 이용해주세요.');
				location.href= "${contextPath}/login/login";
				return;
				
			}

			var addUrl = "${contextPath}/bookmark/addbookmark";
			var removeUrl = "${contextPath}/bookmark/removebookmark";
			var paramData = {
				"ec_id" : '${disease.ec_id}',
				"u_id" : '${user.u_id}',
				"bm_name" : '${disease.di_id}'
			};


			if (cnt == 0) {

				$.ajax({
					url : addUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {

						isbookmarked();
						alert('즐겨찾기가 추가되었습니다. 마이페이지에서 목록을 확인할 수 있습니다.');

					},

					error : function(result) {
						alert('즐겨찾기실패')

					}

				});

			} else {

				$.ajax({
					url : removeUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {

						isbookmarked();
						alert('즐겨찾기가 해제되었습니다.');

					},
					error : function(result) {

						alert('즐겨찾기해제실패');

					}
				});

			}
			;

		}); // end of $(document).on('

	})

	function isbookmarked() {
			
		if('${user.u_id}'== "")
			return;

		var url = "${contextPath}/bookmark/isbookmarked";
		var paramData = {
			"u_id" : '${user.u_id}',
			"ec_id" : '${disease.ec_id}',
			"bm_name" : '${disease.di_id}'
		};
		$.ajax({
			url : url,// 전송주소 -> controller 매핑주소
			data : paramData,// 전송데이터, 요청데이터
			dataType : 'json',// 문서타입, 데이터타입
			type : 'POST',// 전송방식(POST/GET)
			success : function(result) {
				
				var htmls = ""; // 문서꾸미기

				if (result != 0) {
					htmls += '<img src="${contextPath}/resources/assets/img/icon/full.png" id="bookmark"';
					htmls += 'style="float:right; height:35px; cursor:pointer;" class="bookmarkyes" ';
					htmls += 'onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>';
				}else{
					htmls += '<img src="${contextPath}/resources/assets/img/icon/empty.png" id="bookmark"';
					htmls += 'style="float:right; height:35px; cursor:pointer;" class="bookmarkno" ';
					htmls += 'onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>';
				}
				
				$("#bookmark").replaceWith(htmls);

				cnt = result;
				
				
			},
			error : function(result) {
				alert('실패');
			}
		});

	}
		
	
	function delConfirm(di_id){
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
			$.ajax({
				url: "${contextPath}/admin/encyclopedia/disease/delete",
				data: {
					"di_id" : di_id
				},
				dataType: 'json',
				type: 'GET',
				success: function(result){
					alert('삭제되었습니다.');
					location.href='${contextPath}/encyclopedia/diseaseandpest';
				},
				error: function(result){
					alert('오류');
				}
				
			
			})
		   
		}
		else {
		   alert('삭제가 취소되었습니다.');
		}
	}		
		
</script>
</body>
</html>