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
		  height: 500,                 // set editor height
		  width: 1100,					// set editor width
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  
		  toolbar: [
			  //	https://summernote.org/deep-dive/#custom-toolbar-popover 
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture', 'video']],
			    ['height', ['height']]
			  ]
		});
});
	
	function validate() {
		var titleCheck = document.titleCheck;
		
		if(!titleCheck.b_title.value){
			alert("제목을 입력하세요.");
			titleCheck.b_title.focus();
			return false;
		}
		return true;
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
                                 <span data-animation="fadeInDown" data-delay=".3s">Board Update 게시판 글수정</span>
                                    <h1 data-animation="fadeInDown" data-delay=".1s ">작성자 ${user.u_id}</h1>
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
				<div class="container">
						<div class="row px-xl-5">
				<form role="form" method="post" name="titleCheck" onsubmit="return validate();">
					<select name="bc_id">
						<c:choose>
							<c:when test="${board.bc_id == 1}">
									<option value="1" selected>자유게시판</option>
									<option value="2">Q&A게시판</option>
									<option value="3">자랑게시판</option>
									<option value="4">나눔게시판</option>
							</c:when>
							<c:when test="${board.bc_id == 2}">
									<option value="1">자유게시판</option>
									<option value="2"selected>Q&A게시판</option>
									<option value="3">자랑게시판</option>
									<option value="4">나눔게시판</option>
							</c:when>
							<c:when test="${board.bc_id == 3}">
									<option value="1">자유게시판</option>
									<option value="2">Q&A게시판</option>
									<option value="3"selected>자랑게시판</option>
									<option value="4">나눔게시판</option>
							</c:when>
							<c:when test="${board.bc_id == 4}">
									<option value="1">자유게시판</option>
									<option value="2">Q&A게시판</option>
									<option value="3">자랑게시판</option>
									<option value="4"selected>나눔게시판</option>
							</c:when>
						</c:choose>
					</select>

					<div class="box-body">
							<div class="form-group">
								<label>제목</label> <input type="text" name="b_title" rows="20"
									class="form-control" value="${board.b_title}" placeholder="(필수)제목을 입력하세요 50자 제한" maxlength="50" />
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea id="summernote" name="b_content" rows="10"
									class="form-control" placeholder="내용을 입력하세요" maxlength="1000">${board.b_content}</textarea>
									<p class="textTotal" align="right">글자수 제한 : 1000자</p>
							</div>
							<div class="form-group">
							<label>첨부파일</label> <input type="file" name="b_image"
								class="form-control" placeholder="파일 첨부" value="${board.b_image}">
							</div>
							<!-- 작성자 -->
							<input type="hidden" name="u_id" value="${user.u_id}">
							<!-- 수정에 사용할 글번호 -->
							<input type="hidden" name="b_no" value="${board.b_no }" />
						</div>

						<div class="box-footer" align="right">
						<input type="button" value="취소" onclick="history.back()">
						<input type="reset" value="초기화">
						<input type="submit" value="수정" >
						</div>
				</form>
</div></div>
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