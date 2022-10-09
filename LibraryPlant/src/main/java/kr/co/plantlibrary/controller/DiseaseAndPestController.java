package kr.co.plantlibrary.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.google.gson.Gson;

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
	
	@Autowired
	FileUtil fileUtil;
	
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
	
	// 검색 결과 조회
	@GetMapping(value="encyclopedia/diseaseandpest/search")
	public ModelAndView search(@RequestParam("searchword")String searchWord) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<DiseaseEntity> diseaseList = diseaseService.search(searchWord);
		List<PestEntity> pestList = pestService.search(searchWord);
		
		mav.addObject("diseaseList", diseaseList);
		mav.addObject("pestList", pestList);
		mav.addObject("searchWord", searchWord);
		
		mav.setViewName("encyclopedia/diseaseandpest/search");
		
//		 추가로 pestService.search(searchWord);도 해야함.
//		List<PestEntity> pestList = pestService.search(searchWord);
//		 mav.addObject("pestList", pestList);
		
		return mav;
	}
	
	// 병해 정보 추가하기
	@PostMapping(value="admin/encyclopedia/disease/register")
	public String diseaseRegister(MultipartHttpServletRequest request, @RequestParam("file") MultipartFile[] upload) throws Exception {
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		diseaseEntity.setDi_alias(request.getParameter("di_alias"));
		diseaseEntity.setDi_biologicalControl(request.getParameter("di_biologicalControl"));
		diseaseEntity.setDi_carefulPlant(request.getParameter("di_carefulPlant"));
		diseaseEntity.setDi_cause(request.getParameter("di_cause"));
		diseaseEntity.setDi_descripton(request.getParameter("di_descripton"));
		diseaseEntity.setDi_symptomOfDisease(request.getParameter("di_symptomOfDisease"));
		
		String imgstr = fileUtil.uploadFile(upload, request, "/disease");
		
		diseaseEntity.setDi_image(imgstr);
		int r = diseaseService.register(diseaseEntity);
		
		return "redirect:/admin";
	}
	
	
	// 병해 정보 수정으로가기
	@GetMapping(value="admin/encyclopedia/disease/update")
	public String diseaseUpdate(@RequestParam("di_id")int di_id, Model model) throws Exception {
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		diseaseEntity = diseaseService.detail(di_id);
		model.addAttribute("disease", diseaseEntity);
		
		return "encyclopedia/disease/diseaseupdate";
	}
	
	// 병해 정보 업데이트하기
	@PostMapping(value="admin/encyclopedia/disease/update")
	public String diseaseUpdate(@RequestParam("originalimg")String originalimg, @RequestParam("file") MultipartFile[] upload, MultipartHttpServletRequest request) throws Exception {
		
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		String imgstr = null;
		
		diseaseEntity.setDi_id(Integer.parseInt(request.getParameter("di_id")));
		diseaseEntity.setDi_alias(request.getParameter("di_alias"));
		diseaseEntity.setDi_biologicalControl(request.getParameter("di_biologicalControl"));
		diseaseEntity.setDi_carefulPlant(request.getParameter("di_carefulPlant"));
		diseaseEntity.setDi_cause(request.getParameter("di_cause"));
		diseaseEntity.setDi_descripton(request.getParameter("di_descripton"));
		diseaseEntity.setDi_symptomOfDisease(request.getParameter("di_symptomOfDisease"));
		
		if(!upload[0].isEmpty()) {
			imgstr = fileUtil.uploadFile(upload, request, "/disease");
			fileUtil.deleteFile(request, "/disease", originalimg);
		}else {
			imgstr = originalimg;
		}
		
		diseaseEntity.setDi_image(imgstr);
		
		int r = diseaseService.update(diseaseEntity);
		
		if(r>0)
			System.out.println("업데이트 성공");
		else
			System.out.println("업데이트 실패");
		
		
		return "redirect:/encyclopedia/diseaseandpest";
	}
	
	// 병해 정보 지우기
	@GetMapping(value="admin/encyclopedia/disease/delete")
	public String diseaseDelete(@RequestParam("di_id") int di_id, HttpServletRequest request) throws Exception {
		
		DiseaseEntity diseaseEntity = new DiseaseEntity();
		diseaseEntity = diseaseService.detail(di_id);
		fileUtil.deleteFile(request, "/disease", diseaseEntity.getDi_image());
		int r = diseaseService.delete(di_id);
		
		return "redirect:/encyclopedia/diseaseandpest";
		
		
	}
	
	// 병해정보 등록/수정시 병해명 중복 확인
	@ResponseBody
	@PostMapping(value="encyclopedia/checkDisease")
	int checkDisease(@RequestParam("di_alias")String di_alias) throws Exception {
		return diseaseService.checkDisease(di_alias);
	}
	
	// 병해관련 매핑 끝
	
	
	// 해충백과 매핑 시작
	// ajax 해충 리스트
	@ResponseBody
	@GetMapping(value="encyclopedia/pest/list")
	List<PestEntity> pestList() throws Exception{
		
		return pestService.listAll();
	} 
	
	// 해충백과 상세 목록
	@GetMapping(value="encyclopedia/pest/detail")
	public String pestDetail(@RequestParam("pe_id") int pe_id, Model model) throws Exception {
		
		PestEntity pestEntity = pestService.detail(pe_id);
		model.addAttribute("pest",pestEntity);
		
		return "encyclopedia/pest/detail";
	}
	
	// 해충 정보 추가하기
	@PostMapping(value="admin/encyclopedia/pest/register")
	public String pestRegister(MultipartHttpServletRequest request, @RequestParam("file") MultipartFile[] upload) throws Exception {
		PestEntity pestEntity = new PestEntity();
		
		pestEntity.setPe_biologicalControl(request.getParameter("pe_biologicalControl"));
		pestEntity.setPe_carefulPlant(request.getParameter("pe_carefulPlant"));
		pestEntity.setPe_cause(request.getParameter("pe_cause"));
		pestEntity.setPe_description(request.getParameter("pe_description"));
		pestEntity.setPe_method(request.getParameter("pe_method"));
		pestEntity.setPe_name(request.getParameter("pe_name"));
		pestEntity.setPe_naturalEnemy(request.getParameter("pe_naturalEnemy"));
		
		String imgstr = fileUtil.uploadFile(upload, request, "/pest");
		
		
		pestEntity.setPe_image(imgstr);
		int r = pestService.register(pestEntity);
		
		return "redirect:/admin";
	}
	
	// 해충 업데이트폼으로 가기
	@GetMapping(value="admin/encyclopedia/pest/update")
	public ModelAndView pestUpdate(@RequestParam("pe_id")int pe_id) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		PestEntity pestEntity = new PestEntity();
		pestEntity = pestService.detail(pe_id);
		
		mav.addObject("pest", pestEntity);
		mav.setViewName("encyclopedia/pest/pestupdate");
		
		return mav;
	}
	
	
	// 해충 정보 업데이트하기
	@PostMapping(value="admin/encyclopedia/pest/update")
	public String pestUpdate(@RequestParam("originalimg")String originalimg, @RequestParam("file") MultipartFile[] upload, MultipartHttpServletRequest request) throws Exception {
		
		PestEntity pestEntity = new PestEntity();
		String imgstr = null;
		
		pestEntity.setPe_id(Integer.parseInt(request.getParameter("pe_id")));
		pestEntity.setPe_biologicalControl(request.getParameter("pe_biologicalControl"));
		pestEntity.setPe_carefulPlant(request.getParameter("pe_carefulPlant"));
		pestEntity.setPe_cause(request.getParameter("pe_cause"));
		pestEntity.setPe_description(request.getParameter("pe_description"));
		pestEntity.setPe_method(request.getParameter("pe_method"));
		pestEntity.setPe_name(request.getParameter("pe_name"));
		pestEntity.setPe_naturalEnemy(request.getParameter("pe_naturalEnemy"));
		
		if(!upload[0].isEmpty()) {
			imgstr = fileUtil.uploadFile(upload, request, "/pest");
			fileUtil.deleteFile(request, "/pest", originalimg);
		}else {
			imgstr = originalimg;
		}
		
		pestEntity.setPe_image(imgstr);
		
		int r = pestService.update(pestEntity);
		
		if(r>0)
			System.out.println("업데이트 성공");
		else
			System.out.println("업데이트 실패");
		
		return "redirect:/encyclopedia/diseaseandpest";
	}
	
	// 해충 정보 지우기
	@GetMapping(value="admin/encyclopedia/pest/delete")
	public String pestDelete(@RequestParam("pe_id") int pe_id, HttpServletRequest request) throws Exception {
		
		PestEntity pestEntity = new PestEntity();
		pestEntity = pestService.detail(pe_id);
		fileUtil.deleteFile(request, "/pest", pestEntity.getPe_image());
		int r = pestService.delete(pe_id);
		
		if(r>0)
			System.out.println("해충정보삭제 성공");
		else
			System.out.println("해충정보삭제 실패");
		
		return "redirect:/encyclopedia/diseaseandpest";
	}
	
	// 해충정보 등록/수정시 해충명 중복 확인
	@ResponseBody
	@PostMapping(value="encyclopedia/checkPest")
	int checkPest(@RequestParam("pe_name")String pe_name) throws Exception {
		return pestService.checkPest(pe_name);
	}
	
	
	
	
	
	
}
