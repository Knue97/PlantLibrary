package kr.co.plantlibrary.report;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "kr.co.plantlibrary.reportMapper";
	
	@Override
	public int register(ReportEntity reportEntity) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE + ".register", reportEntity);
	}

}
