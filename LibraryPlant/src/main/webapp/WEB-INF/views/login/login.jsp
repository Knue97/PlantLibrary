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
    <form class="form-default" action="login" method="POST">
        
        <div class="login-form">
            <!-- logo-login -->
            <div class="logo-login">
                <a href="index.html"><img src="${contextPath}/resources/assets/img/logo/loder.png" alt=""></a>
            </div>
            <h2>Login Here</h2>
            <div class="form-input">
                <label for="name">ID</label>
                <input  type="text" name="u_id" placeholder="ID">
            </div>
            <div class="form-input">
                <label for="name">Password</label>
                <input type="password" name="u_password" placeholder="Password">
            </div>
            <div class="form-input pt-30">
                <input type="submit" name="submit" value="login">
            </div>
            
            <!-- Forget Password -->
            <a href="#" class="forget">Forget Password</a>
            <!-- Forget Password -->
            <a href="register.html" class="registration">Registration</a>
        </div>
    </form>
    <!-- /end login form -->
</main>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
</body>
</html>