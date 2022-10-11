package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

import kr.co.plantlibrary.report.ReportEntity;

public interface AdminService {
	
	// 게시물 총 갯수
	public int countDisease();

	// 게시물 목록 + 페이징
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception;
	
	// 식물백과 총 개수
	public int countPlant();

	// 식물백과 목록 + 페이징
	public List<Map<String,Object>> plantListPage(int displayPost, int postNum) throws Exception;

	// 신고목록 총 개수
	public int countReport();

	// 신고 목록 + 페이징
	public List<Map<String,Object>> reportListPage(int displayPost, int postNum) throws Exception;

	// 신고 상세목록
	public ReportEntity reportDetail(int r_no) throws Exception;
	
	// 신고처리상태 업데이트
	public int updateReportState(int r_no, int r_state) throws Exception;
	
}
