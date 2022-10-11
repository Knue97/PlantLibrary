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
		<div class="slider-area slider-bg ">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height2">
				<div class="container">
				<c:if test="${user.api == 'naver'}">
					<h1>네이버 마이페이지</h1>
					<form>						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_nickname }" readonly="readonly">
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_name }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" value="${user.u_email }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_address }" readonly="readonly">
							</div>
						</div>
						<input type="button" onclick="location.href='${contextPath}/user/mypage_update'" value="주소변경/수정">
						
					</form>
				</c:if>
				<c:if test="${user.api == 'kakao'}">
					<h1>카카오 마이페이지</h1>
					<form>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_nickname }" readonly="readonly">
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_name }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" value="${user.u_email }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_address }" readonly="readonly">
							</div>
						</div>
						<input type="button" onclick="location.href='${contextPath}/user/mypage_update'" value="주소변경/수정">
						
					</form>
				</c:if>
				<c:if test="${user.api == 'none'}">
					<h2>마이페이지</h2><br>
					  <form>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_id }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_nickname }" readonly="readonly">
							</div>
						</div>
					
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_name }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" value="${user.u_email }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.u_address }" readonly="readonly">
							</div>
						</div>
						<input type="button" onclick="location.href='${contextPath}/user/mypage_update'" value="닉네임변경">
						<input type="button" onclick="location.href='${contextPath}/user/mypage_updatepw'" value="비빌번호변경">
					</form>
				</c:if>
					
				</div>
			</div>
			<!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">
				<img class="slider-shape1"
					src="${contextPath}/resources/assets/img/hero/top-left-shape.png"
					alt="">
			</div>
		</div>
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
</body>
</html>