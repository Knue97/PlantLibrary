package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlantEncyclopediaServiceimpl implements PlantEncyclopediaService {
	
	@Autowired
	private PlantEncyclopediaDAO dao;

	@Override
	public List<EncyclopediaEntity> listAll() {		
		return dao.listAll();
	}

	@Override
	public EncyclopediaEntity listById(int pl_id) {
		return dao.listById(pl_id);
	}

	@Override
	public int create(EncyclopediaEntity encyclopediaEntity) {		
		return dao.create(encyclopediaEntity);
	}

	@Override
	public int getAuto() {
		return dao.getAuto();
	}


	@Override
	public List<EncyclopediaEntity> listByGroup1() {
		// TODO Auto-generated method stub
		return dao.listByGroup1();
	}

	@Override
	public List<EncyclopediaEntity> listByGroup2() {
		// TODO Auto-generated method stub
		return dao.listByGroup2();
	}

	@Override
	public List<EncyclopediaEntity> listByGroup3() {
		// TODO Auto-generated method stub
		return dao.listByGroup3();
	}

	@Override
	public List<EncyclopediaEntity> listByGroup4() {
		// TODO Auto-generated method stub
		return dao.listByGroup4();
	}

	@Override
	public List<EncyclopediaEntity> listByFamilyName(String pl_familyName) {
		// TODO Auto-generated method stub
		return dao.listByFamilyName(pl_familyName);
	}
	
	@Override
	public List<EncyclopediaEntity> listByClassification(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		return dao.listByClassification(map);
	}

	@Override
	public List<EncyclopediaEntity> search(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return dao.search(searchVO);
	}

	@Override
	public int hitsUp(int pl_id) {
		// TODO Auto-generated method stub
		return dao.hitsUp(pl_id);
	}

    @Override
    public int bookMark(int pl_id) {
        // TODO Auto-generated method stub
        return dao.bookMark(pl_id);
    }

    @Override
    public int getBookMark(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return dao.getBookMark(map);
    }
	
	
}
