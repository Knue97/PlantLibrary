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
		<div class="slider-area slider-bg ">
			<!-- Single Slider -->
			<div class="single-slider d-flex align-items-center slider-height3">
				<div class="container">
					<div class="row align-items-center justify-content-center">
						<div class="col-xl-8 col-lg-9 col-md-12 ">
							<div class="hero__caption hero__caption3 text-center">
								<h1 data-animation="fadeInLeft" data-delay=".6s ">식물원 등록</h1>
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
			<form action="${contextPath}/botanicalgarden/update" method="post">
				<div class="form-group d-none">
					<input type="text" class="form-control" name="g_id"
						value="${VO.g_id}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>지역</label> <select class="form-control" name="g_region"
						id="g_region">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대구">대구</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="강원">강원</option>
						<option value="제주">제주</option>
					</select>
				</div>
				<div class="form-group">
					<label>이름</label> <input type="text" class="form-control"
						placeholder="식물원 또는 수목원 이름" name="g_name" value="${VO.g_name }">
				</div>
				<div class="form-group">
					<label>주소</label> <input type="text" class="form-control"
						placeholder="식물원 또는 수목원 주소" name="g_detailedAddress"
						id="address_kakao" value="${VO.g_detailedAddress }"> <input
						type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
					<div id="map"
						style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
				</div>
				<div class="form-group">
					<label>홈페이지</label> <input type="url" class="form-control"
						placeholder="식물원 또는 수목원 홈페이지" name="g_url" value="${VO.g_url }">
				</div>
				<div class="form-group">
					<label>요약 정보</label>
					<textarea class="form-control" rows="5" name="g_summary">${VO.g_summary }</textarea>
				</div>
				<div class="form-group">
					<label>위도</label> <input type="number" class="form-control"
						placeholder="식물원 또는 수목원 위도" name="g_latitude" id="g_latitude"
						step="any" readonly="readonly" value="${VO.g_latitude }">
				</div>
				<div class="form-group">
					<label>경도</label> <input type="number" class="form-control"
						placeholder="식물원 또는 수목원 경도" name="g_longitude" id="g_longitude"
						step="any" readonly="readonly" value="${VO.g_longitude }">
				</div>
				<button type="submit">수정</button>
				<button type="reset">돌아가기</button>
				<div id="message"></div>
			</form>
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
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0397e862e5ddaaeacf218bf8ffddaa4e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("address_kakao").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							//좌표값을 입력한다.
							document.getElementById("g_latitude").setAttribute(
									"value", result.y);
							document.getElementById("g_longitude")
									.setAttribute("value", result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
	<script>
		const elem = document.getElementById('g_region');
		const len = elem.options.length;

		for (let i = 0; i < len; i++) {
			if (elem.options[i].value == '${VO.g_region}') {
				elem.options[i].selected = true;
				console.log(elem.options[i].value);
				console.log(elem.options[i].selected);
			}
		}
	</script>

</body>
</html>