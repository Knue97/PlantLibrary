<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/plugin.jsp" %>
<%@ include file="/WEB-INF/views/board/option/regiser_css.jsp" %>

</head>
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
                                    <span data-animation="fadeInDown" data-delay=".3s">Total Search Board</span>
                                    <h1 data-animation="fadeInDown" data-delay=".1s ">전체 검색</h1>

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
				
				
				<div>
					<%@ include file="../option/search.jsp" %>
					
					
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
						<c:forEach var="board" items="${searchList}">
							<tr>
								<td>${board.b_no}</td>
								<td><a href="detail?b_no=${board.b_no}&searchKeyword=${pageMaker.cri.searchKeyword}&searchType=${pageMaker.cri.searchType}&page=${pageMaker.cri.page}">
								<c:if test="${board.bc_id ==1}">
								[자유]
								</c:if>
								<c:if test="${board.bc_id ==2}">
								[질문]
								</c:if>
								<c:if test="${board.bc_id ==3}">
								[자랑]
								</c:if>
								<c:if test="${board.bc_id ==4}">
								[나눔]
								</c:if>
								${board.b_title}
								
								<c:if test="${board.b_image != null}">
								<img src="${contextPath}/resources/assets/img/icon/plant.png" alt="" height="25" width="25">
								</c:if>
								</a><a>[${board.b_commentcnt}]</a></td>
								<td>${board.u_id}</td>
								<td>${board.b_regdate}</td>
								<td><span class="badge">${board.b_hits}</span></td>
								<td><span class="badge">${board.b_recommendedNumber}</td>
							</tr>
						</c:forEach>
					</table>
					
					<p></p>
					
					<!-- 검색에 해당하는 게시글 결과 -->
					<%@ include file="../option/resultNone.jsp" %>
					<!-- /검색에 해당하는 게시글 결과 -->
					
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


				<!-- 검색 페이징 주소? 키워드 인코딩 &검색 타입  -->
				<c:url
					value="/board/searchList?searchType=${pageMaker.cri.searchType}" var="url">
					<c:param name="searchKeyword" value="${pageMaker.cri.searchKeyword}"></c:param>
				</c:url>
				<!-- /검색 페이징 주소? 키워드 인코딩 &검색 타입  -->
				
				<!-- 검색 페이징  -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul class="blog-pagination">
								<c:if test="${pageMaker.prev}">
									<li>
										<a href='${url }<c:url value="&page=${pageMaker.startPage - 1}"/>'>
											<i class="fa fa-chevron-left"></i>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
									<li><a href='${url }<c:url value="&page=${pageNum}"/>'>
										<i class="fa">${pageNum}</i>
									</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li>
										<a href='${url }<c:url value="&page=${pageMaker.endPage + 1}"/>'>
											<i class="fa fa-chevron-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- /검색 페이징  -->


				
				</div>
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