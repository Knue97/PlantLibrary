package kr.co.plantlibrary.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.plantlibrary.botanical_garden.BotanicalGardenService;
import kr.co.plantlibrary.botanical_garden.BotanicalGardenVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/botanicalgarden")
public class BotanicalGardenController {
	
	@Setter(onMethod_ = @Autowired)
	private BotanicalGardenService service;
	
	@GetMapping("/navermap")
	public String botanicalGardenNaverMap(Model model) {
		log.info("======================Botanical Garden Naver Map=================");
		
		//for문 정리
		List<BotanicalGardenVO> list1 = service.listBySummary("서울");
		List<BotanicalGardenVO> list2 = service.listBySummary("경기");
		List<BotanicalGardenVO> list3 = service.listBySummary("부산");
		List<BotanicalGardenVO> list4 = service.listBySummary("인천");
		List<BotanicalGardenVO> list5 = service.listBySummary("광주");
		List<BotanicalGardenVO> list6 = service.listBySummary("대구");
		List<BotanicalGardenVO> list7 = service.listBySummary("대전");
		List<BotanicalGardenVO> list8 =service.listBySummary("울산");
		List<BotanicalGardenVO> list9 = service.listBySummary("강원");
		List<BotanicalGardenVO> list10 = service.listBySummary("제주");		
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);
		model.addAttribute("list10", list10);
		
		return "botanicalGarden/botanical_garden_map";
	}
	
	@GetMapping("/register")
	public String botanicalGardenRegisterForm() {
		log.info("=====================Botanical Garden RegisterForm=================");
		
		return "botanicalGarden/botanical_gardenregister";
		
	}
	
	@PostMapping("/register")
	public String botanicalGardenRegister(BotanicalGardenVO botanicalGardenVO) {
		log.info("=====================Botanical Garden Registger==================");
		int r = service.create(botanicalGardenVO);
		
		return "redirect:/";
	}		
	
	@GetMapping("/listbyid")
	public String botanicalGardenListById(@RequestParam("g_id") int g_id, Model model) {
	    log.info("=====================Botanical Garden Listbyid======================");
	    BotanicalGardenVO vo = service.listById(g_id);
	    
	    model.addAttribute("VO", vo);
	    
	    return "botanicalGarden/botanical_garden";
	}
	
	@GetMapping("/update")
	public String BotanicalGardenUpdate(BotanicalGardenVO vo, Model model) {
	    log.info("=========================Botanical Garden UpdateForm=====================");	    
        
        
        model.addAttribute("VO", vo);
        return "botanicalGarden/botanical_gardenupdate";
	}
	
	@PostMapping("/update")
	public String BotanicalGardenUpdate(BotanicalGardenVO vo) {
	    log.info("=======================BOtanical Garden ");
	    log.info(vo);
	    int r = service.update(vo.getG_id());
	    
	    return "redirect:/";
	}
}
