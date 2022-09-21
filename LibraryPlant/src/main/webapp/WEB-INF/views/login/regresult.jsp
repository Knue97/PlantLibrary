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
    <!-- Login result -->
	<div class="container">
	    <div class="row justify-content-center ">
	        <div class="col">
	            <h1>${user}님 회원가입을 축하합니다.</h1><br>
	            <a href="/login/login">로그인화면으로 돌아가기</a>
	        </div>
	    </div>    
	</div>    
    <!-- /end login result -->
</main>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
</body>
</html>