<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>

    .thumb {
      margin: 0;
      padding: 30px 50px 30px 50px;
      list-style: none;
      background-position: center;
      background-repeat: no-repeat;
      background-size: 150px;
    }
    
    .slide-image{
	    height: 550px;
	    background-size: cover; 
	    background-position: center; 
	    background-repeat: no-repeat;
    }

</style>
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
		<div class="slider-area white-bg ">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider d-flex align-items-center slider-height2 ">
					<div class="container">
						<div style="height:150px;"></div>
						<div class="row">
						<div class="col-12 col-md-7" style="height:550px;">
                        <div class="single_product_thumb">
                            <div style="overflow: hidden; height: 550px;" id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                	<c:if test="${fn:contains(pest.pe_image,',')}">
										<c:forTokens var="img" items="${pest.pe_image }" delims="," varStatus="status">
											<c:if test="${status.index == 0 }">
												<li class="active thumb" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(${contextPath}/resources/assets/img/disease/${img });">
		                                    	</li>
											</c:if>
											<c:if test="${status.index != 0 }">
												<li class="thumb" data-target="#product_details_slider" data-slide-to="${status.index }" style="background-image: url(${contextPath}/resources/assets/img/disease/${img });">
		                                    	</li>											
											</c:if>
										</c:forTokens>                                	
                                	</c:if>
                                </ol>
                                <div class="carousel-inner">
                                	<c:forTokens var="img" items="${pest.pe_image }" delims="," varStatus="status">
                                		<c:if test="${status.index == 0 }">
                                			<div class="carousel-item slide-image active" onclick = "location.href='${contextPath}/resources/assets/img/disease/${img }';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/disease/${img });" >
		                                        <a class="gallery_img" href="${contextPath}/resources/assets/img/disease/${img}"></a>
		                                    </div>
                                		</c:if>
                                		<c:if test="${status.index != 0 }">
                                			<div class="carousel-item slide-image" onclick = "location.href='${contextPath}/resources/assets/img/disease/${img }';" style="cursor: pointer; background-image: url(${contextPath}/resources/assets/img/disease/${img });" >
		                                        <a class="gallery_img" href="${contextPath}/resources/assets/img/disease/${img}"></a>
		                                    </div>
                                		</c:if>
                                	</c:forTokens>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-1"></div>
                    
							<div class="col-12 col-md-4">
								<div class="single_product_desc">
									<!-- Product Meta Data -->
									<div class="product-meta-data">
										<div class="line"></div>

											<h2>${pest.pe_name } <a id="bookmark"
										class="fa fa-star" aria-hidden="true" style="color: #73e35c" href="#!bookmark"></a>
											</h2>

										<!-- Ratings & Review -->
										<div
											class="ratings-review mb-15 d-flex align-items-center justify-content-between">
										</div>
									</div>

									<div class="short_overview my-5">
										<p>원인 : ${pest.pe_cause }</p>
									</div>
									<div class="short_overview my-5">
										<p>확인방법 : ${pest.pe_method }</p>
									</div>
									<div class="short_overview my-5">
										<p>방제법 : ${pest.pe_biologicalControl }</p>
									</div>
									<div class="short_overview my-5">
										<p>천적 : ${pest.pe_naturalEnemy }</p>
									</div>
									<div class="short_overview my-5">
										<p>조심해야할 식물 : ${pest.pe_carefulPlant }</p>
									</div>
									<div class="short_overview my-5">
										<p>상세설명 : ${pest.pe_description }</p>
									</div>
									

									<c:if test="${user != null}">
										<a href="${contextPath }/encyclopedia/modifyrequest?mr_name=${pest.pe_name}"
										style="color: black;">수정문의</a>
									</c:if>
									
									 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">

			</div>
		</div>
		<!-- Slider Area End -->
	<div style="height:100px;"></div>
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

<script>

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
				"ec_id" : '${pest.ec_id}',
				"u_id" : '${user.u_id}',
				"bm_name" : '${pest.pe_id}'
			};

			console.log(cnt + "여기");

			if (cnt == 0) {
				console.log("addbookmark 시작");
				$.ajax({
					url : addUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {

						alert('즐찾추가완료');
						isbookmarked();

					},

					error : function(result) {
						alert('어즐찾실패')

					}

				});

			} else {
				console.log("removebookmark 시작");
				$.ajax({
					url : removeUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {

						alert('즐찾추가해제완료');
						isbookmarked();

					},
					error : function(result) {

						alert('즐찾해제실패');

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
			"ec_id" : '${pest.ec_id}',
			"bm_name" : '${pest.pe_id}'
		};
		$.ajax({
			url : url,// 전송주소 -> controller 매핑주소
			data : paramData,// 전송데이터, 요청데이터
			dataType : 'json',// 문서타입, 데이터타입
			type : 'POST',// 전송방식(POST/GET)
			success : function(result) {
				
				var htmls = ""; // 문서꾸미기

				if (result == 0) {
					htmls += '즐겨찾기추가';
				} else {
					htmls += '즐겨찾기해제~';
				}

				$("#bookmark").html(htmls); // 댓글위치에 html로 보여주기

				cnt = result;

				console.log(cnt + "isbookmarked");
			},
			error : function(result) {
				alert('실패');
			}
		});

	}
		
		
</script>

</body>
</html>