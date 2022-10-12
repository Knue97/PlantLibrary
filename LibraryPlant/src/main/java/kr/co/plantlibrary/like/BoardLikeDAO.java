package kr.co.plantlibrary.like;

import java.util.Map;


public interface BoardLikeDAO {


	// 해당 유저, 해당 페이지 북마크 정보 가져오기(했다면1, 하지않았다면0 값이 나옴)
	public int isliked(Map<String, Object> map) throws Exception;
	
	// 해당 페이지 목록 북마크 추가
	public int addLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	// 해당 페이지 목록 북마크 제거
	public int removeLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	// 해당 게시글 좋아요 전체 취소(게시글 삭제시)
    public int removeLikeAll(int b_no) throws Exception;
    
    // 좋아요 총 개수 확인
    public int likeCountAll(int b_no) throws Exception;
}
