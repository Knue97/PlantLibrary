package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;
import java.util.Map;

public interface PlantEncyclopediaDAO {
	public List<EncyclopediaEntity> listAll();
	
	public EncyclopediaEntity listById(int pl_id);
	
	public int create(EncyclopediaEntity encyclopediaEntity);
	
	public int getAuto();
	
	public List<EncyclopediaEntity> listByFamilyName(String pl_familyName);
	
	public List<EncyclopediaEntity> listByClassification(Map<Object, Object> map);
	
	//관엽
	public List<EncyclopediaEntity> listByGroup1();
	
	//다육	
	public List<EncyclopediaEntity> listByGroup2();
	
	//화초
	public List<EncyclopediaEntity> listByGroup3();
	
	//허브
	public List<EncyclopediaEntity> listByGroup4();
}
