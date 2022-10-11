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
				<h2 style="height:50px; color: #212542;">수정요청 목록</h2>
				<table class="table table-hover table-striped">
				<tr style="color:white; background-color: #1F2B7B;">
			      <th style="width: 12%;">등록번호</th>
			      <th style="width: 12%;">백과</th>
			      <th style="width: 20%;">등록유저</th>
			      <th>요청항목</th>
			      <th style="width: 15%;">요청내용</th>
			      <th class="text-center" style="width: 15%;">삭제</th>
			    </tr>
				  <c:if test="${fn:length(list) == 0}">
				  <tr>
				  <td colspan="6" class="text-center" style="font-weight: bold;">수정요청이 없습니다.</td>
				  </tr>
				  </c:if>
				<c:forEach items="${list}" var="list">
				 <tr>
				  <td>${list.mr_no}</td>
				  <c:if test="${list.ec_id == 10 }">
				  	<td>식물</td>
				  </c:if>
				  <c:if test="${list.ec_id == 20 }">
				  	<td>병해</td>
				  </c:if>
				  <c:if test="${list.ec_id == 30 }">
				  	<td>해충</td>
				  </c:if>
				  <td>${list.u_id }</td>
				  <c:if test="${list.ec_id == 10}">
					  <td><a href="${contextPath }/encyclopedia/plant/detail?pl_id=${list.mr_name }">${list.name }</a></td>				  
				  </c:if>
				  <c:if test="${list.ec_id == 20}">
					  <td><a href="${contextPath }/encyclopedia/disease/detail?di_id=${list.mr_name }">${list.name }</a></td>				  
				  </c:if>
				  <c:if test="${list.ec_id == 30}">
					  <td><a href="${contextPath }/encyclopedia/pest/detail?pe_id=${list.mr_name }">${list.name }</a></td>				  
				  </c:if>
				  <td><a href="${contextPath }/admin/modifyrequest/detail?mr_no=${list.mr_no}">내용보기</a></td>
				  <td class="text-center"><a style="cursor: pointer;" onclick="delConfirm(${list.mr_no});">확인완료</a></td>
				 </tr>
				</c:forEach>
				</table>
				
				<div class="row align-items-center justify-content-center">
				<c:if test="${prev}">
				 <span>[ <a href="${contextPath }/admin/modifyrequest?num=${startPageNum - 1}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				  <span style="padding:5px;">
					  <c:if test="${select != num}">
					   <a href="${contextPath }/admin/modifyrequest?num=${num}">${num}</a>
					  </c:if>
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if> 
				 </span>
				</c:forEach>
				
					<c:if test="${next}">
					 <span>[ <a href="${contextPath }/admin/modifyrequest?num=${endPageNum + 1}">다음</a> ]</span>
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
	function delConfirm(mr_no){
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
			$.ajax({
				url: "${contextPath}/admin/modifyrequest/delete",
				data: {
					"mr_no" : mr_no
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