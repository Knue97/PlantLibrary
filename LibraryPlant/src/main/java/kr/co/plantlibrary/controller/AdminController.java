package kr.co.plantlibrary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.admin.AdminService;
import kr.co.plantlibrary.disease_encyclopedia.DiseaseEntity;
import kr.co.plantlibrary.disease_encyclopedia.DiseaseService;
import kr.co.plantlibrary.login.LoginEntity;
import kr.co.plantlibrary.pest_encyclopedia.PestEntity;
import kr.co.plantlibrary.pest_encyclopedia.PestService;
import kr.co.plantlibrary.plant_encyclopedia.EncyclopediaEntity;
import kr.co.plantlibrary.plant_encyclopedia.PlantEncyclopediaService;
import kr.co.plantlibrary.plant_encyclopedia.SearchVO;
import kr.co.plantlibrary.report.ReportEntity;
import kr.co.plantlibrary.report.ReportService;
import kr.co.plantlibrary.util.FileUtil;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	DiseaseService diseaseService;
	
	@Autowired
	PestService pestService;
	
	@Autowired
	PlantEncyclopediaService plantService;
	
	@Autowired
	FileUtil fileUtil;
	

	// 어드민 페이지
	@GetMapping(value = "admin")
	public String admin() {
		return "admin/adminindex";
	}

	// 백과사전 등록 폼
	@GetMapping(value = "admin/encyclopedia/register")
	public String encyclopediaRegister() {
		return "admin/encyclopedia/register";
	}

	// select option으로 항목 선택시 업로드(register) 폼 불러오기
	@GetMapping(value = "admin/encyclopedia/plantregister")
	public String plantregister() {
		return "admin/encyclopedia/plantregister";
	}

	@GetMapping(value = "admin/encyclopedia/diseaseregister")
	public String diseaseregister() {
		return "admin/encyclopedia/diseaseregister";
	}

	@GetMapping(value = "admin/encyclopedia/pestregister")
	public String pestregister() {
		return "admin/encyclopedia/pestregister";
	}
	
	
	// 백과수정 페이지 이동
	@GetMapping(value = "admin/encyclopedia")
	public String encyclopediaUpdate() {
		return "admin/encyclopedia/list";
	}

	// 병해백과 목록 + 페이징 추가
	@GetMapping(value = "admin/encyclopedia/disease")
	public String getListPage(Model model, @RequestParam("num") int num) throws Exception {

		// 게시물 총 개수
		int count = adminService.countDisease();

		// 한 페이지에 출력할 게시물 개수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 개수 ÷ 한 페이지에 출력할 개수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 한번에 표시할 페이징 번호의 개수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<Map<String, Object>> list = null;
		list = adminService.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);

		return "admin/encyclopedia/diseaselist";
	}
	
	// 식물백과 목록 + 페이징 추가
	@GetMapping(value = "admin/encyclopedia/plant")
	public String getPlantListPage(Model model, @RequestParam("num") int num) throws Exception {

		// 게시물 총 개수
		int count = adminService.countPlant();

		// 한 페이지에 출력할 게시물 개수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 개수 ÷ 한 페이지에 출력할 개수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 한번에 표시할 페이징 번호의 개수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<Map<String, Object>> list = null;
		list = adminService.plantListPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);

		return "admin/encyclopedia/plantlist";
	}
	
	// 신고목록 + 페이징 추가
	@GetMapping(value = "admin/report")
	public String getReportListPage(Model model, @RequestParam("num") int num) throws Exception {

		// 게시물 총 개수
		int count = adminService.countReport();

		// 한 페이지에 출력할 게시물 개수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 개수 ÷ 한 페이지에 출력할 개수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 한번에 표시할 페이징 번호의 개수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<Map<String, Object>> list = null;
		list = adminService.reportListPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", num);

		return "admin/report/reportlist";
	}
	
	// 신고개수 카운팅
	@ResponseBody
	@GetMapping(value="admin/report/count")
	public int count() throws Exception {
		return adminService.countReport();
	}
	
	// 신고내용 상세보기
	@GetMapping(value="admin/report/detail")
	public ModelAndView reportDetail(@RequestParam("r_no") int r_no) throws Exception {
		ReportEntity reportEntity = new ReportEntity();
		reportEntity = adminService.reportDetail(r_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", reportEntity);
		mav.setViewName("admin/report/reportdetail");
		return mav;
	}
	
	// 신고처리상태 업데이트
	@ResponseBody
	@PostMapping(value="admin/report/updatestate")
	public int updateReportState(@RequestParam("r_no") int r_no, @RequestParam("r_state") int r_state, HttpServletRequest request) throws Exception {

		// 처리완료상태면 첨부파일도 삭제
		if(r_state == 2) {
		    
		    ReportEntity reportEntity = new ReportEntity();
		    reportEntity = adminService.reportDetail(r_no);
		    fileUtil.deleteFile(request, "/reportPage", reportEntity.getR_file());

			
		}
		
		return adminService.updateReportState(r_no, r_state);
	}
	
	// 식물원 정보등록
	@GetMapping(value="admin/botanicalgarden/register")
	public String registerBoticalgarden() {
		return "botanicalGarden/botanical_gardenregister";
	}
    
    // 회원관리 이동 + 페이징
    @GetMapping(value = "admin/user")
    public String getUserListPage(Model model, @RequestParam("num") int num) throws Exception {

        // 게시물 총 개수
        int count = adminService.countUser();

        // 한 페이지에 출력할 게시물 개수
        int postNum = 10;

        // 하단 페이징 번호 ([ 게시물 총 개수 ÷ 한 페이지에 출력할 개수 ]의 올림)
        int pageNum = (int) Math.ceil((double) count / postNum);

        // 출력할 게시물
        int displayPost = (num - 1) * postNum;

        // 한번에 표시할 페이징 번호의 개수
        int pageNum_cnt = 10;

        // 표시되는 페이지 번호 중 마지막 번호
        int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

        // 표시되는 페이지 번호 중 첫번째 번호
        int startPageNum = endPageNum - (pageNum_cnt - 1);

        // 마지막 번호 재계산
        int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

        if (endPageNum > endPageNum_tmp) {
            endPageNum = endPageNum_tmp;
        }
        
        boolean prev = startPageNum == 1 ? false : true;
        boolean next = endPageNum * pageNum_cnt >= count ? false : true;
        
        
        List<Map<String, Object>> list = null;
        list = adminService.userListPage(displayPost, postNum);
        model.addAttribute("list", list);
        model.addAttribute("pageNum", pageNum);
        
        // 시작 및 끝 번호
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);

        // 이전 및 다음 
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        
        // 현재 페이지
        model.addAttribute("select", num);

        return "admin/user/userlist";
    }
    
    // 회원 삭제
    @ResponseBody
    @PostMapping(value="admin/user/delete")
    public int deleteUser(@RequestParam("u_id") String u_id) throws Exception {
        return adminService.deleteUser(u_id);
    }
    
    //회원 등급 변경(일반/관리자)
    @ResponseBody
    @PostMapping(value="admin/user/updatestate")
    public int deleteUser(@RequestParam("u_id") String u_id, @RequestParam("u_state") int u_state) throws Exception {
        return adminService.updateUserState(u_id, u_state);
    }
    
    // 회원 아이디, 닉네임, 이름으로 검색
    @ResponseBody
    @GetMapping(value="admin/search/user")
    public List<LoginEntity> searchUser(@RequestParam("searchword") String searchword) throws Exception{
        return adminService.searchUser(searchword);
    }
    
    // 해충 검색
    @ResponseBody
    @GetMapping(value="admin/search/pest")
    public List<PestEntity> searchPest(@RequestParam("searchword") String searchword) throws Exception{
        return pestService.search(searchword);
    }
    
    // 병해 검색
    @ResponseBody
    @GetMapping(value="admin/search/disease")
    public List<DiseaseEntity> searchDisease(@RequestParam("searchword") String searchword) throws Exception{
        return diseaseService.search(searchword);
    }
    
    // 식물 검색
    @ResponseBody
    @GetMapping(value="admin/search/plant")
    public List<EncyclopediaEntity> searchPlant(@RequestParam("searchword") String searchword) throws Exception{
        SearchVO searchVO = new SearchVO();
        searchVO.setValue(searchword);
        
        return plantService.search(searchVO);
    }
    
    // 식물변경 폼 이동
    @GetMapping(value="admin/encyclopedia/plant/update")
    public ModelAndView updatePlant(@RequestParam("pl_id") int pl_id) {
        
        ModelAndView mav = new ModelAndView();
        EncyclopediaEntity plant = new EncyclopediaEntity();
        plant = plantService.listById(pl_id);
        
        
        mav.addObject("plant", plant);
        mav.setViewName("encyclopedia/plant/plantupdate");
        
        return mav;
    }
    
    // 식물 변경
    @ResponseBody
    @PostMapping(value="admin/encyclopedia/plant/update")
    public int updatePlant(@RequestParam("plant") EncyclopediaEntity plant) throws Exception {
        
        return adminService.updatePlant(plant);
    }
    
    // 식물 삭제
    @ResponseBody
    @GetMapping(value="admin/encyclopedia/plant/delete")
    public int deletePlant(@RequestParam("pl_id") int pl_id) throws Exception {
        
        return adminService.deletePlant(pl_id);
    }
    
    
    // About us 페이지 이동
    @GetMapping(value="aboutus")
    public String aboutUs() {
        return "aboutus";
    }
}
