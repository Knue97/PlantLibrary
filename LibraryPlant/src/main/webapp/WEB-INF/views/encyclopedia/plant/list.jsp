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
		<div class="slider-area slider-bg">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<span data-animation="fadeInLeft" data-delay=".3s">Plant
									Repository</span>
								<h1 data-animation="fadeInLeft" data-delay=".6s ">${type}</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Slider Shape -->
			<div class="slider-shape d-none d-lg-block">
				<img class="slider-shape1"
					src="${contextPath}/resources/assets/img/hero/top-left-shape.png"
					alt="">
			</div>
		</div>
		<div class="container mt-150">
			<div class="d-flex justify-content-between">
				<div class="div">
					<h1>${classification}</h1>
				</div>
				<div class="div">
					<button type="button" class="btn btn-primary"
						onclick="location.href = '${contextPath}/encyclopedia/plant/listgroup'">뒤로가기</button>
				</div>
			</div>
			<div class="row row-cols-1 row-cols-md-3">
				<c:forEach var="entity" items="${group}">
					<div class="col mb-4">
						<div class="card h-100 text-center">
							<div class="card-header">${entity.pl_koreanName}</div>
							<img
								src="${contextPath}/resources/assets/img/dummy/${entity.pl_image}"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${entity.pl_englishName }</h5>
								<p class="card-text">${entity.pl_summary }</p>
								<a
									href="${contextPath}/encyclopedia/plant/detail?pl_id=${entity.pl_id}"
									class="btn btn-primary">자세히 보러가기</a>
								<footer class="blockquote-footer">
									수정일 <cite title="Source Title">Source Title</cite>
								</footer>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="d-felx justfy-content-center text-center">
				<nav aria-label="Page navigation example justfy-content-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/encyclopedia/plant/list?page=${pageMaker.startPage - 1 }&pl_classification=${pl_classification}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class=page-item active':'class =page-item'}"/>>
								<a
								href="${contextPath}/encyclopedia/plant/list?page=${idx}&pl_classification=${pl_classification}"
								class="page-link">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li class="page-item"><a class="page-link"
								href="${contextPath}/encyclopedia/plant/list?page=${pageMaker.endPage + 1}&pl_classification=${pl_classification}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
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
</body>
</html>