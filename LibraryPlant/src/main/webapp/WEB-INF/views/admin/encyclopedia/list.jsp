<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
				<h2 style="height:50px; color: #212542;">병해백과 목록</h2>
				<div class="row">
				<div class="col-lg-8">
				<table class="table table-hover table-striped">
				<tr style="color:white; background-color: #1F2B7B;">
			      <th style="width: 20%;">등록번호</th>
			      <th class="text-center" >병해명</th>
			      <th style="width: 12%;"></th>
			      <th style="width: 12%;"></th>
			    </tr>
				<c:forEach items="${list}" var="list">
				 <tr>
				  <td><a href="${contextPath }/encyclopedia/disease/detail?di_id=${list.di_id}">${list.di_id}</a></td>
				  <td><a href="${contextPath }/encyclopedia/disease/detail?di_id=${list.di_id}">${list.di_alias}</a></td>
				  <td class="text-center"><a href="${contextPath }/admin/encyclopedia/disease/update?di_id=${list.di_id}">수정</a></td>
				  <td class="text-center"><a onclick="delConfirm();">삭제</a></td>
				 </tr>
				</c:forEach>
				</table>
				
				<div class="row align-items-center justify-content-center">
				<c:if test="${prev}">
				 <span>[ <a href="${contextPath }/admin/encyclopedia?num=${startPageNum - 1}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				  <span style="padding:5px;">
					  <c:if test="${select != num}">
					   <a href="${contextPath }/admin/encyclopedia?num=${num}">${num}</a>
					  </c:if>
					  <c:if test="${select == num}">
					   <b>${num}</b>
					  </c:if> 
				 </span>
				</c:forEach>
				
					<c:if test="${next}">
					 <span>[ <a href="${contextPath }/admin/encyclopedia?num=${endPageNum + 1}">다음</a> ]</span>
					</c:if>
				</div>
				</div>

			<div class="col-lg-4">

				    <form action="#">
				     <div class="form-group">
				      <div class="input-group mb-3">
				       <input type="text" class="form-control" placeholder="Search Keyword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
				       <div class="input-group-append">
				        <button class="btns" type="button"><i class="ti-search"></i></button>
				      </div>
				    </div>
				  </div>
				  <button class="genric-btn w-100 primary e-large" type="submit">Search</button>
				</form>

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
	function delConfirm(){
		var delConfirm = confirm('정말 삭제하시겠습니까?');
		if (delConfirm) {
			$.ajax{(
				url: "admin/encyclopedia/disease/delete",
				data: {
					"di_id" : "${di_id}"
				},
				dataType: 'json',
				type: 'POST',
				success: function(result){
					
				},
				error: function(result){
					
				}
				
			
			)}
		   alert('삭제되었습니다.');
		}
		else {
		   alert('삭제가 취소되었습니다.');
		}
	}
</script>
</body>
</html>