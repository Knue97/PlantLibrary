<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp" %>
<%@ include file="../include/plugin.jsp" %>
<%@ include file="../board/option/css.jsp" %>
 
</head>
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
                                    <span data-animation="fadeInDown" data-delay=".3s">QnA</span>
                                    <h1 data-animation="fadeInDown" data-delay=".1s ">질문 게시판</h1>

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
			<!-- Main content -->
			<section class="content container-fluid">
				<div class="container">
				<!-- search.jsp 에 필요함  -->
				<input type="hidden" id="boardType" value="2">

				<div>
					<%@ include file="option/search.jsp" %>
					
					<!-- 게시글 작성 커서이벤트 -->
					<div class="box">
						<div class="box-header with-border">
							<button type="button" onclick="location.href='${contextPath}/board/register';">
								<img src="${contextPath}/resources/assets/img/icon/write_empty.png"
									id="write" style="float: right; height: 35px; cursor: pointer;"
									class="writeno" onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>
							</button>
						<br>
						</div>
					</div>

					<table class="table">
						<tr>
							<td>글번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
							<td>추천수</td>
						</tr>
						<c:forEach var="board" items="${qnaListAll }">
							<tr>
								<td>${board.b_no}</td>
								<td><a href="detail?b_no=${board.b_no}">
								${board.b_title} </a>
								<c:if test="${board.b_image != null}">
								<img src="${contextPath}/resources/assets/img/icon/plant.png" alt="" height="25" width="25">
								</c:if>
								<a>[${board.b_commentcnt}]</a></td>
								<td>${board.u_id}</td>
								<td>${board.b_regdate}</td>
								<td><span class="badge">${board.b_hits}</span></td>
								<td><span class="badge">${board.b_recommendedNumber}</td>
							</tr>
						</c:forEach>
					</table>
					
					
					<p></p>
					
					<!-- 게시글 작성 커서이벤트 -->
					<div class="box">
						<div class="box-header with-border">
							<button type="button" onclick="location.href='${contextPath}/board/register';">
								<img src="${contextPath}/resources/assets/img/icon/write_empty.png"
									id="write" style="float: right; height: 35px; cursor: pointer;"
									class="writeno" onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>
							</button>
						</div>
					</div>

					
					<!-- 페이징  -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul class="blog-pagination">
								<c:if test="${pageMaker.prev}">
									<li>
										<a href='<c:url value="/board/qnaListAll?page=${pageMaker.startPage - 1}"/>'>
											<i class="fa fa-chevron-left"></i>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
									<li><a href='<c:url value="/board/qnaListAll?page=${pageNum}"/>'>
										<i class="fa">${pageNum}</i>
									</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li>
										<a href='<c:url value="/board/qnaListAll?page=${pageMaker.endPage + 1}"/>'>
											<i class="fa fa-chevron-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- /페이징  -->
				
				
				</div>
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