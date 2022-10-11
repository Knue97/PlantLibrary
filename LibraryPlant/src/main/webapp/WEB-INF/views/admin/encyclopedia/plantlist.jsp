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
				<div class="form-group col-md-6">
					<h4 style="color: #212542;">백과사전 카테고리를 선택하세요.</h4>
					<select onchange="if(this.value) location.href=(this.value);">
						<option selected value="">--- 항목선택 ---</option>
						<option selected value="${contextPath }/admin/encyclopedia/plant?num=1">식물</option>
						<option value="${contextPath }/admin/encyclopedia/disease?num=1">병해</option>
						<option value="${contextPath }/admin/encyclopedia/pest?num=1">식물</option>
					</select>
				</div>
				<h2 style="height:50px; color: #212542;">식물백과 목록</h2>
				<table class="table table-hover table-striped">
				<tr style="color:white; background-color: #1F2B7B;">
			      <th style="width: 20%;">등록번호</th>
			      <th class="text-center" >식물명</th>
			      <th style="width: 12%;"></th>
			      <th style="width: 12%;"></th>
			    </tr>
			   	<c:if test="${fn:length(list) == 0}">
				  <tr>
				  <td colspan="6" class="text-center" style="font-weight: bold;">식물백과 목록이 없습니다.</td>
				  </tr>
				</c:if> 
				<c:forEach items="${list}" var="list">
				 <tr>
				  <td><a href="${contextPath }/encyclopedia/plant/detail?pl_id=${list.pl_id}">${list.pl_id}</a></td>
				  <td><a href="${contextPath }/encyclopedia/plant/detail?pl_id=${list.pl_id}">${list.pl_koreanName}</a></td>
				  <td class="text-center"><a href="${contextPath }/admin/encyclopedia/plant/update?pl_id=${list.pl_id}">수정</a></td>
				  <td class="text-center"><a onclick="delConfirm(${list.pl_id});">삭제</a></td>
				 </tr>
				</c:forEach>
				</table>
				
				<div class="row align-items-center justify-content-center">
				<c:if test="${prev}">
				 <span>[ <a href="${contextPath }/admin/encyclopedia/plant?num=${startPageNum - 1}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				  <span style="padding:5px;">
					  <c:if test="${select != num}">
					   <a href="${contextPath }/admin/encyclopedia/plant?num=${num}">${num}</a>
					  </c:if>
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if> 
				 </span>
				</c:forEach>
				
					<c:if test="${next}">
					 <span>[ <a href="${contextPath }/admin/encyclopedia/plant?num=${endPageNum + 1}">다음</a> ]</span>
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
	function delConfirm(pl_id){
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
			$.ajax({
				url: "${contextPath}/admin/encyclopedia/plant/delete",
				data: {
					"pl_id" : pl_id
				},
				dataType: 'json',
				type: 'GET',
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