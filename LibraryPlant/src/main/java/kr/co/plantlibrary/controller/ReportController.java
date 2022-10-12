package kr.co.plantlibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.report.ReportEntity;
import kr.co.plantlibrary.report.ReportService;
import kr.co.plantlibrary.util.FileUtil;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	FileUtil fileUtil;
	
	
	@GetMapping(value="board/reportPage")
	public String report(ReportEntity reportEntity) {
		return "board/optionPage/reportPage";
	}
	
	
	// 수정요청폼 내역 DB전송
	@PostMapping(value="board/reportPage")
	public ModelAndView register(ReportEntity reportEntity, MultipartHttpServletRequest request, @RequestParam("file") MultipartFile[] upload) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		String imgstr = fileUtil.uploadFile(upload, request, "/reportPage");
		
		reportEntity.setR_file(imgstr);
		int r = reportService.register(reportEntity);
		log.info("b_no = "+reportEntity.getB_no());
		if(reportEntity.getB_no() == 0) {
			mav.setViewName("redirect:freeListAll");
		} else {
		mav.setViewName("redirect:detail?b_no=" + reportEntity.getB_no());
		}
		log.info(mav);
		log.info(reportEntity.getRc_content());
		return mav;
	}
	
	// 관리자 신고 목록 관리  0. 접수대기 1. 접수중 2. 접수 완료
	@GetMapping(value="board/reportPage/changeStatus")
	public String ChangeStatus(@RequestParam("r_state")int r_state) {
		
		
		
		return "redirect:/";
	}
	
}
