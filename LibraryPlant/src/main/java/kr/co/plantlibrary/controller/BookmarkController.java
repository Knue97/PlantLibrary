package kr.co.plantlibrary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.plantlibrary.bookmark.BookmarkEntity;
import kr.co.plantlibrary.bookmark.BookmarkService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BookmarkController {
	
	@Autowired
	BookmarkService bookmarkService;
	
	//ajax 해당페이지, 해당유저 즐겨찾기 목록 불러오기
	@ResponseBody
	@PostMapping(value="bookmark/isbookmarked")
	public int isBookmarked(@RequestParam Map<String, Object> map) throws Exception {
		log.info("===bookmark/isbookmarked===");
		return bookmarkService.isBookmarked(map);
	}
	
	//ajax 백과 즐겨찾기 추가
	@ResponseBody
	@PostMapping(value="bookmark/addbookmark")
	public int addBookmark(@RequestParam("ec_id") int ec_id, @RequestParam("u_id") String u_id, @RequestParam("bm_name") int bm_name) throws Exception {
		BookmarkEntity bookmarkEntity = new BookmarkEntity();
		bookmarkEntity.setEc_id(ec_id);
		bookmarkEntity.setU_id(u_id);
		bookmarkEntity.setBm_name(bm_name);
		return bookmarkService.addBookmark(bookmarkEntity);
	}
	
	// ajax 백과 즐겨찾기 해제
	@ResponseBody
	@PostMapping(value="bookmark/removebookmark")
	public int removeBookmark(@RequestParam("ec_id") int ec_id, @RequestParam("u_id") String u_id, @RequestParam("bm_name") int bm_name) throws Exception {
		
		BookmarkEntity bookmarkEntity = new BookmarkEntity();
		bookmarkEntity.setEc_id(ec_id);
		bookmarkEntity.setU_id(u_id);
		bookmarkEntity.setBm_name(bm_name);

		return bookmarkService.removeBookmark(bookmarkEntity);
	}
}
