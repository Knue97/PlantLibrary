<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    
</head>
<body>
    <!-- ? Preloader Start -->
    <%@ include file="/WEB-INF/views/include/preloader.jsp" %>
    <!-- Preloader Start -->
            
<main class="login-body" data-vide-bg="${contextPath}/resources/assets/img/forest.mp4">
    <!-- Login Admin -->
    <form action="${contextPath }/login/findpage_ok" method="post" name="pfrm">
        
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="${contextPath }/"><img src="${contextPath}/resources/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>비번찾아보즈아</h2><br>
            <a style="color:pink">아이디 비밀번호를 입력하시오.<br>네이버,카카오 로그인은 찾기불가능.</a>
            <div class="form-input">
                <label for="name">아이디</label>
                <input  type="text" class="form-control" id="u_id" name="u_id" placeholder="ID">
                <div class="check_font" id="id_check"></div>
            </div>
            <div class="form-input">
                <label for="name">이메일</label>
                <input type="email" class="form-control" id="u_email" name="u_email" placeholder="Email">
                <div class="check_font" id="email_check"></div>
            </div>
            <div class="form-input pt-30">
                <input type="submit" id="submit" name="submit" value="뀨">
            </div>
           
            <a href="${contextPath }/login/login" class="forget">취소</a>
        </div>
    </form>
    <!-- /end login form -->
</main>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('submit').onclick = function() {
				
				if ( document.pfrm.u_id.value.trim()=='' ) {
					alert( 'ID를 입력해주세요' );
					return false;
				}
				if ( document.pfrm.u_email.value.trim()=='' ) {
					alert( '메일을 입력해주세요' );
					return false;
				}
				document.pfrm.submit();
			}
		}
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

											if (data == 0) {
												
												$("#id_check").text(
														"존재하지 않은 아이디입니다.");
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
		var idJ2 = /^[a-z0-9\@\.]{4,55}$/;
		$("#u_email").blur(function() {
							
							var u_email = $('#u_email').val();
							$.ajax({
										url : '${pageContext.request.contextPath}/user/emailCheck?u_email='
												+ u_email,
										type : 'get',									
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);

											if (data == 0) {
												
												$("#email_check").text(
														"존재하지 않은 이메일입니다.");
												$("#email_check").css("color",
														"red");
												$("#reg_submit").attr(
														"disabled", true);
											} else {

												if (idJ2.test(u_email)) {
													// 0 : 아이디 길이 / 문자열 검사
													$("#email_check").text("");
													$("#reg_submit").attr(
															"disabled", false);

												} else if (u_email == "") {

													$('#email_check').text(
															'이메일을 입력해주세요.');
													$('#email_check').css('color',
															'red');
													$("#reg_submit").attr(
															"disabled", true);

												} else {

													$('#email_check').text(
																	"이메일 소문자와 숫자 4~55자리만 가능합니다.");
													$('#email_check').css('color',
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