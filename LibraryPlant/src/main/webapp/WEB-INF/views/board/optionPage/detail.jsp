<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ include file="/WEB-INF/views/include/plugin.jsp"%>

<style>
	table textarea {
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
	}
	.form-group{
	min-height: 30em;
	}
</style>
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
					
					htmls = htmls + '<div class="" id="c_no' + this.c_no + '">';
					htmls += '<hr>';
					htmls += '<span class="d-block">';
					htmls += this.c_no + ' - ';
					htmls += ' <strong class="text-gray-dark">' + this.u_id + '</strong> ';
					if(this.c_state == 1){
					htmls += '(수정)';
					}
					
					if('${user.u_id}'== this.u_id || '${user.u_state}' == 99){
					htmls += '<span style="padding-left: 7px; font-size: 9pt; float:right;">';
					htmls += '<a href="javascript:void(0)" onclick="replyUpdateForm(' + this.c_no + ', \'' + this.u_id + '\', \'' + this.c_content + '\' )" style="padding-right:5px">수정</a>';
					htmls += '<a href="javascript:void(0)" onclick="replyAlarm(' + this.c_no + ')" >삭제</a>';
					htmls +=  '</span>';
					}
					htmls += '<br><br>' + this.c_content + ' <br>';
					if('${user.u_id}'!= this.u_id){
					htmls += '<span style="padding-left: 7px; font-size: 9pt; float:right;">';
					htmls += '<a href="javascript:void(0)" onclick="report(' + this.b_no + ', \'' + this.c_no + '\', \'' + this.u_id + '\', \'' + this.c_content + '\')" >신고</a>';
					htmls += '</span>';
					}
					htmls += '<span style="color:grey; float:right; font-size:10pt;"> ' + this.c_regdate + '</span> ';
					htmls += '</span>';
					htmls += '</div><br>';  

				})
			}
		$("#replyListAll").html(htmls); // 댓글 위치에 html로 보여주기 ,  #replylist는 선택자 ->아래 div id="replylist"에 해당
		},
		error : function(result){
			alert("댓글을 불러오는 것에 실패하였습니다.");
		}
	}); // end of ajax
	
} // end of replyListAll


//댓글 신고 기능
function report(b_no, c_no, u_id, c_content){

	var url = "${contextPath }/board/reportPage";
	url = url + "?b_no=" + b_no;
	url = url + "&c_no=" + c_no;
	url = url + "&u_id=" + u_id;
	url = url + "&c_content=" + encodeURI(c_content);


	var paramData = {
			"b_no" : '${comment.b_no}',
			"c_no" : '${comment.c_no}',
			"u_id" : '${comment.u_id}',
			"c_content" : '${comment.c_content}'
	}; // 추가 데이터 작성
	
	$.ajax({
		url : url,
		data : paramData, // 받아올 데이터가 없어서 dataType은 뺐다.
		type : 'POST',
		success : function(result){
			
			window.location.replace(url);
		}, error : function(result){
			
			console.log("b_no = " + b_no + "c_no = " + c_no);
			
			if(${user.u_id == null}) {
				alert('로그인이 필요합니다.');
			}else{
				alert('문제가 발생하여 신고페이지로 넘어갈 수 없습니다.');
			}
		}
	}); // end of ajax

}; // end of report

//	댓글 작성

	$(document).on('click', '#replyRegister', function(){	// 문서에서 이벤트 발생 이벤트는 클릭이고 대상은 #btnReplySave
		// 개행문자 치환 - 저장
		var c_content = $("#c_content").val().trim();
		c_content = c_content.replace(/(?:\r\n|\r|\n)/g, '<br>');	// 엔터
//		c_content = c_content.replaceAll("\\\<.*?\\\>", "");
		c_content = c_content.replace(/ /gi, '&nbsp');	// 스페이스


		console.log(c_content);
	
		var u_id = $("#u_id").val();
		
		var url = "${contextPath}/board/reply";
		var paramData = {
				"u_id" : u_id,
				"c_content" : c_content,
				"b_no" : '${board.b_no}'
		}; // 추가 데이터 작성
		
		$.ajax({
			url : url,
			data : paramData,
			dataType : 'json',
			type : 'POST',
			success : function(result){
				if(result == 2 ){	// 컨트롤러에서 받은 값 = 2
					alert("댓글을 입력하세요.");
					$("#c_content").focus();
				}else{
				replyListAll();
				$("#c_content").val(''); // value 값을 ' ' 공백 처리
				$("#u_id").val('${user.u_id}');
				}
			},
			error : function(result){
				alert('로그인이 필요합니다.');
			}
		}); // ajax end
	}); // end of $(#replyRegister').on


//	댓글 수정 폼
function replyUpdateForm(c_no, u_id, c_content){
	// 개행문자 치환 - 출력
	var c_content = c_content;
	c_content = c_content.split('<br>').join("\r\n");
	c_content = c_content.split('&nbsp').join(" ");
		var htmls = "";
		
		htmls = htmls + '<div class="" id="c_no' +c_no + '">';
        //<div id="reno12"> <div id="reno13">
		htmls += '<span class="d-block">';
		htmls += c_no + ' - ';
		htmls += '<strong class="text-gray-dark">' + u_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt; float:right;">';
		htmls += '<a href="javascript:void(0)" onclick="replyUpdate(' + c_no + ', \'' + u_id + '\' )" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="replyListAll()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '<textarea id="editmemo" name="editmemo" style="width: 800px; height:100px;" maxlength="3000">';
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
		// 개행문자 치환 - 저장
		var editmemo = $('#editmemo').val().trim();
		editmemo = editmemo.replace(/(?:\r\n|\r|\n)/g, '<br>');	// 엔터
		editmemo = editmemo.replace(/ /gi, '&nbsp');	// 스페이스
		
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
				alert('댓글 수정을 실패하였습니다.');
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
				alert('댓글 삭제를 실패하였습니다.');
			}
		}); // end of $.ajax
	}
	
	
	
</script>


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

			<div class="container">

				<div class="box-body">

					<div class="form-group" >
						
						<p></p>
						<br>

						<div class="quote-wrapper">
							<p class="mb-4">${board.b_content}</p>
							<c:if test="${board.b_content == '' }">
								<h5 style="color: lightgrey; text-align: center;">내용이 없습니다.</h5>
							</c:if>
						</div>
						
				</div>
				
						
						<div >
						<!-- 추천 기능 -->
						<%@ include file="../option/like.jsp" %>
						</div>
						
						<br><br>
						<div class="search-box">
						<!-- 버튼 기능 -->
						<%@ include file="../option/detail_button.jsp" %>
						<br>
						</div>		
							


				<!-- 나눔게시판 한정 작성자 및 나눔 관련 정보 -->
				<c:if test="${board.bc_id == 4 }">
					<%@include file="../option/shareInfo.jsp"%>
				</c:if>
				<!--/ 나눔게시판 한정 작성자 및 나눔 관련 정보 -->
				
			</div>
			</div>
			<p></p><br>

				<div class="container">
					<div class="row px-xl-5">
						<div class="box-body">
							<table>
								<tr>
									<td>
										<input type="hidden" name="u_id" id="u_id" value="${user.u_id}" readonly>
										 작성자 : ${user.u_id}
										<textarea class="form-control" name="c_content" id="c_content" placeholder="댓글을 입력하세요" maxlength="3000" rows="3"></textarea>
										<p class="textTotal" align="right" style="width: 800px;">글자수 제한 : 3000자</p>
									</td>
									<td>
										<input type="button" id="replyRegister" value="등록">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<p></p>
				<div class="row px-xl-5" style="display: flex;">
					<div style="flex: 100%;" id="replyListAll"></div>

				</div>
			</div>

		</section>

	</main>
	<footer>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<!-- JS here -->
</body>
</html>