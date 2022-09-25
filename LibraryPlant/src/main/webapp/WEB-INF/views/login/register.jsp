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
    <form class="form-default" action="${contextPath}/login/register" method="POST">
        
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="/"><img src="${contextPath}/resources/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>Registration Here</h2>
			<div class="form-input">
                <label for="ID">ID</label>
                <input  type="text" name="u_id" id="ID" placeholder="ID">
            </div>
            <div class="form-input">
                <label for="nickname">NickName</label>
                <input  type="text" name="u_nickname" id="nickname" placeholder="nickName">
            </div>
            <div class="form-input">
                <label for="pwd">Password</label>
                <input  type="text" name="u_password" id="pwd" placeholder="Password">
            </div>
            <!-- 추후 기능 활성화
            <div class="form-input">
                <label for="name">Confirm Password</label>
                <input type="password" name="password" placeholder="Confirm Password">
            </div>
            -->
            <div class="form-input">
                <label for="name">Name</label>
                <input  type="text" name="u_name" id="name" placeholder="Full name">
            </div>
            <div class="form-input">
                <label for="email">Email Address</label>
                <input type="email" name="u_email" id="email" placeholder="Email Address">
            </div>            
            <div class="form-input pt-30">
                <input type="submit" name="submit" value="회원가입">
            </div>
            <!-- Forget Password -->
            <a href="#" class="registration">login</a>
        </div>
    </form>
    <!-- /end login form -->
</main>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
</body>
</html>