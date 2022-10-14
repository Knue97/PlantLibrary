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
								<span data-animation="fadeInLeft" data-delay=".3s">식집사들이
									기다려왔던</span>
								<h1 data-animation="fadeInLeft" data-delay=".6s ">백과사전</h1>
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
			<div class="col-6">
				<label><b>채팅방</b></label>
			</div>
			<div>
				<div id="msgArea" class="col"></div>
				<div class="col-6">
					<div class="input-group mb-3">
						<input type="text" id="msg" class="form-control"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-send">전송</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6"></div>
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
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript">
		//전송 버튼 누르는 이벤트
		$("#button-send").on("click", function(e) {
			sendMessage();
			$('#msg').val('')
		});

		var sock = new SockJS('http://localhost:8080/plantlibrary/chatting');
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = onOpen;

		function sendMessage() {
			sock.send($("#msg").val());
		}
		//서버에서 메시지를 받았을 때
		function onMessage(msg) {

			var data = msg.data;
			var sessionId = null; //데이터를 보낸 사람
			var message = null;

			var arr = data.split(":");

			for (var i = 0; i < arr.length; i++) {
				console.log('arr[' + i + ']: ' + arr[i]);
			}

			var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
			console.log("cur_session : " + cur_session);

			sessionId = arr[0];
			message = arr[1];

			//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
			if (sessionId == cur_session) {

				var str = "<div class='col-6'>";
				str += "<div class='alert alert-secondary'>";
				str += "<b>" + sessionId + " : " + message + "</b>";
				str += "</div></div>";

				$("#msgArea").append(str);
			} else {

				var str = "<div class='col-6'>";
				str += "<div class='alert alert-warning'>";
				str += "<b>" + sessionId + " : " + message + "</b>";
				str += "</div></div>";

				$("#msgArea").append(str);
			}

		}
		//채팅창에서 나갔을 때
		function onClose(evt) {

			var user = '${user.u_name}';
			var str = user + " 님이 퇴장하셨습니다.";

			$("#msgArea").append(str);
		}
		//채팅창에 들어왔을 때
		function onOpen(evt) {

			var user = '${user.u_name}';
			var str = user + "님이 입장하셨습니다.";

			$("#msgArea").append(str);
		}
	</script>
</body>
</html>