package kr.co.plantlibrary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.plantlibrary.plant_encyclopedia.Constant;
import kr.co.plantlibrary.plant_encyclopedia.EncyclopediaEntity;
import kr.co.plantlibrary.plant_encyclopedia.PlantEncyclopediaService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/encyclopedia")
@Log4j
public class PlantEncyclopediaController {
	
	@Setter(onMethod_ = @Autowired )
	private PlantEncyclopediaService service;
	
	@GetMapping("home")
	public String home() {
		log.info("=================Encyclopedia Home====================");
		
		return "encyclopedia/integrate_search";
	}
	
	@GetMapping("/plant/listgroup")
	public String plantListgroup(Model model) {
		log.info("=================Plant Listgroup=================");
		
		List<EncyclopediaEntity> group1 = service.listByGroup1();
		List<EncyclopediaEntity> group2 = service.listByGroup2();
		List<EncyclopediaEntity> group3 = service.listByGroup3();				
		
		model.addAttribute("group1", group1);
		model.addAttribute("group2", group2);
		model.addAttribute("group3", group3);
				
		return "encyclopedia/plant/listgroup";
	}
	
	@GetMapping("/plant/list")
	public String plantList(@ModelAttribute("type") String type) {
		log.info("=================Plant List=================");
		
		return "encyclopedia/plant/list";
	}
	
	@GetMapping("/plant/detail")
	public String plant(@RequestParam("pl_id") int pl_id, Model model) {
		log.info("================Encyclopedia Plant=====================");
		EncyclopediaEntity entity = service.listById(pl_id);
		Constant constant = new Constant();
		log.info(entity);
		log.info(constant);
		model.addAttribute("entity", entity);
		model.addAttribute("constant", constant);
		return "encyclopedia/plant/detail";
	}
	
	@GetMapping("/plant/register")
	public String plantRegisterForm() {
		log.info("=================Plant RegisterForm==============");

		return "encyclopedia/plant/register";
	}
	
	@PostMapping("/plant/register")
	public String plantRegister(EncyclopediaEntity encyclopediaEntity, Model model) {
		log.info("=================Plant Register===================");
		
		int r = service.create(encyclopediaEntity);
		
		log.info("================== register reuslt : "+ r + "=================" );
		
		model.addAttribute("entity", encyclopediaEntity);
		return "encyclopedia/plant/regresult";
	}
}
