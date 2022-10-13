package kr.co.plantlibrary.like;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardLikeDAOImpl implements BoardLikeDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "kr.co.plantlibrary.likeMapper";

	@Override
	public int isliked(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".isliked", map);
	}

	@Override
	public int addLike(BoardLikeEntity boardLikeEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".addLike", boardLikeEntity);
	}

	@Override
	public int removeLike(BoardLikeEntity boardLikeEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".removeLike", boardLikeEntity);
	}

//	 해당 게시글 좋아요 전체 취소(게시글 삭제시)
    @Override
    public int removeLikeAll(int b_no) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.delete(NAMESPACE + ".removeLikeAll", b_no);
    }

//  게시글 좋아요 총 개수
    @Override
    public int likeCountAll(BoardLikeEntity boardLikeEntity) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.update(NAMESPACE + ".likeCountAll", boardLikeEntity);
    }
    
	

}
