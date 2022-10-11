<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=13hwd1lfe3"></script>

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
		<div class="slider-area slider-bg ">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<h1 data-animation="fadeInLeft" data-delay=".6s ">식물원</h1>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 text-center">
							<img class="img-fluid"
								src="${contextPath}/resources/assets/img/icon/open-book.png"
								alt="book" data-animation="fadeInRight" data-delay="1s">
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
		<div class="container">
			<div class="row">
				<div class="col">
					<div id="map" style="width: 100%; height: 75vh;"></div>
				</div>
			</div>
		</div>

		<div class="mt-50">
			<h1>수목원 표</h1>
		</div>

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-toggle="tab"
					data-target="#region1" type="button" role="tab" aria-controls="home"
					aria-selected="true">서울</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-toggle="tab"
					data-target="#region2" type="button" role="tab"
					aria-controls="profile" aria-selected="false">경기</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region3" type="button" role="tab"
					aria-controls="region3" aria-selected="false">부산</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region4" type="button" role="tab"
					aria-controls="contact" aria-selected="false">인천</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region5" type="button" role="tab"
					aria-controls="contact" aria-selected="false">광주</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region6" type="button" role="tab"
					aria-controls="contact" aria-selected="false">대구</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region7" type="button" role="tab"
					aria-controls="contact" aria-selected="false">대전</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region8" type="button" role="tab"
					aria-controls="contact" aria-selected="false">울산</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region9" type="button" role="tab"
					aria-controls="contact" aria-selected="false">강원</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-toggle="tab"
					data-target="#region10" type="button" role="tab"
					aria-controls="contact" aria-selected="false">제주</button>
			</li>			
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="region1" role="tabpanel"
				aria-labelledby="home-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list1}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region2" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list2}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region3" role="tabpanel"
				aria-labelledby="region3">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list3}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region4" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list4}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region5" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list5}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region6" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list6}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region7" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list7}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region8" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list8}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region9" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list9}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="region10" role="tabpanel"
				aria-labelledby="profile-tab">
				<div class="container-fluid">
					<table class="table tabel-bordered" id="table">
						<thead class="text-center">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">주소</th>
								<th scope="col">HomePage</th>
								<th scope="col">요약</th>
								<th scope="col" class="d-none">좌표(위도)</th>
								<th scope="col" class="d-none">좌표(경도)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list10}" var="entity">
								<tr>
									<th scope="row">${entity.g_id }</th>
									<td>${entity.g_name }</td>
									<td>${entity.g_detailedAddress }</td>
									<td><a href="${entity.g_url }" target="_black">홈페이지</a></td>
									<td>${entity.g_summary }</td>
									<td class="d-none">${entity.g_latitude }</td>
									<td class="d-none">${entity.g_longitude }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">${list1.size() }</div>
		</div>

		<script>
			var HOME_PATH = window.HOME_PATH || '.';

			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(37.3595704, 127.105399),
				zoom : 10,
				zoomControl : true, //줌 컨트롤 표시 여부
				zoomControlOptions : {
					positon : naver.maps.Position.TOP_RIGHT
				}
			});			
			
			
			
			var bounds = map.getBounds(), southWest = bounds.getSW(), northEast = bounds
					.getNE(), lngSpan = northEast.lng() - southWest.lng(), latSpan = northEast
					.lat()
					- southWest.lat();

			var markers = [], infoWindows = [], contents = [];
			var content;

			
			<c:forEach items="${list1}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			
			</c:forEach>
			<c:forEach items="${list2}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
					'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
					'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list3}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list4}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list5}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list6}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list7}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list8}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list9}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			
			<c:forEach items="${list10}" var="entity">
			content = [ '<div class="d-flex flex-column text-center" >',
				'<div>', '<h4>${entity.g_name}</h4>', '</div>','<a href="${entity.g_url}" target="_black" class="h6">${entity.g_url}</a>', '<div>',
				'<p>${entity.g_detailedAddress}</p>', '</div>', '</div>' ]
			var position = new naver.maps.LatLng(${entity.g_latitude},${entity.g_longitude});
			var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});
			
				var infoWindow = new naver.maps.InfoWindow({
					content : content.join('')
				});
			markers.push(marker);
			infoWindows.push(infoWindow);
			contents.push(content);
			</c:forEach>
			/*
			for (var index = 1; index < table.rows.length; index++) {

				var position = new naver.maps.LatLng(
						table.rows.item(index).cells.item(5).innerText,
						table.rows.item(index).cells.item(6).innerText);

				var marker = new naver.maps.Marker(
						{
							map : map,
							position : position,
							icon : {
								url : '${contextPath}/resources/assets/img/icon/garden.png',
								size : new naver.maps.Size(24, 37),
								anchor : new naver.maps.Point(12, 37),
								origin : new naver.maps.Point(0, 0)
							},
							zIndex : 100
						});

				var infoWindow = new naver.maps.InfoWindow({
					content : contents[index - 1].join('')
				});

				markers.push(marker);
				infoWindows.push(infoWindow);
			};
			*/
		
			function updateMarkers(map, markers) {

				var mapBounds = map.getBounds();
				var marker, position;

				for (var i = 0; i < markers.length; i++) {

					marker = markers[i]
					position = marker.getPosition();

					if (mapBounds.hasLatLng(position)) {
						showMarker(map, marker);
					} else {
						hideMarker(map, marker);
					}
				}
			}

			function showMarker(map, marker) {

				if (marker.setMap())
					return;
				marker.setMap(map);
			}

			function hideMarker(map, marker) {

				if (!marker.setMap())
					return;
				marker.setMap(null);
			}

			// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
			function getClickHandler(seq) {
				return function(e) {
					var marker = markers[seq], infoWindow = infoWindows[seq];

					if (infoWindow.getMap()) {
						infoWindow.close();
					} else {
						infoWindow.open(map, marker);
					}
				}
			}

			for (var i = 0, ii = markers.length; i < ii; i++) {
				naver.maps.Event.addListener(markers[i], 'click',
						getClickHandler(i));
			}
		</script>

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