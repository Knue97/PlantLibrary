package kr.co.plantlibrary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.plantlibrary.botanical_garden.BotanicalGardenService;
import kr.co.plantlibrary.botanical_garden.BotanicalGardenVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/botanicalgarden")
public class BotanicalGarden {
	
	@Setter(onMethod_ = @Autowired)
	private BotanicalGardenService service;
	
	@GetMapping("/navermap")
	public String botanicalGardenNaverMap(Model model) {
		log.info("======================Botanical Garden Naver Map=================");
		
		List<BotanicalGardenVO> list1 = service.listBySummary("서울");
		List<BotanicalGardenVO> list2 = service.listBySummary("경기도");
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "botanicalGarden/botanical_garden_map";
	}
}
