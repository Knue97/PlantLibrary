package kr.co.plantlibrary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.plantlibrary.bookmark.BookmarkEntity;
import kr.co.plantlibrary.bookmark.BookmarkService;
import kr.co.plantlibrary.like.BoardLikeEntity;
import kr.co.plantlibrary.like.BoardLikeService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LikeController {
	
	@Autowired
	BoardLikeService service;
	
	//ajax 해당페이지, 해당유저 좋아요 목록 불러오기
	@ResponseBody
	@PostMapping(value="like/isliked")
	public int isliked(@RequestParam Map<String, Object> map) throws Exception {
		log.info("===== Like =====");
		return service.isliked(map);
	}
	
	//ajax 좋아요
	@ResponseBody
	@PostMapping(value="like/addLike")
	public int addLike(@RequestParam("b_no") int b_no, @RequestParam("u_id") String u_id, @RequestParam("bl_content") String bl_content) throws Exception {
		BoardLikeEntity boardLikeEntity = new BoardLikeEntity();
		boardLikeEntity.setB_no(b_no);
		boardLikeEntity.setU_id(u_id);
		boardLikeEntity.setBl_content(bl_content);
	
		return service.addLike(boardLikeEntity);
	}
	
	// ajax 좋아요 해제
	@ResponseBody
	@PostMapping(value="like/removeLike")
	public int removeLike(@RequestParam("b_no") int b_no, @RequestParam("u_id") String u_id, @RequestParam("bl_content") String bl_content) throws Exception {
		
		BoardLikeEntity boardLikeEntity = new BoardLikeEntity();
		boardLikeEntity.setB_no(b_no);
		boardLikeEntity.setU_id(u_id);
		boardLikeEntity.setBl_content(bl_content);

		return service.removeLike(boardLikeEntity);
	}
}
