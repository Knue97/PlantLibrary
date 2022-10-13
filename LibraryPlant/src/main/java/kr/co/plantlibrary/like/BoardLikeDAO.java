package kr.co.plantlibrary.like;

import java.util.Map;


public interface BoardLikeDAO {


	// 해당 유저, 해당 게시글 좋아요 정보 가져오기(좋아요 = 1, 안좋아요 = 0)
	public int isliked(Map<String, Object> map) throws Exception;
	
	// 게시글 좋아요 + 1
	public int addLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	// 게시글 좋아요 - 1
	public int removeLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	// 해당 게시글 좋아요 전체 취소(게시글 삭제시)
    public int removeLikeAll(int b_no) throws Exception;
    
    //  좋아요 총 개수 확인
    public int likeCountAll(BoardLikeEntity boardLikeEntity) throws Exception;
    
}
