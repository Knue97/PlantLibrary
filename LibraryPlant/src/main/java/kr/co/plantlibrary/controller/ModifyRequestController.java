package kr.co.plantlibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 관리자가 수정요청 목록 삭제
	@GetMapping(value="encyclopedia/modifyrequest/delete")
	public String delete(@RequestParam("mr_no")int mr_no) {
		
		
		
		return "redirect:/";
	}
	
}
