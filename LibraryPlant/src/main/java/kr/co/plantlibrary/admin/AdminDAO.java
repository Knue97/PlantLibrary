package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
	
	// 병해백과 총 개수
	public int countDisease();

	// 병해백과 목록 + 페이징
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception;
}
