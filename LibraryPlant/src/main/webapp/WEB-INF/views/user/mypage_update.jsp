<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
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
			      <h2>닉네임 변경</h2><br>
					<form action="${contextPath }/user/mypage_update" method="post">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">ID</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" value="${user.u_id }" name="u_id" readonly="readonly">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-3">
								<input type="text" class="form-control"  name="u_nickname" id="u_nickname" placeholder="변경하실 닉네임(2~6자)">
								<div class="check_font" id="nickname_check"></div>
							</div>
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
	var idJ2 = /^[a-z0-9가-힣]{2,6}$/;
	$("#u_nickname").blur(function() {		
		var u_nickname = $('#u_nickname').val();
		$.ajax({
					url : '${pageContext.request.contextPath}/user/nicknameCheck?u_nickname='
							+ u_nickname,
					type : 'get',
					success : function(data) {
						console.log("1 = 중복o / 0 = 중복x : "
								+ data);

						if (data != 0) {
							
							$("#nickname_check").text(
									"이미 사용중인 닉네임입니다.");
							$("#nickname_check").css("color",
									"red");
							$("#reg_submit").attr(
									"disabled", true);
						} else {

							if (idJ2.test(u_nickname)) {
								// 0 : 닉네임 길이 / 문자열 검사
								$("#nickname_check").text("");
								$("#reg_submit").attr(
										"disabled", false);

							} else if (u_nickname == "") {

								$('#nickname_check').text(
										'닉네임을 입력해주세요.');
								$('#nickname_check').css('color',
										'red');
								$("#reg_submit").attr(
										"disabled", true);

							} else {

								$('#nickname_check').text(
												"2~6자만 가능");
								$('#nickname_check').css('color',
										'red');
								$("#reg_submit").attr(
										"disabled", true);
							}

						}
					},
					error : function() {
						console.log("실패");
					}
				});
	});
	</script>
	
</body>
</html>