package kr.co.plantlibrary.disease_encyclopedia;

import java.util.List;
import java.util.Map;

public interface DiseaseService {
	
	// 병해백과 목록 조회
	List<DiseaseEntity> listAll() throws Exception;
	
	// 병해백과 조회수 상위 3위 조회
	List<DiseaseEntity> highHits() throws Exception;
	
	// 병해백과 상세정보
	DiseaseEntity detail(int di_id) throws Exception;
	
	// 검색 결과 조회
	List<DiseaseEntity> search(String searchWord) throws Exception;
	
	// 해당 병해백과 조회수 증가
//	int updateHits(int di_id);
	
	// 병해 정보 추가
	int register(DiseaseEntity diseaseEntity) throws Exception;
	
	// 병해 정보 수정
	int update(DiseaseEntity diseaseEntity) throws Exception;

	// 병해 정보 삭제
	int delete(int di_id) throws Exception;

}
