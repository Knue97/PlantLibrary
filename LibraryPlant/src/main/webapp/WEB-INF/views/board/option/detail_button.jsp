<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!doctype html>

<style>
button {
	display: block;
	float: right;
	line-height: 24pt;
	padding: 0 20px;
	border: none;
	background: #fff;
	color: #000;
	letter-spacing: 2px;
	transition: .2s all ease-in-out;
	border-bottom: 2px solid transparent;
	outline: none;
}

button:hover {
	background: inherit;
	color: #2e8b57;
	border-bottom: 2px solid #2e8b57;
}
</style>

<div class="box-footer">
		
	<button id="list">목록</button>
	<c:if test="${user.u_id != board.u_id }">
		<c:if test="${user.u_state != 99 }">
			<button id="report">신고</button>
		</c:if>
	</c:if>
	<c:if test="${user.u_id == board.u_id}">
		<button id="delete" onclick="return alarm();">삭제</button>
		<button id="update">수정</button>
	</c:if>


</div>



<script>

	
	$('#update').on('click', function() {
		var url = "update?b_no=${board.b_no}";
		location.href = url;
	});
	
	$('#list').on('click', function() {
		if(${board.bc_id} == 1)
			var url = "freeListAll";
		
		else if(${board.bc_id} == 2)
			var url = "qnaListAll";
		
		else if(${board.bc_id} == 3)
			var url = "showListAll";
		
		else if(${board.bc_id} == 4)
			var url = "shareListAll";
		
		else var url = "${contextPath }";
		
		location.href = url;
	});

	
	// 신고페이지 이동
	$('#report').on('click', function() {

		if ('${user}' == "") {
			alert('로그인 후 이용해주세요.');

			return alarmLogin();
		}

		var url = "${contextPath }/board/reportPage";
		url = url + "?b_no=" + ${board.b_no};
		url = url + "&u_id=${board.u_id}";
		url = url + "&b_title=${board.b_title}";
		location.href = encodeURI(url);
		console.log(location.href);

	});

	// 로그인 이동 확인창
	function alarmLogin() {
		var msg = "로그인 페이지로 이동하시겠습니까?";
		if (confirm(msg)) {
			location.href = '${contextPath}/login/login';
			return false;
		}
		return true;
	}
	

//	게시글 삭제 확인창
	function alarm() {
		var msg = "해당 글을 삭제하시겠습니까?";
		if (confirm(msg)) {
			location.href = 'delete?b_no=${board.b_no}';
			return false;
		}
		return true;
	}
	

	

	
</script>