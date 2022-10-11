<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
</head>
<body>
	<!-- ? Preloader Start -->
	<%@ include file="/WEB-INF/views/include/preloader.jsp"%>
	<!-- Preloader Start -->

	<main class="login-body"
		data-vide-bg="${contextPath}/resources/assets/img/forest.mp4">
		<!-- Login Admin -->
		<form class="form-default" action="${contextPath}/login/register"
			method="POST" name="pfrm">

			<div class="login-form">
				<!-- logo-login -->
				<div class="logo-login">
					<a href="${contextPath }/"><img
						src="${contextPath}/resources/assets/img/logo/loder.png" alt=""></a>
				</div>
				<h1>회원가입</h1><br>
				<h1>회원가입</h1><br>
				<h1>회원가입</h1><br>
				<h2>회원가입</h2>
				<div class="form-input">
					<label for="ID">아이디</label> <input type="text" class="form-control"
						name="u_id" id="u_id" placeholder="ID" required>
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
					<label for="nickname">닉네임</label> <input type="text" class="form-control"
						name="u_nickname" id="u_nickname" placeholder="nickName">
					<div class="check_font" id="nickname_check"></div>
				</div>

				<div class="form-input">
					<label for="name">이름</label> <input type="text" name="u_name"
						id="name" placeholder="Full name">
				</div>
				<div class="form-input email-form">
					<label for="email">이메일</label>
					<div class="input-group">
						<input type="text" name="email" id="email1" class="form-control" placeholder="Email">
						<select class="form-control" id="email2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							<option>@yahoo.co.kr</option>
						</select>
						<input type="hidden" name="u_email" id="real-email">
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
			<div class="form-input">
				<h5 style="color:white">주소</h5>
				<input type="button" onclick="sample4_execDaumPostcode()" value="✩✡✩우편번호 찾기✩✡✩"><br>
				<input type="text" name="u_address" id="sample4_postcode" placeholder="우편번호">
				<input type="text" name="u_address" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" name="u_address" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" name="u_address" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" name="u_address" id="sample4_extraAddress" placeholder="참고항목">
			</div>
			<div class="form-input pt-30">
				<input type="submit" name="submit" value="회원가입" id="submit">
				<input type="button" onclick="location.href='${contextPath}/'" value="취소">
			</div>
			</div>
		</form>
		<!-- /end login form -->
	</main>

	<!-- JS here -->
	<script type="text/javascript">
	window.onload = function() {
		document.getElementById('submit').onclick = function() {
			
			if ( document.pfrm.u_id.value.trim()=='' ) {
				alert( '아이디를 입력해주세요' );
				return false;
			}
			if ( document.pfrm.u_nickname.value.trim()=='' ) {
				alert( '닉네임을 입력해주세요' );
				return false;
			}
			if ( document.pfrm.u_name.value.trim()=='' ) {
				alert( '이름을 입력해주세요' );
				return false;
			}
			if ( document.pfrm.email.value.trim()=='' ) {
				alert( '이메일을 입력해주세요' );
				return false;
			}
			document.pfrm.submit();
		}
	}
	
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
	$('#mail-Check-Btn').click(function() {
						const email = $('#email1').val()
								+ $('#email2').val(); // 이메일 주소값 얻어오기!
						console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
						const checkInput = $('.mail-check-input') // 인증번호 입력하는곳
						$("#real-email").val(email);

						$.ajax({
									type : 'get',
									url : '<c:url value ="/login/register/mailCheck?email="/>'
											+ email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
									success : function(data) {
										console.log("data : " + data);
										checkInput.attr('disabled', false);
										code = data;
										alert('인증번호가 전송되었습니다.')
									}
								}); // end ajax
					}); // end send email
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function() {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');

				if (inputCode === code) {
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					$('#mail-Check-Btn').attr('disabled', true);
					$('#email1').attr('readonly', true);
					$('#email2').attr('readonly', true);
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
	var idJ = /^[a-z0-9]{4,12}$/;
	$("#u_id").blur(function() {
						// id = "id_reg" / name = "userId"
						var u_id = $('#u_id').val();
						$.ajax({
									url : '${pageContext.request.contextPath}/user/idCheck?u_id='
											+ u_id,
									type : 'get',									
									success : function(data) {
										console.log("1 = 중복o / 0 = 중복x : "
												+ data);

										if (data == 1) {
											// 1 : 아이디가 중복되는 문구
											$("#id_check").text(
													"이미 사용중인 아이디입니다.");
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
														'아이디를 입력해주세요.');
												$('#id_check').css('color',
														'red');
												$("#reg_submit").attr(
														"disabled", true);

											} else {

												$('#id_check').text(
																"아이디는 소문자와 숫자 4~12자리만 가능합니다.");
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
	
	 function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>

</body>
</html>