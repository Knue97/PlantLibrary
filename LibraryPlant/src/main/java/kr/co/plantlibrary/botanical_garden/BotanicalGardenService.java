package kr.co.plantlibrary.botanical_garden;

import java.util.List;

public interface BotanicalGardenService {
	
	//요약 정보 불러오기
	public List<BotanicalGardenVO> listBySummary(String g_resion);
}
