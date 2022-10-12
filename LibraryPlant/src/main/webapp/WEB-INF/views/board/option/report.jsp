<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  outline: none; }
  button:hover {
    background: inherit;
    color: #2e8b57;
    border-bottom: 2px solid #2e8b57; }
</style>
	

		
		<c:if test="${board.u_id != user.u_id}">
		<button id="report"> 신고 </button>
		</c:if>




<script>

// 신고페이지 이동
	$('#report').on('click', function(e) {
		e.preventDefault();
		
		if ('${user}' == "") {
			alert('로그인 후 이용해주세요.');
			
			return alarmLogin();
	
		}
		
		var url = "${contextPath }/board/reportPage";
		url = url + "?b_no=" + ${board.b_no};
		url = url + "&u_id=${board.u_id}";
		url = url + "&b_title=${board.b_title}";
		location.href = encodeURI(url);
		console.log(encodeURI(url));
	
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


</script>

