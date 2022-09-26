package kr.co.plantlibrary.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.disease_encyclopedia.DiseaseEntity;
import kr.co.plantlibrary.disease_encyclopedia.DiseaseService;
import kr.co.plantlibrary.pest_encyclopedia.PestEntity;
import kr.co.plantlibrary.pest_encyclopedia.PestService;
import kr.co.plantlibrary.util.FileUtil;

@Controller
public class DiseaseAndPestController {
	
	@Autowired
	DiseaseService diseaseService;
	
	@Autowired
	PestService pestService;
	
	private static final Logger logger = LoggerFactory.getLogger(DiseaseAndPestController.class);
	
	
	// 병해&해충백과 목록 조회 페이지 가기
	@GetMapping(value="encyclopedia/diseaseandpest")
	public String listAll(Model model) throws Exception{
		logger.info("===list===");
		model.addAttribute("popularDisease", diseaseService.highHits());
		model.addAttribute("popularPest", pestService.highHits());
	
		return "encyclopedia/diseaseandpest/list";
	} // 병해충백과 메인페이지 매핑 끝
	
	
	// 병해백과 매핑 시작
	// 병해백과 ajax 목록 조회
	@ResponseBody
	@GetMapping(value="encyclopedia/disease/list")
	public List<DiseaseEntity> diseaseList() throws Exception {
		
		return diseaseService.listAll();
	}
	
	// 병해백과 상세 목록
	@GetMapping(value="encyclopedia/disease/detail")
	public String diseaseDetail(@RequestParam("di_id") int di_id, Model model) throws Exception {
		
		DiseaseEntity diseaseEntity = diseaseService.detail(di_id);
		model.addAttribute("disease",diseaseEntity);
		
		return "encyclopedia/disease/detail";
	}
	
	@GetMapping(value="encyclopedia/modifyrequest")
	public String requestModify(@RequestParam("mr_name") String mr_name) {
		return "encyclopedia/modifyrequest";
	}
	
	
	// 검색 결과 조회
	@GetMapping(value="encyclopedia/diseaseandpest/search")
	public ModelAndView search(@RequestParam("searchword")String searchWord) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<DiseaseEntity> diseaseList = diseaseService.search(searchWord);
		List<PestEntity> pestList = pestService.search(searchWord);
		
		mav.addObject("diseaseList", diseaseList);
		mav.addObject("pestList", pestList);
		
		mav.setViewName("encyclopedia/diseaseandpest/search");
		
//		 추가로 pestService.search(searchWord);도 해야함.
//		List<PestEntity> pestList = pestService.search(searchWord);
//		 mav.addObject("pestList", pestList);
		
		return mav;
	}
	
	// 정보추가로 가기
	@GetMapping(value="encyclopedia/disease/register")
	public String register() {
		return "encyclopedia/disease/register";
	}
	
	// 병해 정보 추가하기
	@PostMapping(value="encyclopedia/disease/register")
	public String register(MultipartHttpServletRequest request, @RequestParam("file") MultipartFile[] upload) throws Exception {
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		diseaseEntity.setDi_alias(request.getParameter("di_alias"));
		diseaseEntity.setDi_biologicalControl(request.getParameter("di_biologicalControl"));
		diseaseEntity.setDi_carefulPlant(request.getParameter("di_carefulPlant"));
		diseaseEntity.setDi_cause(request.getParameter("di_cause"));
		diseaseEntity.setDi_descripton(request.getParameter("di_descripton"));
		diseaseEntity.setDi_symptomOfDisease(request.getParameter("di_symptomOfDisease"));
		
		
		FileUtil fileUtil = new FileUtil();
		String imgstr = fileUtil.uploadFile(upload, request, 20);
		
		diseaseEntity.setDi_image(imgstr);
		int r = diseaseService.register(diseaseEntity);
		
		return "redirect:/";
	}
	
	
	// 병해 정보 수정으로가기
	@GetMapping(value="encyclopedia/disease/update")
	public String update(@RequestParam("di_id")int di_id, Model model) throws Exception {
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		diseaseEntity = diseaseService.detail(di_id);
		model.addAttribute("disease", diseaseEntity);
		
		return "encyclopedia/disease/update";
	}
	
	// 병해 정보 업데이트하기
	@PostMapping(value="encyclopedia/disease/update")
	public String update(DiseaseEntity diseaseEntity) throws Exception {
		
		int r = diseaseService.update(diseaseEntity);
		
		return "redirect:/";
	}
	
	// 병해 정보 지우기
	@GetMapping(value="encyclopedia/disease/delete")
	public String delete(@RequestParam("di_id") int di_id) throws Exception {
		
		int r = diseaseService.delete(di_id);
		
		return "redirect:/";
		
		
	} // 병해관련 매핑 끝
	
	
	// 해충백과 매핑 시작
	// ajax 해충 리스트
	@ResponseBody
	@GetMapping(value="encyclopedia/pest/list")
	List<PestEntity> pestList() throws Exception{
		
		return pestService.listAll();
	} 
	
	// 병해백과 상세 목록
	@GetMapping(value="encyclopedia/pest/detail")
	public String pestDetail(@RequestParam("pe_id") int pe_id, Model model) throws Exception {
		
		PestEntity pestEntity = pestService.detail(pe_id);
		model.addAttribute("pest",pestEntity);
		
		return "encyclopedia/pest/detail";
	}

}
