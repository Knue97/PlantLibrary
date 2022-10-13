<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="${contextPath }/"><img style="height: 85px;" src="${contextPath}/resources/assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation" >                                                                                          
                                                <li><a href="${contextPath }/">Home</a></li>
                                                <li><a href="${contextPath }/aboutus">About us</a></li>
                                                <li><a href="#">백과</a>
                                                    <ul class="submenu">
                                                    	<li><a href="${contextPath }/encyclopedia/home">백과 홈</a></li>
                                                        <li><a href="${contextPath }/encyclopedia/plant/listgroup">식물</a></li>
                                                        <li><a href="${contextPath }/encyclopedia/diseaseandpest">병해충</a></li>
                                                                                                           
                                                    </ul>
                                                </li>
                                                <li><a href="#">게시판</a>
                                                    <ul class="submenu">
                                                        <li><a href="${contextPath }/board/freeListAll">자유게시판</a></li>
                                                        <li><a href="${contextPath }/board/qnaListAll">질문게시판</a></li>
                                                        <li><a href="${contextPath }/board/showListAll">자랑게시판</a></li>
                                                        <li><a href="${contextPath }/board/shareListAll">나눔게시판</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">식물원</a>
                                                    <ul class="submenu">
                                                        <li><a href="${contextPath }/botanicalgarden/navermap">지도로 보기</a></li>                                                                     
                                                    </ul>
                                                </li>
                                                <c:if test="${not empty user}">
                                                	<c:if test="${user.u_state == 99 }">                                                
	                                                	<li>
															<div class="dropdown">
															  <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
															    ${user.u_nickname }님
															  </button>
															  <ul class="dropdown-menu">
															    <li><a class="dropdown-item" href="${contextPath}/admin">관리자 페이지</a></li>
															    <li><a class="dropdown-item" href="${contextPath}/login/logout">로그아웃</a></li>
															  </ul>
															</div>
														</li>
													</c:if>
													<c:if test="${user.u_state != 99 }">
														<li>
															<div class="dropdown">
															  <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
															    ${user.u_nickname }
															  	<c:choose>															  		
															  		<c:when test="${user.api == 'naver' }">
															  			님(NAVER)
															  		</c:when>
															  		<c:when test="${user.api == 'kakao'}">
															  			님(KAKAO)
															  		</c:when>
															  		<c:otherwise>
															  			(${user.u_id })님
															  		</c:otherwise>
															  	</c:choose>															    															    

															  </button>
															  <ul class="dropdown-menu">
															    <li><a class="dropdown-item" href="${contextPath}/user/mypage">내 정보</a></li>
															    <li><a class="dropdown-item" href="${contextPath}/#">식물관리</a></li>														    
															    <li><a class="dropdown-item" href="${contextPath}/#">즐겨찾기</a></li>															    
															    <li><a class="dropdown-item" href="${contextPath}/login/logout">로그아웃</a></li>
															  </ul>
															</div>
														</li>
													</c:if>                                                	
                                                </c:if>
                                                <c:if test="${empty user }">
	                                                <!-- Button -->
	                                                <li class="button-header"><a href="${contextPath}/login/login" class="btn">로그인</a></li>
                                                </c:if>                                                
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div> 
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>