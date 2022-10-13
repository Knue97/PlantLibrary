package kr.co.plantlibrary.like;

import java.util.Map;


public interface BoardLikeService {
	
	// 해당 유저, 해당 게시글 좋아요 정보 가져오기(좋아요 = 1, 안좋아요 = 0)
	public int isliked(Map<String, Object> map) throws Exception;
	
	// 게시글 좋아요 + 1
	public int addLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	// 게시글 좋아요 - 1
	public int removeLike(BoardLikeEntity boardLikeEntity) throws Exception;
	
	
}
