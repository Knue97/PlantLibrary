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
			      <h2>비밀번호 변경</h2><br>
					<form action="${contextPath }/user/mypage_updatepw" method="post">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" value="${user.u_id }" name="u_id" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" class="form-control"  name="u_password" id="password" >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">비밀번호 확인</label>
							<div class="col-sm-3">
								<input type="password" class="form-control"  id="password2" name="pwC">
							</div>
							<input type="button" onclick="pwtest()" value="비번확인">
						</div>
						<button type="submit">수정하기</button>
						<input type="button" onclick="location.href='${contextPath}/user/mypage'" value="취소">
					</form>
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
	<script type="text/javascript">
	    function pwtest() {
	        var p1 = document.getElementById('password').value;
	        var p2 = document.getElementById('password2').value;
	        if( p1 != p2 ) {
	          alert("비밀번호가 일치 하지 않습니다");
	          return false;
	        } else{
	          alert("비밀번호가 일치합니다");
	          return true;
	        }
	
	      }
	</script>
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
</body>
</html>