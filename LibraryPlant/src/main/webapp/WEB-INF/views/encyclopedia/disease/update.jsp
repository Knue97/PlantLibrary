<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
.contact-us {

  padding: 50px 100px; }

label, input, textarea {
  display: block;
  width: 100%;
  font-size: 12pt;
  line-height: 24pt;
  font-family: "Spartan"; }

input {
  margin-bottom: 24pt; }

h3 {
  font-weight: normal;
  font-size: 10pt;
  line-height: 24pt;
  font-style: italic;
  margin: 0 0 .5em 0; }

span {
  font-size: 8pt; }

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
							병해백과 정보 추가
    <form method="post" enctype="multipart/form-data">
    
    	<p>병해명</p><input type="text" name="di_alias" value="${disease.di_alias }">
    	<p>원인</p><input type="text" name="di_cause" value="${disease.di_cause }">
    	<p>병징 및 표징</p><input type="text" name="di_symptomOfDisease" value="${disease.di_symptomOfDisease }">
    	<p>방제법</p><input type="text" name="di_biologicalControl" value="${disease.di_biologicalControl }">
    	<p>조심해야할 식물</p><input type="text" name="di_carefulPlant" value="${disease.di_carefulPlant }">
    	<p>상세설명</p><input type="text" name="di_descripton" value="${disease.di_descripton }">
    	
		<button class="fileAdd_btn" type="button">파일추가</button>
		<input type="file" multiple>
		<button type="submit">정보 등록하기</button>
		<input type="submit">
    </form>

<script>
	function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}

</script>
						
						
						
						
						


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