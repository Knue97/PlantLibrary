package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlantEncyclopediaimpl implements PlantEncyclopediaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String nameSpace = "kr.co.plantlibrary.plant_encyclopedia";
	
	@Override
	public List<EncyclopediaEntity> listAll() {
		return sqlSession.selectList(nameSpace + ".listall");
	}

	@Override
	public EncyclopediaEntity listById(int pl_id) {		 
		return sqlSession.selectOne(nameSpace + ".listbyid", pl_id);
	}

	@Override
	public int create(EncyclopediaEntity encyclopediaEntity) {
		return sqlSession.insert(nameSpace + ".create", encyclopediaEntity);
	}

	@Override
	public int getAuto() {
		return sqlSession.selectOne(nameSpace+".getAuto");
	}

	@Override
	public List<EncyclopediaEntity> listByFamilyName(String pl_familyName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listbyfamilyname", pl_familyName);
	}

	@Override
	public List<EncyclopediaEntity> listByGroup1() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listbygroup1");
	}

	@Override
	public List<EncyclopediaEntity> listByGroup2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listbygroup2");
	}

	@Override
	public List<EncyclopediaEntity> listByGroup3() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listbygroup3");
	}
}
