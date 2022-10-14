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

	@Override
	public int create(BotanicalGardenVO botanicalGardenVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".create", botanicalGardenVO);
	}

    @Override
    public BotanicalGardenVO listById(int g_id) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne(nameSpace + ".listbyid", g_id);
    }

    @Override
    public int update(int g_id) {
        // TODO Auto-generated method stub
        return sqlSession.update(nameSpace +".update", g_id);
    }

}
