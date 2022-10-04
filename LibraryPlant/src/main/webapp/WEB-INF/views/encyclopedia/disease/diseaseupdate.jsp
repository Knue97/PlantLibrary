<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<!-- Slider Area Start-->
		<div class="slider-area slider-bg">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<span data-animation="fadeInLeft" data-delay=".3s"><h1>백과수정</h1></span>								
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">                                               
                        	<img class="img-fluid" src="${contextPath}/resources/assets/img/icon/writing.png" alt="book" data-animation="fadeInRight" data-delay="1s">                        	                                   
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
		<div class="container">
			<form action="${pageContext.request.contextPath}/encyclopedia/disease/update" method="post" enctype="multipart/form-data">
			<div class="form-row">
				<div class="form-group col-12">
					<h2>병해 정보 수정</h2>
				</div>
		
				<input type="hidden" name="di_id" value="${disease.di_id }">
				<input type="hidden" name="ec_id" value="20">
				<div class="form-group col-md-6">
					<label for="alias">병해명</label> <input type="text"
					class="form-control" id="di_alias" placeholder="병해명"
					name="di_alias" value="${disease.di_alias }" required>
				</div>
				<div class="form-group">
					<label for="cause">원인</label>
					<textarea class="form-control" id="di_cause" rows="5" cols="150"
						name="di_cause">${disease.di_cause }</textarea>
				</div>
				<div class="form-group">
					<label for="symptomOfDisease">병징 및 표징</label>
					<textarea class="form-control" id="di_symptomOfDisease" rows="5" cols="150"
						name="di_symptomOfDisease">${disease.di_symptomOfDisease }</textarea>
				</div>
				<div class="form-group">
					<label for="biologicalControl">방제법</label>
					<textarea class="form-control" id="di_biologicalControl" rows="5" cols="150"
						name="di_biologicalControl">${disease.di_biologicalControl }</textarea>
				</div>
				
				<div class="form-group col-md-12">
					<label for="carefulPlant">조심해야할 식물</label> <input type="text"
						class="form-control" id="di_carefulPlant"
						name="di_carefulPlant" value="${disease.di_carefulPlant }">
				</div>
				
				<div class="form-group">
					<label for="descripton">상세설명</label>
					<textarea class="form-control" id="di_descripton" rows="5" cols="150"
						name="di_descripton">${disease.di_descripton }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="image">이미지</label> <input type="file"
					class="form-control-file" name="file" multiple onchange="readURL(this);">
					<div id="preview">
						<c:forTokens var="img" items="${disease.di_image }" delims="," varStatus="status">
							<img src="${contextPath }/resources/assets/img/disease/${img }" style="height:75px;">
						</c:forTokens>
					</div>
					<input type="hidden" name="originalimg" value="${disease.di_image }">
			</div>
			<button type="submit" class="btn btn-primary">백과 등록하기</button>
		</form>

		</div>
	</main>
	<div style="height:100px;"></div>

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

function readURL(input) {
	
	$("#preview").replaceWith("<div id='preview'></div>");
	
	for(var i=0; i<input.files.length; i++){
		
		if(input.files && input.files[i]){
			var reader = new FileReader();
			
			
			reader.onload = function(e) {

				$("#preview").append('<img style="height:75px; margin-right: 5px; margin-top: 5px;"' + 'src="' + e.target.result + '"/>');
				
			}
			reader.readAsDataURL(input.files[i]);
			
		}

	}
	
	
}
</script>	

</body>
</html>
