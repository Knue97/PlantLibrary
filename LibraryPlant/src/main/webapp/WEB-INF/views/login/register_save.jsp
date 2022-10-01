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

	<main class="login-body"
		data-vide-bg="${contextPath}/resources/assets/img/forest.mp4">
		<!-- Login Admin -->
		<form class="form-default" action="${contextPath}/login/register"
			method="POST">

			<div class="login-form">
				<!-- logo-login -->
				<div class="logo-login">
					<a href="${contextPath }/"><img
						src="${contextPath}/resources/assets/img/logo/loder.png" alt=""></a>
				</div>
				<h2>회원가입</h2>
				<div class="form-input">
					<label for="ID">아이디</label> <input type="text" class="form-control"
						name="u_id" id="ID" placeholder="ID" required>
					<div class="check_font" id="id_check"></div>
				</div>
				<div class="form-input">
					<label for="password">비밀번호</label> <input type="password"
						name="u_password" id="password" placeholder="Password"> <label
						for="password2">비밀번호 확인</label> <input type="password" name="pwC"
						id="password2" placeholder="Confirm Password">
				</div>
				<input type="button" onclick="pwtest()" value="비밀번호확인">
				<div class="form-input">
					<label for="nickname">닉네임</label> <input type="text"
						name="u_nickname" id="nickname" placeholder="nickName">
				</div>

				<div class="form-input">
					<label for="name">이름</label> <input type="text" name="u_name"
						id="name" placeholder="Full name">
				</div>
				<div class="form-group email-form">
					<label for="email">이메일</label>
					<div class="input-group">
						<input type="text" name="u_email" id="email1" class="form-control">
						<select class="form-control" name="u_email" id="email2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select>
					</div>
				</div>
				<div class="input-group-addon">
					<input type="button" id="mail-Check-Btn" value="본인인증">
				</div>
				<div class="mail-check-box">
					<input class="form-control mail-check-input"
						placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				</div>
				<span id="mail-check-warn"></span>
			</div>
			<div class="form-input">
				<label for="address">주소</label> <input type="text" name="u_address"
					id="address" placeholder="ex)경기도 수원시">
			</div>
			<div class="form-input pt-30">
				<input type="submit" name="submit" value="회원가입">
			</div>
			<!-- Forget Password -->
			<a href="${contextPath}/" class="registration">메인으로</a>

		</form>
		<!-- /end login form -->
	</main>

	<!-- JS here -->
	<script type="text/javascript">
		function pwtest() {
			var p1 = document.getElementById('password').value;
			var p2 = document.getElementById('password2').value;
			if (p1 != p2) {
				alert("비밀번호가 일치 하지 않습니다");
				return false;
			} else {
				alert("비밀번호가 일치합니다");
				return true;
			}

		}
		$('#mail-Check-Btn')
				.click(
						function() {
							const eamil = $('#email1').val()
									+ $('#email2').val(); // 이메일 주소값 얻어오기!
							console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
							const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

							$
									.ajax({
										type : 'get',
										url : '<c:url value ="/login/register/mailCheck?email="/>'
												+ eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
										success : function(data) {
											console.log("data : " + data);
											checkInput.attr('disabled', false);
											code = data;
											alert('인증번호가 전송되었습니다.')
										}
									}); // end ajax
						}); // end send eamil
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(
				function() {
					const inputCode = $(this).val();
					const $resultMsg = $('#mail-check-warn');

					if (inputCode === code) {
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color', 'green');
						$('#mail-Check-Btn').attr('disabled', true);
						$('#eamil1').attr('readonly', true);
						$('#eamil2').attr('readonly', true);
						$('#email2').attr('onFocus',
								'this.initialSelect = this.selectedIndex');
						$('#email2').attr('onChange',
								'this.selectedIndex = this.initialSelect');
					} else {
						$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
						$resultMsg.css('color', 'red');
					}
				});
		// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$("#u_id")
				.blur(
						function() {
							// id = "id_reg" / name = "userId"
							var u_id = $('#u_id').val();
							$
									.ajax({
										url : '${pageContext.request.contextPath}/user/idCheck?userId='
												+ u_id,
										type : 'get',
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);

											if (data == 1) {
												// 1 : 아이디가 중복되는 문구
												$("#id_check").text(
														"사용중인 아이디입니다 :p");
												$("#id_check").css("color",
														"red");
												$("#reg_submit").attr(
														"disabled", true);
											} else {

												if (idJ.test(u_id)) {
													// 0 : 아이디 길이 / 문자열 검사
													$("#id_check").text("");
													$("#reg_submit").attr(
															"disabled", false);

												} else if (u_id == "") {

													$('#id_check').text(
															'아이디를 입력해주세요 :)');
													$('#id_check').css('color',
															'red');
													$("#reg_submit").attr(
															"disabled", true);

												} else {

													$('#id_check')
															.text(
																	"아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
													$('#id_check').css('color',
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
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>

</body>
</html>