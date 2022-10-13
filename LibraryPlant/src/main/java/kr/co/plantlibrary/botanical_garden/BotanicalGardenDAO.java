package kr.co.plantlibrary.botanical_garden;

import java.util.List;

public interface BotanicalGardenDAO {
    
    //지역별 식물원 조회
	public List<BotanicalGardenVO> listBySummary(String g_resion);
	
	//식물원 추가
	public int create(BotanicalGardenVO botanicalGardenVO);
	
	//개별 식물원 조회
	public BotanicalGardenVO listById(int g_id);
	
	//식물원 수정
	public int update(int g_id);
}
