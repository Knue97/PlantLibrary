package kr.co.plantlibrary.modifyrequest;

import java.util.List;
import java.util.Map;

public interface ModifyRequestDAO {
	
	// 수정요청 등록하기
	public int register(ModifyRequestEntity modifyRequestEntity) throws Exception;
	
	// 수정요청 목록 카운트
	public int count() throws Exception;
	
	// 수정요청 목록 불러오기 + 페이징
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception;
	
	// 카테고리(ec_id)와 id(mr_name)로 식물명/병해명/해충명 가져오기
	public String getName(Map<String,Integer> map) throws Exception;
	
	// 수정요청 상세보기
	public ModifyRequestEntity detail(int mr_no) throws Exception;
	
	// 수정요청 삭제하기
	public int delete(int mr_no) throws Exception;
}
