<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


	<c:if test="${pageMaker.cri.searchKeyword != null}">
		<div class="box">
			<h3>
				"<strong>${pageMaker.cri.searchKeyword}</strong>"에 해당하는 게시글이 없습니다.
			</h3>
			<p></p>
			<ul>
				<li>&nbsp;▹입력하신 단어의 철자가 정확한지 확인해 보세요.</li>
				<li>&nbsp;▹검색어의 단어 수를 줄이거나, 보다 일반적인 단어로 검색해 보세요.</li>
			</ul>
		</div>
		<p></p>
	
		<div align="center">		
			<h2><a href="${contextPath}/board/freeListAll">처음으로 돌아가기</a></h2>
		</div>
	</c:if>
	