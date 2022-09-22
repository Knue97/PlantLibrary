package kr.co.plantlibrary.board;

import lombok.Data;

@Data
public class Criteria {
	private int page;	//	현재 페이지 번호
	private int perPageNum;		// 한 페이지당 보여줄 게시글의 개수
	
//	검색에 필요한 키워드 선언
	private String searchKeyword;	// 검색어
	private String searchType; // 검색 타입
	
	
	public int getPageStart() {	// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
		return (this.page-1) * perPageNum;
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}
	
}
