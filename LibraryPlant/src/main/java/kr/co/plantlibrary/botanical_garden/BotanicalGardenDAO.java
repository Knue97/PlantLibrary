package kr.co.plantlibrary.botanical_garden;

import java.util.List;

public interface BotanicalGardenDAO {

	public List<BotanicalGardenVO> listBySummary(String g_resion);
	
	public int create(BotanicalGardenVO botanicalGardenVO);
}
