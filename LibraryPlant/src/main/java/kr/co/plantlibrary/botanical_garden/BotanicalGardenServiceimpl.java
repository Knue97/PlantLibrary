package kr.co.plantlibrary.botanical_garden;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class BotanicalGardenServiceimpl implements BotanicalGardenService {
	
	@Setter(onMethod_ = @Autowired)
	private BotanicalGardenDAO dao;
	
	@Override
	public List<BotanicalGardenVO> listBySummary(String g_resion) {
		// TODO Auto-generated method stub
		return dao.listBySummary(g_resion);
	}

	@Override
	public int create(BotanicalGardenVO botanicalGardenVO) {
		// TODO Auto-generated method stub
		return dao.create(botanicalGardenVO);
	}

}
