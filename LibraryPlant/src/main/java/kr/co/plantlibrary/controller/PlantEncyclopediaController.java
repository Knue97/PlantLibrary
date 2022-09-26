package kr.co.plantlibrary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.plantlibrary.plant_encyclopedia.Constant;
import kr.co.plantlibrary.plant_encyclopedia.Criteria;
import kr.co.plantlibrary.plant_encyclopedia.EncyclopediaEntity;
import kr.co.plantlibrary.plant_encyclopedia.PageMaker;
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
		List<EncyclopediaEntity> group4 = service.listByGroup4();
		
		model.addAttribute("group1", group1);
		model.addAttribute("group2", group2);
		model.addAttribute("group3", group3);
		model.addAttribute("group4", group4);
				
		return "encyclopedia/plant/listgroup";
	}
	
	@GetMapping("/plant/list")
	public String plantList(@RequestParam String pl_classification,Criteria criteria, Model model) {
		log.info("=================Plant List=================");
		log.info(criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(1000);
		log.info(pageMaker);
		
		Map<Object,Object> map = new HashMap<Object, Object>();
		map.put("pl_classification", pl_classification);
		map.put("pageStart", criteria.getPageStart() );
		map.put("perPageNum", criteria.getPerPageNum());
		
		List<EncyclopediaEntity> group = service.listByClassification(map);
		
		model.addAttribute("group", group);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pl_classification",pl_classification);
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
