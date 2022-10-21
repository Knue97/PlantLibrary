<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>

*{
	font-family: 'IBM Plex Sans KR', sans-serif !important;
}

.contact-us {

  padding: 50px 100px; }

label, input, textarea {
  display: block;
  width: 100%;
  line-height: 24pt;}

input {
  margin-bottom: 24pt; }

h3 {
  font-weight: normal;
  font-size: 10pt;
  line-height: 24pt;
  margin: 0 0 .5em 0; }

span {
  font-size: 10pt; }

em {
  color: #2e8b57;
  font-weight: bold; }

input, textarea {
  border: none;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 2px;

  padding-left: 5px;
  outline: none; }

input:focus, textarea:focus {
  border: 1px solid #6bd4b1; }

textarea {
  resize: none; }

button {
  display: block;
  float: right;
  line-height: 24pt;
  padding: 0 20px;
  border: none;
  background: #2e8b57;
  color: white;
  letter-spacing: 2px;
  transition: .2s all ease-in-out;
  border-bottom: 2px solid transparent;
  outline: none; }
  button:hover {
    background: inherit;
    color: #2e8b57;
    border-bottom: 2px solid #2e8b57; }

::selection {
  background: #87C7A4; }

input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
textarea:-webkit-autofill,
textarea:-webkit-autofill:hover,
textarea:-webkit-autofill:focus {
  border: 1px solid #6bd4b1;
  -webkit-text-fill-color: #2A293E;
  -webkit-box-shadow: 0 0 0px 1000px #f8f4e5 inset;
  transition: background-color 5000s ease-in-out 0s; }
</style>
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
		<!-- Slider Area Start-->
		<div class="slider-area white-bg ">
			<div class="slider-active">
				<!-- Single Slider -->
				
				<div class="single-slider d-flex align-items-center slider-height"
					>
					<div class="container">
				<br>
				<br>
				<br>
				<br>
				<br>
						<div class="contact-us">
						<h2>신고하기</h2>
							<form action="${contextPath }/board/reportPage" method="post" enctype="multipart/form-data">
								<h3>
									해당 글에 대한 신고페이지입니다.<br>
									처리결과에 대한 내용은 마이페이지 신고목록에서 확인 가능합니다.
								</h3>
								<%  
								    request.setCharacterEncoding("UTF-8");
									int b_no = Integer.parseInt(request.getParameter("b_no"));
								   	String report_user = request.getParameter("u_id");

								%>
								
								
								<input type="hidden" name="b_no" value=<%=b_no %>>
								
								<label for="u_id"> 아이디(닉네임) </label>
								<input value="${user.u_id }(${user.u_nickname })" type="text" readonly />
								
								<input type="hidden" id="u_id" name="u_id" value="${user.u_id }">
								<input type="hidden" id="report_user" name="report_user" value="<%=report_user %>">
								
								<%
								if(request.getParameter("c_no") == null){
								    String rc_content = request.getParameter("b_title");
								%>
								<label for="rc_content"> 내용 </label>
								<input id="rc_content" name="rc_content" value="<%=rc_content %>" type="text" readonly />
								<% }
									
								else{
									int c_no = Integer.parseInt(request.getParameter("c_no"));
									String rc_content = request.getParameter("c_content");
									
								%>
								   
								<input type="hidden" name="c_no" value=<%=c_no %>>

								<label for="rc_content"> 내용 </label>
								<input id="rc_content" name="rc_content" value="<%=rc_content %>" type="text" readonly />
								
								<% } %>
								 
								<label for="r_file">파일첨부</label>
								<input id="r_file" name="file" type="file" />
									
								<label for="r_content"> 신고 사유 작성 <em>&#x2a;</em> </label>
								<textarea id="r_content" name="r_content" required rows="4" maxlength="3000"></textarea>
								<br>
								<a href="detail?b_no=<%=b_no %>">뒤로가기</a>
								<button type="submit">신고하기</button>
							</form>
						</div>


					</div>
				</div>
			</div>
			<!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">

			</div>
		</div>
		<!-- Slider Area End -->
	</main>
	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
	<%@ include file="/WEB-INF/views/include/plugin.jsp"%>
</body>
</html>