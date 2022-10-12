<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
	h3{
		color: #212542;
	}
	
	.note-num {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 3;
    height: 25px;
    width: 25px;
    line-height: 20px;
    text-align: center;
    background-color: red;
    border-radius: 15px;
    display: inline-block;
    font-size: 15px;
    font-weight: bold;
	}
	
	
</style>
</head>
<body>
    <!-- ? Preloader Start -->
    <%@ include file="/WEB-INF/views/include/preloader.jsp" %>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <%@ include file="/WEB-INF/views/include/header.jsp"  %>
        <!-- Header End -->
    </header>
	<main>
		        <!-- Slider Area Start-->
        <div class="slider-area white-bg ">
 
                <!-- Single Slider -->
                 <div class="single-slider d-flex align-items-center slider-height">
                
                    <div class="container">
                    
                   <div class="single-slider d-flex align-items-center slider-height3" style="height:1140px;">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<span data-animation="fadeInLeft" data-delay=".3s">
									관리자 페이지</span>
								<h1 data-animation="fadeInLeft" data-delay=".6s ">
									Admin Page</h1>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/admin.png"
								alt="book" data-animation="fadeInRight" data-delay="1s">
						</div>
					</div>
					
					<div style="height:100px;"></div>
					<div class="row align-items-left justify-content-left">
						<h3>플라백과사전</h3>
					</div>
					<button class="genric-btn primary e-large" onclick="location.href='${contextPath }/admin/encyclopedia/register'">백과등록</button>
					<button class="genric-btn primary e-large" onclick="location.href='${contextPath }/admin/encyclopedia'">백과수정/삭제</button>
					<button style="position: relative;" class="genric-btn primary e-large" onclick="location.href='${contextPath }/admin/modifyrequest?num=1'">수정요청목록<span id="countmr"></span></button>
					<hr>
					<div class="row align-items-left justify-content-left">
						<h3>회원</h3>
					</div>
					<button class="genric-btn primary e-large" onclick="location.href='${contextPath}/admin/user?num=1'">회원관리</button>
					<button style="position: relative;" class="genric-btn primary e-large" onclick="location.href='${contextPath}/admin/report?num=1'">신고목록<span id="countrp"></span></button>
					<hr>
					<div class="row align-items-left justify-content-left">
						<h3>식물원</h3>
					</div>
					<button class="genric-btn primary e-large" onclick="location.href='${contextPath}/admin/botanicalgarden/register'">식물원 정보 등록</button>
					<button class="genric-btn primary e-large">식물원 정보 변경/삭제</button>
					<hr>
					<div class="row align-items-left justify-content-left">
						<h3>팝업창</h3>
					</div>
					<button class="genric-btn primary e-large">팝업창 등록</button>
					<button class="genric-btn primary e-large">팝업창 변경/삭제</button>
				</div>
				
			</div>
			
			            <!-- Slider Shape -->
			

			</div>
			
		<br><hr>

		<div class="row justify-content-center"></div>
		
     </div>
     </div>

     
		<div style="height:100px;"></div>


           
        <!-- Slider Area End -->
	</main>
<footer>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>

<script>
	$(document).ready(function(){
		
		$.ajax({
			
			url: "${contextPath}/admin/modifyrequest/count",
			type: 'GET',
			success: function(result){
				
				if(result != 0)
				$("#countmr").replaceWith('<span class="note-num" id="countmr">'+ result +'</span>');
				
			},
			error: function(result){
				alert('오류');
			}
			
		})
		
		
		$.ajax({
			
			url: "${contextPath}/admin/report/count",
			type: 'GET',
			success: function(result){
				
				if(result != 0)
				$("#countrp").replaceWith('<span class="note-num" id="countrp">'+ result +'</span>');
				
			},
			error: function(result){
				alert('오류');
			}
			
		})
		
	});
	
</script>​
</body>
</html>