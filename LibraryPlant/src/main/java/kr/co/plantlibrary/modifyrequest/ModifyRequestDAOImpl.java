package kr.co.plantlibrary.modifyrequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ModifyRequestDAOImpl implements ModifyRequestDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "kr.co.plantlibrary.modifyRequestMapper";
	
	@Override
	public int register(ModifyRequestEntity modifyRequestEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".register", modifyRequestEntity);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".count");
	}

	@Override
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sqlSession.selectList(NAMESPACE + ".listPage", data);
	}

	@Override
	public String getName(Map<String,Integer> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".getName", map);
	}

	@Override
	public ModifyRequestEntity detail(int mr_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".detail", mr_no);
	}

	@Override
	public int delete(int mr_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE + ".delete", mr_no);
	}

}
