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

    @Override
    public int removeLikeAll(int b_no) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.delete(NAMESPACE + ".removeLikeAll", b_no);
    }

    @Override
    public int likeCountAll(int b_no) throws Exception {
        // TODO Auto-generated method stub
        return sqlSession.selectOne(NAMESPACE + ".likeCountAll", b_no);
    }
	

}
