package kr.co.plantlibrary.pest_encyclopedia;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PestDAOImpl implements PestDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "kr.co.plantlibrary.pestMapper";

	@Override
	public List<PestEntity> listAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public List<PestEntity> highHits() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".highhits");
	}

	@Override
	public PestEntity detail(int pe_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".detail", pe_id);
	}

	@Override
	public List<PestEntity> search(String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".search", searchWord);
	}

	@Override
	public int updateHits(int pe_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".updateHits", pe_id);
	}

	@Override
	public int register(PestEntity PestEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".register", PestEntity);
	}

	@Override
	public int update(PestEntity PestEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".update", PestEntity);
	}

	@Override
	public int delete(int pe_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".delete", pe_id);
	}

	@Override
	public int checkPest(String pe_name) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".checkpest", pe_name);
	}


}
