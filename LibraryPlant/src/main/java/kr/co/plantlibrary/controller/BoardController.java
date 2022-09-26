package kr.co.plantlibrary.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.plantlibrary.board.BoardDTO;
import kr.co.plantlibrary.board.BoardService;
import kr.co.plantlibrary.board.Criteria;
import kr.co.plantlibrary.board.PageMaker;
import kr.co.plantlibrary.board.ReplyDTO;

/**
 * Handles requests for the application home page.
 */
@Controller


public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	BoardService service;
	@Resource(name="uploadPath")
	private String uploadPath;

//	 free 리스트 불러오기(페이징, 검색 적용중)
	@GetMapping(value = "board/freeListAll")
	public ModelAndView freeListAll(Criteria cri) throws Exception {
		logger.info("자유 게시판 리스트");
		ModelAndView mav = new ModelAndView();
		
		// PageMaker() 객체를 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);	//  page와 perPageNum을 셋팅
		pageMaker.setTotalCount(service.countBoardListTotal1(cri));	// 총 게시글의 수를 셋팅 (총 게시글 수를 조회하는 로직 구현)
		logger.info(""+service.countBoardListTotal1(cri));
		logger.info(cri.toString());
		logger.info(""+pageMaker);
		
		List<BoardDTO> listAll = service.listAll(cri);	//	원래의 목록 조회 로직에서 Criteria 파라미터를 사용하기 위해 수정
		mav.addObject("listAll", listAll);
		mav.addObject("pageMaker", pageMaker);	// 셋팅된 pageMaker에는 페이징을 위한 버튼의 값들이 들어있고 ModelAndView를 이용해 jsp에 넘겨준다.
		mav.setViewName("board/freeListAll");
		return mav;
	}

	@GetMapping(value = "board/qnaListAll")
	public ModelAndView qnaListAll(Criteria cri) throws Exception {
		logger.info("질문 게시판 리스트");
		ModelAndView mav = new ModelAndView();

		// PageMaker() 객체를 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); // page와 perPageNum을 셋팅
		pageMaker.setTotalCount(service.countBoardListTotal2(cri));
		logger.info("" + service.countBoardListTotal2(cri));
		logger.info(cri.toString());
		logger.info(""+pageMaker);

		List<BoardDTO> listAll = service.qnaListAll(cri);
		mav.addObject("qnaListAll", listAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/qnaListAll");
		return mav;
	}

	@GetMapping(value = "board/showListAll")
	public ModelAndView showListAll(Criteria cri) throws Exception {
		logger.info("자랑 게시판 리스트");
		ModelAndView mav = new ModelAndView();

		// PageMaker() 객체를 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); // page와 perPageNum을 셋팅
		pageMaker.setTotalCount(service.countBoardListTotal3(cri));
		logger.info("" + service.countBoardListTotal3(cri));
		logger.info(cri.toString());
		logger.info(""+pageMaker);
		
		List<BoardDTO> listAll = service.showListAll(cri);
		mav.addObject("showListAll", listAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/showListAll");
		return mav;
	}

	@GetMapping(value = "board/shareListAll")
	public ModelAndView shareListAll(Criteria cri) throws Exception {
		logger.info("나눔 게시판 리스트");
		ModelAndView mav = new ModelAndView();

		// PageMaker() 객체를 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); // page와 perPageNum을 셋팅
		pageMaker.setTotalCount(service.countBoardListTotal4(cri));
		logger.info("" + service.countBoardListTotal4(cri));
		logger.info(cri.toString());
		logger.info(""+pageMaker);
		
		List<BoardDTO> listAll = service.shareListAll(cri);
		mav.addObject("shareListAll", listAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/shareListAll");
		return mav;
	}

//	게시글 보기 detail
	@RequestMapping(value = "board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("b_no") int b_no, Model model) throws Exception {
		logger.info("글 선택해서 읽기 폼");
		BoardDTO board = service.detail(b_no);
		model.addAttribute("board", board);

		return "board/detail";
	}

//	게시글 입력 insert
//	-1. 폼
	@GetMapping(value = "board/register")
	public String register() {
		logger.info("글쓰기 폼으로 이동");
		return "board/register";
	}

//	-2. 입력
	@PostMapping(value = "board/register")
	public String register(MultipartFile[] files, Model model,BoardDTO boardDTO) throws Exception {
		logger.info("========== 게시글 작성 ==========");
//		폴더 생성 yyyy/MM/dd
		File uploadFolder = new File(uploadPath, getFolder());
		logger.info("uploadFolder = "+ uploadFolder);
		
		if (uploadFolder.exists() == false) {
			logger.info("폴더 생성 : "+ uploadFolder.mkdirs());
			uploadFolder.mkdirs();
		} // 해당 폴더의 유무 확인 후 없으면 만듦
		
//		고유값 이미지 저장
		for(MultipartFile file :files) {
		
//		IE has file path
		String uploadFileName = file.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		logger.info("Only file name = "+ uploadFileName);
		logger.info("Size = "+ file.getSize());
		logger.info("ContentType = "+ file.getContentType());
		
		if (file.getOriginalFilename() != "") {
			String b_image = uploadFile(uploadFolder, uploadFileName, file.getBytes());
			logger.info("이미지 b_image = "+ b_image);
			boardDTO.setB_image(b_image);
			model.addAttribute("b_image",b_image);			
			}
		}
		
		logger.info("글쓰기 저장" + boardDTO);
		int r= service.register(boardDTO);

		switch (boardDTO.getBc_id()) {
		case 1:
			return "redirect:freeListAll";
		case 2:
			return "redirect:qnaListAll";
		case 3:
			return "redirect:showListAll";
		case 4:
			return "redirect:shareListAll";
		}
		
		return "redirect:freeListAll";
	}

//	게시글 수정 -1. 폼
	@GetMapping(value = "board/update")
	public String update(@RequestParam("b_no") int b_no, Model model) throws Exception {
		BoardDTO board = service.detail(b_no);
		model.addAttribute("board", board);
		logger.info("업뎃 폼 " + board);
		return "board/update";
	}

//	-2 수정
	@PostMapping(value = "board/update")
	public String update(BoardDTO boardDTO, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("업데이트 실행");
		int r = service.update(boardDTO);

		if (r > 0) {
			logger.info("업데이트 성공");
			return "redirect:detail?b_no=" + boardDTO.getB_no();
		}
		logger.info("업데이트 실패");
		return "redirect:update?b_no=" + boardDTO.getB_no();
	}

//	게시글 삭제
	@GetMapping(value = "board/delete")
	public String delete(@RequestParam("b_no") int b_no) throws Exception {
		int r = service.delete(b_no);

		if (r > 0) {
			logger.info("삭제 성공, 자유 게시판으로 이동");
			
			return "redirect:freeListAll";
		}
		logger.info("삭제 실패");
		return "redirect:detail?b_no" + b_no;

	}

	
	
//	ajax 댓글 기능
	@ResponseBody
	@PostMapping(value = "board/replyListAll")
	public List<ReplyDTO> replyListAll(@RequestParam("b_no") int b_no) throws Exception{
		logger.info("ajax 실행");
		return service.replyListAll(b_no);
	}
	
	
//	댓 작성
	@ResponseBody
	@PostMapping(value = "board/reply")
	public int reply(ReplyDTO replyDTO) throws Exception {
		logger.info(replyDTO.getC_content());
		if(replyDTO.getC_content() == "") {
			logger.info(replyDTO.getC_content() + "댓 내용없음");
			return 2;
		}
		return service.reply(replyDTO);
	}


//	댓 수정
	@ResponseBody
	@PostMapping(value = "board/replyUpdate")
	public int replyUpdate(ReplyDTO replyDTO) throws Exception {
		
		return service.replyUpdate(replyDTO);
	}
	
//	댓 삭제
	@ResponseBody
	@PostMapping(value = "board/replyDelete")
	public int replyDelete(@RequestParam("c_no") int c_no) throws Exception {
		return service.replyDelete(c_no);
	}
	
	
//	고유값+이름
	private String uploadFile(File uploadFolder, String uploadFileName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + uploadFileName;
		File target = new File(uploadFolder, saveName);
		FileCopyUtils.copy(fileData, target);
		logger.info("uid "+ uid);
		logger.info("saveName "+saveName);
		logger.info("target "+target);

		return saveName;
	}

//	해당 날짜 폴더
	private String getFolder() {
		
		// yyyy-MM-dd 대소문자 정확히 입력해야 날짜대로 나옴
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
		
	}
	
}
