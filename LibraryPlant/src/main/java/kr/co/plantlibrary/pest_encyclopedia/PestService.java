package kr.co.plantlibrary.pest_encyclopedia;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface PestService {
	
	// 해충백과 목록 조회
	List<PestEntity> listAll() throws Exception;
	
	// 해충백과 조회수 상위 3위 조회
	List<PestEntity> highHits() throws Exception;

	// 해충백과 상세정보
	PestEntity detail(int pe_id) throws Exception;

	// 검색 결과 조회
	List<PestEntity> search(String searchWord) throws Exception;

	// 해당 해충백과 조회수 증가
//	int updateHits(int pe_id) throws Exception;

	// 해충 정보 추가
	int register(PestEntity PestEntity) throws Exception;

	// 해충 정보 수정
	int update(PestEntity PestEntity) throws Exception;

	// 해충 정보 삭제
	int delete(int pe_id) throws Exception;
	
	// 정보등록/수정시 해충명 중복 확인하기
	int checkPest(String pe_name) throws Exception;

}
