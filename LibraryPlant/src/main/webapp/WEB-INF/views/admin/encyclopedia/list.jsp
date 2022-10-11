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
		<div class="slider-area white-bg ">
			<div class="slider-active">
				<!-- Single Slider -->
				
				<div class="single-slider d-flex align-items-center slider-height2">
					<div class="container">
				<div class="row align-items-center justify-content-center">
				<div class="col-lg-9">
				<div class="hero__caption hero__caption3 text-center">
					<h1 data-animation="fadeInLeft" data-delay=".3s">백과 수정/삭제</h1>						
				</div>
				<div class="form-group col-md-6">
					<h4 style="color: #212542;">백과사전 카테고리를 선택하세요.</h4>
					<select onchange="if(this.value) location.href=(this.value);">
						<option selected value="">--- 항목선택 ---</option>
						<option value="${contextPath }/admin/encyclopedia/plant?num=1">식물</option>
						<option value="${contextPath }/admin/encyclopedia/disease?num=1">병해</option>
						<option value="${contextPath }/admin/encyclopedia/pest?num=1">해충</option>
					</select>
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
					location.reload();
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