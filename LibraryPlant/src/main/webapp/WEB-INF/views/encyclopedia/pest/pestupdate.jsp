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
			<form action="${pageContext.request.contextPath}/encyclopedia/pest/update" method="post" enctype="multipart/form-data">
			<div class="form-row">
				<div class="form-group col-12">
					<h2>해충 정보 수정</h2>
				</div>
		
				<input type="hidden" name="pe_id" value="${pest.pe_id }">
				<input type="hidden" name="ec_id" value="30">
				<div class="form-group col-md-6">
					<label for="name">해충명</label> <input type="text"
						class="form-control" id="pe_name" placeholder="해충명"
						name="pe_name" value="${pest.pe_name }" required>
				</div>
				<div class="form-group">
					<label for="cause">원인</label>
					<textarea class="form-control" id="pe_cause" rows="5" cols="150"
						name="pe_cause">${pest.pe_cause }</textarea>
				</div>
				<div class="form-group">
					<label for="method">확인 방법</label>
					<textarea class="form-control" id="pe_method" rows="5" cols="150"
						name="pe_method">${pest.pe_method }</textarea>
				</div>
				<div class="form-group">
					<label for="biologicalControl">방제법</label>
					<textarea class="form-control" id="pe_biologicalControl" rows="5" cols="150"
						name="pe_biologicalControl">${pest.pe_biologicalControl }</textarea>
				</div>
				<div class="form-group">
					<label for="naturalEnemy">천적</label>
					<textarea class="form-control" id="pe_naturalEnemy" rows="5" cols="150"
						name="pe_naturalEnemy">${pest.pe_naturalEnemy }</textarea>
				</div>
				
				<div class="form-group col-md-12">
					<label for="carefulPlant">조심해야할 식물</label> <input type="text"
						class="form-control" id="pe_carefulPlant"
						name="pe_carefulPlant" value="${pest.pe_carefulPlant }">
				</div>
				
				<div class="form-group">
					<label for="description">상세설명</label>
					<textarea class="form-control" id="pe_description" rows="5" cols="150"
						name="pe_description">${pest.pe_description }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="image">이미지</label> <input type="file"
					class="form-control-file" name="file" multiple onchange="readURL(this);">
					<div id="preview">
						<c:forTokens var="img" items="${pest.pe_image }" delims="," varStatus="status">
							<img src="${contextPath }/resources/assets/img/pest/${img }" style="height:75px;">
						</c:forTokens>
					</div>
					<input type="hidden" name="originalimg" value="${pest.pe_image }">
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
