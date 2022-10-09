package kr.co.plantlibrary.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	SqlSession sqlSession;
	private static final String NAMESPACE = "kr.co.plantlibrary.adminMapper";
	
	
	@Override
	public int countDisease() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".countDisease");
	}


	@Override
	public List<Map<String, Object>> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		 
		return sqlSession.selectList(NAMESPACE + ".diseaseListPage", data);
	}

}
