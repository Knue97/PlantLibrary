package kr.co.plantlibrary.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.plantlibrary.report.ReportEntity;

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


	@Override
	public int countPlant() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".countPlant");
	}


	@Override
	public List<Map<String, Object>> plantListPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		 
		return sqlSession.selectList(NAMESPACE + ".plantListPage", data);
	}


	@Override
	public int countReport() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".countReport");
	}


	@Override
	public List<Map<String, Object>> reportListPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub	
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		 
		return sqlSession.selectList(NAMESPACE + ".reportListPage", data);

	}

	@Override
	public ReportEntity reportDetail(int r_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".reportDetail", r_no);
	}


	@Override
	public int updateReportState(int r_no, int r_state) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		  
		data.put("r_no", r_no);
		data.put("r_state", r_state);
		
		return sqlSession.update(NAMESPACE + ".updateReportState", data);
	}

}
