<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/plugin.jsp" %>
    
</head>

<script>
//	ajax 실행
$(document).ready(function(){

	replyListAll();
})
	
	

//	전체목록
function replyListAll() {
	console.log("replyListAll AJAX 실행");
		var url = "${contextPath}/board/replyListAll";
		var paramData = {
				"b_no" : '${board.b_no}'
		};
		
	$.ajax({
		url : url,
		data : paramData,
		dataType : 'json',
		type : 'post',
		success : function(result) {
			//alert("성공");
			//alert("result");
			var htmls = "";
			if(result.length < 1) {
				htmls += '<h3>댓글이 없습니다.</h3>';
			} else{
				$(result).each(function(){ // 요소별로 하나씩 실행하라
					
					
					htmls = htmls + '<div class="" id="c_no' +this.c_no + '">';
                    //<div id="reno12"> <div id="reno13">
					htmls += '<span class="d-block">';
					htmls += this.c_no + ' - ';
					htmls += '<strong class="text-gray-dark">' + this.u_id + '</strong>';
					htmls += ' ' + this.c_regdate + ' ';
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';
					if('${user.u_id}'== this.u_id){
					htmls += '<a href="javascript:void(0)" onclick="replyUpdateForm(' + this.c_no + ', \'' + this.u_id + '\', \'' + this.c_content + '\' )" style="padding-right:5px">수정</a>';
					htmls += '<a href="javascript:void(0)" onclick="replyAlarm(' + this.c_no + ')" >삭제</a>';
					}
					htmls += '</span>';
					htmls += '</span><br>';
					htmls += this.c_content;
					htmls += '</p>';
					htmls += '</div>';  

				})
			}
		$("#replyListAll").html(htmls); // 댓글 위치에 html로 보여주기   ,  #replylist는 선택자 ->아래 div id="replylist"에 해당
		},
		error : function(result){
			alert("실패");
		}
		
	}); // end of ajax
	
} // end of replyListAll




//	댓글 작성

	$(document).on('click', '#replyRegister', function(){	// 문서에서 이벤트 발생 이벤트는 클릭이고 대상은 #btnReplySave
		var c_content = $("#c_content").val().trim();
	console.log(c_content);
	
		var u_id = $("#u_id").val();
		
		var url = "${contextPath}/board/reply";
		var paramData = {
				"u_id" : u_id,
				"c_content" : c_content,
				"b_no" : '${board.b_no}'
		}; //추가 데이터 작성
		
		
		$.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'POST',
			success : function(result){
				if(result ==2 ){
					alert("댓글을 입력하세요.");
					$("#c_content").focus();
				}else{
				replyListAll();
				$("#c_content").val(''); // value 값을 ' ' 공백 처리
				$("#u_id").val('${user.u_id}');
				}
			},
			error : function(result){
				alert('에러 발생');
			}
			
		}); // ajax end
		
	}); // end of $(#replyRegister').on


//	댓글 수정 폼


function replyUpdateForm(c_no, u_id, c_content){

		var htmls = "";
		
		htmls = htmls + '<div class="" id="c_no' +c_no + '">';
        //<div id="reno12"> <div id="reno13">
		htmls += '<span class="d-block">';
		htmls += c_no + ' - ';
		htmls += '<strong class="text-gray-dark">' + u_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="replyUpdate(' + c_no + ', \'' + u_id + '\' )" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="replyListAll()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '<textarea id="editmemo" name="editmemo" rows="3">';
		htmls += c_content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';  
		
		//선택한 요소를 다른것으로 바꾼다(변경)
		$('#c_no' + c_no).replaceWith(htmls);
		$('#c_no' + c_no + '#editmemo').focus();
		
	} // end of replyUpdate
	
//	댓글 수정
	function replyUpdate(c_no, u_id) {
		
		var editmemo = $('#editmemo').val().trim();
		var url = "${contextPath}/board/replyUpdate";
		var paramData = {
			"c_no" : c_no,
			"u_id" : u_id,
			"c_content" : editmemo
		};
		
		
		$.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'post',
			success : function(result) {
				console.log(result);
				replyListAll();
			},
			error : function(result) {
				console.log(result);
				alert('**수정 실패**');
			}
			
		}); // end of $.ajax
	}// end of replyUpdate()

	
//	댓글 삭제
//	1) 삭제 확인창
	function replyAlarm(c_no) {
		var msg = "해당 댓글을 삭제하시겠습니까?";
		if (confirm(msg)) {
			replyDelete(c_no);
			return false;
		}
		return true;
	}
//	2) 확인 후 삭제 처리
	function replyDelete(c_no) {
		url = "${contextPath}/board/replyDelete";
		paramData = {
			"c_no" : c_no
		};

		$.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'post',
			success : function(result) {
				console.log(result);
				alert("댓글이 삭제되었습니다.");
				replyListAll();
			},
			error : function(result) {
				console.log(result);
				alert('**삭제 실패**');
			}

		}); // end of $.ajax
	}

//	게시글 삭제 확인창
	function alarm() {
		var msg = "해당 글을 삭제하시겠습니까?";
		if (confirm(msg)) {
			location.href = 'delete?b_no=${board.b_no}';
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
                                 <span data-animation="fadeInDown" data-delay=".3s">작성자 : ${board.u_id}</span>
                                    <h1 data-animation="fadeInDown" data-delay=".1s ">${board.b_title}</h1>
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
				<h3 align="right">
				<c:if test="${board.bc_id == 1}">자유 게시판</c:if>
				<c:if test="${board.bc_id == 2}">질문 게시판</c:if>
				<c:if test="${board.bc_id == 3}">자랑 게시판</c:if>
				<c:if test="${board.bc_id == 4}">나눔 게시판</c:if>
				</h3>
				<h5 class="mb-30" align="right">${board.b_regdate}</h5>


				<div class="box-body">

				<div class="form-group">
					<h1 align="center">본문은 여기↓</h1>
					<p></p>

					<div class="container">
						<div class="row px-xl-5">
						<c:if test="${board.b_image != null}">
							<div class="col-lg-5 pb-5">
								<div id="product-carousel" class="carousel slide"
									data-ride="carousel">
									<div class="carousel-inner border">
										<div class="carousel-item active">
											<img class="w-100 h-100"
												src="${contextPath}/resources/assets/img/sample/bono.png"
												alt="">
										</div>
										<div class="carousel-item">
											<img class="w-100 h-100"
												src="${contextPath}/resources/assets/img/sample/12.jpg"
												alt="">
										</div>
										
									</div>
									<a class="carousel-control-prev" href="#product-carousel"
										data-slide="prev"> <i
										class="fa fa-2x fa-angle-left text-dark"></i>
									</a> <a class="carousel-control-next" href="#product-carousel"
										data-slide="next"> <i
										class="fa fa-2x fa-angle-right text-dark"></i>
									</a>
								</div>
							</div>
							</c:if>


							<div class="col-lg-7 pb-5">
								<div class="quote-wrapper">
									<p class="mb-4">${board.b_content}</p>
								</div>
							</div>


						</div>
					</div>
					
					
		<div class="box-footer" align="right">
			<input type="button" value="메인" onclick="location.href='${contextPath}'">
			
			<c:if test="${user.u_id == board.u_id}">
			<input type="button" value="수정" name="loginCheck" onclick="location.href='update?b_no=${board.b_no}'">
			<input type="button" value="삭제" onclick="return alarm();">
			</c:if>
						
			<c:choose>
				<c:when test="${board.bc_id == 1}">
					<input type="button" value="목록" onclick="location.href='freeListAll'">
				</c:when>
				<c:when test="${board.bc_id == 2}">
					<input type="button" value="목록" onclick="location.href='qnaListAll'">
				</c:when>
				<c:when test="${board.bc_id == 3}">
					<input type="button" value="목록" onclick="location.href='showListAll'">
				</c:when>
				<c:when test="${board.bc_id == 4}">
					<input type="button" value="목록" onclick="location.href='shareListAll'">
				</c:when>
				<c:otherwise><input type="button" value="메인" onclick="location.href='${contextPath}'"> </c:otherwise>
			</c:choose>
		</div>
					


				</div>
			</div>


			<!-- 나눔게시판 한정 작성자 및 나눔 관련 정보 -->
			<c:if test="${board.bc_id == 4 }">

				<%@include file="option/shareInfo.jsp"%>

			</c:if>
			<!--/ 나눔게시판 한정 작성자 및 나눔 관련 정보 -->




			<hr><p></p>
			<div>
			<div class="box-body">


				<table>
					<tr>
						<td rowspan="2" width="70%">
						<textarea class="form-control" name="c_content" id="c_content" placeholder="댓글을 입력하세요" maxlength="500"></textarea>
							<p class="textTotal" align="right">글자수 제한 : 500자</p>
						</td>
						<td><input type="text" name="u_id" id="u_id" value="${user.u_id}" readonly="readonly" ></td>
					</tr>
					<tr>
						<td><input type="button" id="replyRegister" value="저장"></td>
					</tr>
				</table>

			</div>
		</div>
      <p></p>
			<div id="replyListAll">
				
			</div>
			
			
			
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