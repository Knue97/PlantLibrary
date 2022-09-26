package kr.co.plantlibrary.modifyrequest;

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

}
