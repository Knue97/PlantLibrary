<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<style>

	*{
		font-family: 'IBM Plex Sans KR', sans-serif !important;
	}
	
	h5{
		font-weight: bold !important;
	}

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
    
    .scroll::-webkit-scrollbar{
    width: 6px;
	}

	.scroll::-webkit-scrollbar-thumb{
	
    height: 17%;
    background-color: rgba(33,133,133,1);
    border-radius: 10px;     
	}
	
	.scroll::-webkit-scrollbar-track{
    background-color: rgba(33,133,133,0.33);
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

                            <div style="overflow: hidden; height: 550px;" id="details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                	<c:if test="${fn:contains(disease.di_image,',')}">
										<c:forTokens var="img" items="${disease.di_image }" delims="," varStatus="status">
											<c:if test="${status.index == 0 }">
												<li class="active thumb" data-target="#details_slider" data-slide-to="0" style="background-image: url(${contextPath}/resources/assets/img/disease/${img });">
		                                    	</li>
											</c:if>
											<c:if test="${status.index != 0 }">
												<li class="thumb" data-target="#details_slider" data-slide-to="${status.index }" style="background-image: url(${contextPath}/resources/assets/img/disease/${img });">
		                                    	</li>											
											</c:if>
										</c:forTokens>            	
                                	</c:if>
                                </ol>
                                <div class="carousel-inner">
                                	<c:forTokens var="img" items="${disease.di_image }" delims="," varStatus="status">
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
                    
							<div class="col-12 col-md-5">
								<div class="scroll"style="overflow-y: scroll; height: 550px; padding-right: 35px;">
										<h2 style="font-weight: bold;">${disease.di_alias }<img src="${contextPath}/resources/assets/img/icon/empty.png" id="bookmark"
										style="float:right; height:35px;cursor:pointer;" class="bookmarkno" onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>
										</h2>
										
									<c:if test="${user != null}">
										<a href="${contextPath }/encyclopedia/modifyrequest?mr_name=${disease.di_id}&ec_id=${disease.ec_id}&name=${disease.di_alias}"
										style="color: black; float: right;">수정문의</a>
									</c:if>

									<div class="short_overview my-5">
										<h5 style="font-weight: bold;">원인</h5><p>${disease.di_cause }</p>
									</div>
									<div class="short_overview my-5">
										<h5 style="font-weight: bold;">병징 및 표징</h5><p>${disease.di_symptomOfDisease }</p>
									</div>
									<div class="short_overview my-5">
										<h5 style="font-weight: bold;">방제법</h5><p>${disease.di_biologicalControl }</p>
									</div>
									<div class="short_overview my-5">
										<h5 style="font-weight: bold;">조심해야할 식물</h5><p>${disease.di_carefulPlant }</p>
									</div>
									<div class="short_overview my-5">
										<h5 style="font-weight: bold;">상세설명</h5><p>${disease.di_descripton }</p>
									</div>
									
									
									<a href="${contextPath }/encyclopedia/disease/update?di_id=${disease.di_id }" style="color:black;"> 수정하기 </a>
									<a href="${contextPath }/encyclopedia/disease/delete?di_id=${disease.di_id }" style="color:black;"> 삭제하기 </a>
									
									
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
		
	
		
		
</script>

</body>
</html>