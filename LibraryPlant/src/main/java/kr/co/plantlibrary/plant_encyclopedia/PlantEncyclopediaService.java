package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;

public interface PlantEncyclopediaService {

	public List<EncyclopediaEntity> listAll();

	public EncyclopediaEntity listById(int pl_id);

	public int create(EncyclopediaEntity encyclopediaEntity);

	public int getAuto();

	public List<EncyclopediaEntity> listByFamilyName(String pl_familyName);

	// 천남성과
	public List<EncyclopediaEntity> listByGroup1();

	// 야자과
	public List<EncyclopediaEntity> listByGroup2();

	// 두릅나무과
	public List<EncyclopediaEntity> listByGroup3();
}
