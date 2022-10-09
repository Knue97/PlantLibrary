package kr.co.plantlibrary.disease_encyclopedia;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiseaseDAOImpl implements DiseaseDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE = "kr.co.plantlibrary.diseaseMapper";
	
	@Override
	public List<DiseaseEntity> listAll() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}
	
	@Override
	public List<DiseaseEntity> highHits() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".highhits");
	}

	@Override
	public DiseaseEntity detail(int di_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".detail", di_id);
	}

	@Override
	public List<DiseaseEntity> search(String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".search", searchWord);
	}

	@Override
	public int updateHits(int di_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".updateHits", di_id);
	}

	@Override
	public int register(DiseaseEntity diseaseEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".register", diseaseEntity);
	}

	@Override
	public int update(DiseaseEntity diseaseEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + ".update", diseaseEntity);
	}

	@Override
	public int delete(int di_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".delete", di_id);
	}

	@Override
	public List<Map<String, Object>> aliasList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".aliasList");
	}

	@Override
	public int checkDisease(String di_alias) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".checkdisease", di_alias);
	}




}
