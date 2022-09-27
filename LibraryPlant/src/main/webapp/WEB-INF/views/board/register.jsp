<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/plugin.jsp" %>
<%@ include file="../include/summernote.jsp" %>
</head>

<script>
$(document).ready(function(){
	$('#summernote').summernote({
		  height: 300,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true                  // set focus to editable area after initializing summernote
		});
});



function validate() {
		console.log("전송 확인하기 - 유효성 검사");

		var loginCheck = document.loginCheck;
		if(!loginCheck.u_id.value){
			alert("로그인이 필요합니다.");
			return false;
		}else{
		if(!loginCheck.b_title.value){
			alert("제목을 입력하세요");
			loginCheck.b_title.focus();
			return false;
		}
		return true;
	}
}
</script>
<body>
    <!-- ? Preloader Start -->
    <%@ include file="../include/preloader.jsp" %>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <%@ include file="../include/header.jsp"  %>
        <!-- Header End -->
    </header>
    <main>
    
    <!-- Slider Area Start-->
        <div class="slider-area white-bg ">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider d-flex align-items-center slider-height3 ">
                    <div class="container">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-xl-5 col-lg-5 col-md-9 ">
                                <div class="hero__caption text-center">
                                 <span data-animation="fadeInDown" data-delay=".3s">Board register 게시판 글쓰기</span>
                                    <h1 data-animation="fadeInDown" data-delay=".1s ">${user.u_nickname}</h1>
                                 </div>
                            </div>
                            
                        </div>
                    </div>
                </div>                           
            </div>
            <!-- Slider Shape -->
            
            <div class="slider-shape d-none d-lg-block">
                <img class="slider-shape1" src="${contextPath}/resources/assets/img/hero/top-left-shape.png" alt="">
            </div>
        </div>
        <!-- Slider Area End -->
    
        <section class="content container-fluid">

				
				<form role="form" method="post" enctype="multipart/form-data" name="loginCheck" onsubmit="return validate();">
				
					<select name="bc_id">
					<option value="1">자유게시판</option>
					<option value="2">Q&A게시판</option>
					<option value="3">자랑게시판</option>
					<option value="4">나눔게시판</option>
					</select>
										
					<div class="box-body">
						<div class="form-group">

							 <input type="text" name="b_title"
								class="single-textarea" placeholder="(필수)제목을 입력하세요 50자 제한" maxlength="50">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea id="summernote" name="b_content"
								placeholder="내용을 입력하세요" maxlength="1000"></textarea>
							<p class="textTotal" align="right">글자수 제한 : 1000자</p>
						</div>
						<div class="form-group">
							<label>첨부파일</label> <input type="file" name="files" multiple
								class="form-control" placeholder="파일 첨부">
						</div>

						<input type="hidden" name="u_id" value="${user.u_id}">
					</div>

					<div class="box-footer" align="right">
						<input type="button" value="취소" onclick="history.back()">
						<input type="reset" value="초기화">
						<input type="submit" value="작성완료">
					</div>
				</form>

			
		</section>
       
	</main>
<footer>
    <%@ include file="../include/footer.jsp" %>
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->

</body>
</html>