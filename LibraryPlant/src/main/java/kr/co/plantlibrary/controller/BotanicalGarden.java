package kr.co.plantlibrary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/botanicalgarden")
public class BotanicalGarden {
	
	@GetMapping("/navermap")
	public String botanicalGardenNaverMap() {
		log.info("======================Botanical Garden Naver Map=================");
		
		return "botanicalGarden/botanical_garden_map";
	}
}
