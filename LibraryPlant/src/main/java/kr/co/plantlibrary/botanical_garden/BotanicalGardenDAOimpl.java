package kr.co.plantlibrary.botanical_garden;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.Setter;

@Repository
public class BotanicalGardenDAOimpl implements BotanicalGardenDAO {

	@Setter(onMethod_ = @Autowired)
	private SqlSession sqlSession;
	
	private String nameSpace = "kr.co.plantlibrary.botanical_garden";
	
	@Override
	public List<BotanicalGardenVO> listBySummary(String g_resion) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listbysummary", g_resion);
	}

}
