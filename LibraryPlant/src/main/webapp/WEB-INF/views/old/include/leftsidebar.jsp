<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="index.html"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>
                    <li class="menu-title">내 정보</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="./login/login.html" > <i
                                class="menu-icon fa fa-table"></i>if(user == null) 로그인하러가기</a>                        
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-table"></i>유저.마이페이지</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-basic.html">내 정보보기</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">내 활동이력</a></li>
                        </ul>
                    </li>
                    <li class="menu-title">백과 & 게시판</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="/encyclopedia/home" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>알잘딱깔센 백과</a>
                        <ul class="sub-menu children dropdown-menu">
                        	<li><i class="fa fa-puzzle-piece"></i><a href="${contextPath}/encyclopedia/home">백과 메인</a></li>
                            <li><i class="fa fa-puzzle-piece"></i><a href="encyclope">식물백과</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">병충해백과</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">참고자료</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-th"></i>게시판</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">느껴라! 자유를 게시판</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">무엇이든 물어보살 게시판</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">내가 제일 잘 나가 게시판</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">받아라 식물! 거절은 거절한다 게시판</a></li>
                        </ul>
                    </li>

                    <li class="menu-title">실내원예의 모든 것</li><!-- /.menu-title -->

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>실내 원예의 기초</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">간단 원예 지식 테스트 </a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">식물 심기</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">식물 배치</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">물주기</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">영양제 & 관리법</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">해충과 질병</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">분갈이</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">원예 도구</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">토양</a></li>
                        </ul>
                    </li>                    
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>플랜테리어</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">개념</a>
                            </li>
                            <li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">추가메뉴</a></li>
                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">추가메뉴</a>
                            </li>
                        </ul>
                    </li>

                    <li class="menu-title">찾아가보기</li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>식물원</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Google Maps</a></li>
                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">정리된 2차원 테이플로 보기</a>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-title">About Us</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Who & Why & How</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">팀원</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">프로젝트의 목적</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">향후 발전 방향 및 약속</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>