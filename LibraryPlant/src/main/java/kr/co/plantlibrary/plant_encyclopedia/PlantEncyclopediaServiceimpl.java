package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;

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
	public List<EncyclopediaEntity> listByFamilyName(String pl_familyName) {
		// TODO Auto-generated method stub
		return dao.listByFamilyName(pl_familyName);
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
	
	
}
