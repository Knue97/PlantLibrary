package kr.co.plantlibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.modifyrequest.ModifyRequestEntity;
import kr.co.plantlibrary.modifyrequest.ModifyRequestService;

@Controller
public class ModifyRequestController {
	
	@Autowired
	ModifyRequestService modifyRequestService;
	
	
	// 수정요청폼 내역 DB전송
	@PostMapping(value="library/modifyrequest")
	public ModelAndView register(ModifyRequestEntity modifyRequestEntity) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		int r = modifyRequestService.register(modifyRequestEntity);
		mav.setViewName("redirect:/");
		
		return mav;
	}
}
