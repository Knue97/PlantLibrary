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
					<label for="ID">아이디</label> 
					<input type="text" name="u_id" id="ID" placeholder="ID">
				</div>
				<div class="form-input">
					<label for="password">비밀번호</label> 
					<input type="password" name="u_password" id="password" placeholder="Password">				
               		<label for="password2">비밀번호 확인</label>
               		<input type="password" name="pwC" id="password2" placeholder="Confirm Password">
           		</div>
               		<input type="button" onclick="pwtest()" value="비밀번호확인">
				<div class="form-input">
					<label for="nickname">닉네임</label> <input type="text"
						name="u_nickname" id="nickname" placeholder="nickName">
				</div>				
           		            
				<div class="form-input">
					<label for="name">이름</label> 
					<input type="text" name="u_name" id="name" placeholder="Full name">
				</div>
				<div class="form-input">
					<label for="email">이메일</label> 
					<input type="text" name="u_email" id="email" class="form-control"> 
						<select class="form-control" name="u_email" id="email">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
						<option>@yahoo.co.kr</option>
					</select>
				</div>
				<div class="form-input">
					<label for="address">주소</label> 
					<input type="text" name="u_address" id="address" placeholder="ex)경기도 수원시">
				</div>				
			<div class="form-input pt-30">
				<input type="submit" name="submit" value="회원가입">
			</div>
			<!-- Forget Password -->
			<a href="${contextPath}/" class="registration">메인으로</a>
			</div>
		</form>
		<!-- /end login form -->
	</main>

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