package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	// 게시물 총 갯수
	public int countDisease();

	// 게시물 목록 + 페이징
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception;
}
