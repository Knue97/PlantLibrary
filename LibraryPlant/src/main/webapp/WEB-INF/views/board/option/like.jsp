<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>


	
	
	<h2 style="font-weight: bold;">
		<img src="${contextPath}/resources/assets/img/icon/loveicon_empty.png"
			id="like" style="float: right; height: 35px; cursor: pointer;"
			class="likeno" onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>
	</h2>





<script>


//	마우스 이벤트
	function onMouseEnter() {
		if ($("#like").attr('class') == 'likeno')

			$("#like").attr("src", $("#like").attr("src").replace("loveicon_empty", "loveicon_full"));
		else
			$("#like").attr("src",
					$("#like").attr("src").replace("loveicon_full", "loveicon_empty"));
	}

	function onMouseLeave() {
		if ($("#like").attr('class') == 'likeno')
			$("#like").attr("src",
					$("#like").attr("src").replace("loveicon_full", "loveicon_empty"));
		else
			$("#like").attr("src",
					$("#like").attr("src").replace("loveicon_empty", "loveicon_full"));
	}

	// 즐겨찾기버튼에 마우스 올렸을시 hover 효과로 추가효과, 제거효과 만들기
	// cnt => db에서 즐겨찾기 조건 동일한 것의 개수

	let cnt = 0;

	$(document).ready(function() {

		isliked();

		$(document).on('click', '#like', function() {

			if ('${user.u_id}' == "") {
				alert('즐겨찾기는 로그인 후 이용해주세요.');
				
				return;

			}

			var addUrl = "${contextPath}/like/addLike";
			var removeUrl = "${contextPath}/like/removeLike";
			var paramData = {
				"b_no" : '${board.b_no}',
				"u_id" : '${user.u_id}',
				"bl_content" : '${board.b_title}'
			};

			if (cnt == 0) {

				$.ajax({
					url : addUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {
						
						isliked();

					},

					error : function(result) {
						
						alert('좋아요를 실패하였습니다.')
					}

				});

			} else {

				$.ajax({
					url : removeUrl,
					data : paramData,
					dataType : 'json',
					type : 'POST',
					success : function(result) {
						
						isliked();
						
					},
					error : function(result) {
						
						alert('좋아요 취소를 실패하였습니다.');

					}
				});
			};

		}); // end of $(document).on('

	})

	//  마우스 이벤트 실행
	function isliked() {

		if ('${user.u_id}' == "")
			return;

		var url = "${contextPath}/like/isliked";
		var paramData = {
				"b_no" : '${board.b_no}',
				"u_id" : '${user.u_id}',
				"bl_content" : '${board.b_title}'
		};
		$.ajax({
				url : url,
				data : paramData,
				dataType : 'json',
				type : 'POST',
				success : function(result) {
					console.log("좋아요 = " + result);
					var htmls = ""; // 문서꾸미기

					if (result != 0) {
						htmls += '<img src="${contextPath}/resources/assets/img/icon/loveicon_full.png" id="like"';
						htmls += 'style="float:right; height:35px; cursor:pointer;" class="likeyes" ';
						htmls += 'onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>';
					} else {
						htmls += '<img src="${contextPath}/resources/assets/img/icon/loveicon_empty.png" id="like"';
						htmls += 'style="float:right; height:35px; cursor:pointer;" class="likeno" ';
						htmls += 'onmouseenter="onMouseEnter();" onmouseleave="onMouseLeave();"></img>';
					}
					
					$("#like").replaceWith(htmls);

					cnt = result;

				},
				error : function(result) {
					
					alert('좋아요에 대한 값을 불러오지 못하였습니다.');
				}
			});

	}
</script>

