<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
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
				
				<div class="single-slider d-flex align-items-center slider-height">
					<div class="container">
					<div style="height:100px;"></div>
				<div class="row align-items-center justify-content-center">
				<div class="col-lg-9">
				<h2 id="title" style="height:50px; color: #212542;">게시물/댓글 신고 목록</h2>
				<table class="table table-hover table-striped">
				<tr style="color:white; background-color: #1F2B7B;">
			      <th style="width: 12%;">등록번호</th>
			      <th style="width: 12%;">항목</th>
			      <th style="width: 20%;">작성자</th>
			      <th>글/댓글내용</th>
			      <th class="text-center" style="width: 15%;">신고내용</th>
			      <th class="text-center" style="width: 15%;">삭제</th>
			    </tr>
				  <c:if test="${fn:length(list) == 0}">
				  <tr>
				  <td colspan="7" class="text-center" style="font-weight: bold;">신고목록이 없습니다.</td>
				  </tr>
				  </c:if>
				<c:forEach items="${list}" var="list">
				 <tr>
				  <td><a href="${contextPath }/admin/report/detail?r_no=${list.r_no}">${list.r_no}</a></td>
				  <c:if test="${list.c_no == 0 }">
				  	<td>게시물</td>
				  </c:if>
				  <c:if test="${list.c_no != 0 }">
				  	<td>댓글</td>
				  </c:if>
				  <td>${list.u_id }</td>
				  <td><a href="${contextPath }/board/detail?b_no=${list.b_no}">${list.rc_content }</a></td>
				  <td class="text-center"><a href="${contextPath }/admin/report/detail?r_no=${list.r_no}">상세보기</a></td>
				  <td class="text-center">
				  <select id="${list.r_no }" onchange="onChange(this);">
					  <c:if test="${list.r_state == 0 }">
						<option selected value="0">접수대기</option>
						<option value="1">처리중</option>
						<option value="2">처리완료</option>				  	
					  </c:if>
					  <c:if test="${list.r_state == 1 }">
						<option value="0">접수대기</option>
						<option selected value="1">처리중</option>
						<option value="2">처리완료</option>				  	
					  </c:if>
					  <c:if test="${list.r_state == 2 }">
						<option value="0">접수대기</option>
						<option value="1">처리중</option>
						<option selected value="2">처리완료</option>				  	
					  </c:if>
				</select></td>
				 </tr>
				</c:forEach>
				</table>
				
				<div class="row align-items-center justify-content-center">
				<c:if test="${prev}">
				 <span>[ <a href="${contextPath }/admin/report?num=${startPageNum - 1}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				  <span style="padding:5px;">
					  <c:if test="${select != num}">
					   <a href="${contextPath }/admin/report?num=${num}">${num}</a>
					  </c:if>
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if> 
				 </span>
				</c:forEach>
				
					<c:if test="${next}">
					 <span>[ <a href="${contextPath }/admin/report?num=${endPageNum + 1}">다음</a> ]</span>
					</c:if>
				</div>
				</div>

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
<script>
	function onChange(x){
		
		var r_state = x.value;
		var r_no = x.id;
		
		$.ajax({
			
			url:"${contextPath}/admin/report/updatestate",
			data: {
				'r_state' : r_state,
				'r_no' :  r_no
			},
			dataType: 'json',
			type: "POST",
			success: function(result){
				location.reload();
			},
			error: function(result){
				alert('오류');
			}
			
		})
		
	}
</script>
</body>
</html>