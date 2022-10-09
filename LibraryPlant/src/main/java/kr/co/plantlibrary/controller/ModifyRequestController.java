package kr.co.plantlibrary.controller;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.modifyrequest.ModifyRequestEntity;
import kr.co.plantlibrary.modifyrequest.ModifyRequestService;
import kr.co.plantlibrary.util.FileUtil;

@Controller
public class ModifyRequestController {
	
	@Autowired
	ModifyRequestService modifyRequestService;
	
	@Autowired
	FileUtil fileUtil;
	
	// 사용자가 수정요청 폼으로 가기
	@GetMapping(value="encyclopedia/modifyrequest")
	public String requestModify(@RequestParam("mr_name") String mr_name, @RequestParam("ec_id") String ec_id, @RequestParam("name") String name) {
		return "encyclopedia/modifyrequest";
	}
	
	
	// 수정요청폼 내역 DB전송
	@PostMapping(value="encyclopedia/modifyrequest")
	public ModelAndView register(ModifyRequestEntity modifyRequestEntity, MultipartHttpServletRequest request, @RequestParam("file") MultipartFile[] upload) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		String imgstr = fileUtil.uploadFile(upload, request, "/modifyrequest");
		
		modifyRequestEntity.setMr_file(imgstr);
		int r = modifyRequestService.register(modifyRequestEntity);
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	// 수정요청 목록 불러오기 + 페이징
	@GetMapping(value="admin/modifyrequest")
	public String getListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		int count = modifyRequestService.count();
		int postNum = 10;
		int pageNum = (int) Math.ceil((double) count / postNum);
		int displayPost = (num - 1) * postNum;
		int pageNum_cnt = 10;
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		List<Map<String,Object>> list = null;
		list = modifyRequestService.listPage(displayPost, postNum);
		
		for(int i=0; i<list.size(); i++) {
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			int ec_id = (int)(list.get(i).get("ec_id"));
			int mr_name = (int)(list.get(i).get("mr_name"));
			
			map.put("ec_id", ec_id);
			map.put("mr_name", mr_name);
			
			list.get(i).put("name", modifyRequestService.getName(map));
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		model.addAttribute("select", num);

		return "admin/modifyrequest/modifyrequestlist";

	}
	
	// 수정요청 상세보기
	@GetMapping(value="admin/modifyrequest/detail")
	public ModelAndView detail(@RequestParam("mr_no") int mr_no) throws Exception {
		
		ModifyRequestEntity modifyRequestEntity = new ModifyRequestEntity();
		modifyRequestEntity = modifyRequestService.detail(mr_no);
		
		Map<String,Integer>map = new HashMap<String, Integer>();
		map.put("ec_id", modifyRequestEntity.getEc_id());
		map.put("mr_name", modifyRequestEntity.getMr_name());
		String name = modifyRequestService.getName(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", modifyRequestEntity);
		mav.addObject("name", name);
		mav.setViewName("admin/modifyrequest/modifyrequestdetail");
		return mav; 
	}
	
	// 관리자가 수정요청 목록 삭제
	@ResponseBody
	@PostMapping(value="admin/modifyrequest/delete")
	public int delete(@RequestParam("mr_no")int mr_no, HttpServletRequest request) throws Exception {
		
		ModifyRequestEntity modifyRequestEntity = new ModifyRequestEntity();
		modifyRequestEntity = modifyRequestService.detail(mr_no);
		fileUtil.deleteFile(request, "/modifyrequest", modifyRequestEntity.getMr_file());
		
		return modifyRequestService.delete(mr_no);
	}
	
	// 개수 카운트해서 미리 보여주기
	@ResponseBody
	@GetMapping(value="admin/modifyrequest/count")
	public int count() throws Exception {
		return modifyRequestService.count();
	}
	
	
}
