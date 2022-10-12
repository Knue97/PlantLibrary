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
				<h2 id="title" style="height:50px; color: #212542;">회원 목록</h2>
				<table class="table table-hover table-striped">
				<tr style="color:white; background-color: #1F2B7B;">
			      <th style="width: 20%;">ID</th>
			      <th style="width: 20%;">닉네임</th>
			      <th style="width: 12%;">이름</th>
			      <th>이메일</th>
			      <th class="text-center" style="width: 12%;">회원상태</th>
			      <th class="text-center" style="width: 12%;">삭제</th>
			    </tr>
				  <c:if test="${fn:length(list) == 0}">
				  <tr>
				  <td colspan="6" class="text-center" style="font-weight: bold;">회원목록이 없습니다.</td>
				  </tr>
				  </c:if>
				<c:forEach items="${list}" var="list">
				 <tr>
				  <td>${list.u_id }</td>
				  <td>${list.u_nickname }</td>
				  <td>${list.u_name }</td>
				  <td>${list.u_email}</td>
				  <td class="text-center">
				  <select id="${list.u_id }" onchange="onChange(this);">
					  <c:if test="${list.u_state == 0 }">
						<option selected value="0">일반회원</option>
						<option value="99">관리자</option>				  	
					  </c:if>
					  <c:if test="${list.u_state == 99 }">
						<option value="0">일반회원</option>
						<option selected value="99">관리자</option>			  	
					  </c:if>
				</select></td>
					<c:if test="${list.u_state == 0}">
					<td class="text-center"><a onclick="delConfirm('${list.u_id}');">회원삭제</a></td>
					</c:if>
					<c:if test="${list.u_state == 99}">
					<td></td>
					</c:if>
				 </tr>
				</c:forEach>
				</table>
				
				<div class="row align-items-center justify-content-center">
				<c:if test="${prev}">
				 <span>[ <a href="${contextPath }/admin/user?num=${startPageNum - 1}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				  <span style="padding:5px;">
					  <c:if test="${select != num}">
					   <a href="${contextPath }/admin/user?num=${num}">${num}</a>
					  </c:if>
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if> 
				 </span>
				</c:forEach>
				
					<c:if test="${next}">
					 <span>[ <a href="${contextPath }/admin/user?num=${endPageNum + 1}">다음</a> ]</span>
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
		
		var u_state = x.value;
		var u_id = x.id;
		
		$.ajax({
			
			url:"${contextPath}/admin/user/updatestate",
			data: {
				'u_state' : u_state,
				'u_id' :  u_id
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
	
	
	function delConfirm(u_id){
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
			$.ajax({
				url: "${contextPath}/admin/user/delete",
				data: {
					"u_id" : u_id
				},
				dataType: 'json',
				type: 'POST',
				success: function(result){
					alert('삭제되었습니다.');
					location.reload();
				},
				error: function(result){
					alert('오류');
				}
				
			
			})
		   
		}
		else {
		   alert('삭제가 취소되었습니다.');
		}
	}
</script>
</body>
</html>