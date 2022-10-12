<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
<%@ include file="/WEB-INF/views/include/summernote.jsp" %>
</head>

<script>
$(document).ready(function(){
	$('#summernote').summernote({
		  height: 500,                 // set editor height
		  width: 1100,					// set editor width
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  placeholder: '내용을 입력하세요.',
		  
		  toolbar: [
			  //	https://summernote.org/deep-dive/#custom-toolbar-popover 
			    // [groupName, [list of button]]
			  	['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline', 'clear', 'strikethrough', 'superscript', 'subscript']],
			    ['color', ['forecolor','backcolor']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture', 'video']],
			    ['height', ['height']]
			  ],
			  
			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		      callbacks: {
		    	  onImageUpload : function(files, editor, welEditable){
		        	
		        	 console.log("files 받음 :" + files);
		           // 파일 업로드(다중업로드를 위해 반복문 사용)
		            for (var i = files.length - 1; i >= 0; i--) {
		            	uploadSummernoteImageFile(files[i], this);
            		}
		          }
		      } 
		});
	$(".note-group-image-url").remove();}); // 이미지 url 제거


function uploadSummernoteImageFile(file, el) {
	
	data = new FormData();
	data.append("file", file);
	console.log("데이터 = " +data + "파일 =" + file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("사진 업로드 : "+file);
			$(el).summernote('editor.insertImage', data.url);
		},
		error : function(data){
			alert('사진 업로드를 실패하였습니다.');
		}
	});
}



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

			<div class="container">
				
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
								placeholder="내용을 입력하세요" maxlength="10000"></textarea>
							<p class="textTotal" align="right">글자수 제한 : 10000자</p>
						</div>
						

						<input type="hidden" name="u_id" value="${user.u_id}">
					</div>

					<div class="box-footer" align="right">
						<input type="button" value="취소" onclick="history.back()">
						<input type="reset" value="초기화">
						<input type="submit" value="작성완료">
					</div>
				</form>

			</div>
		</section>
       
	</main>
<footer>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </footer>
  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->

</body>
</html>