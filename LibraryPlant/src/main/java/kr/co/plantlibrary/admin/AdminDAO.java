package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

import kr.co.plantlibrary.login.LoginEntity;
import kr.co.plantlibrary.plant_encyclopedia.EncyclopediaEntity;
import kr.co.plantlibrary.report.ReportEntity;

public interface AdminDAO {

    // 병해백과 총 개수
    public int countDisease();

    // 병해백과 목록 + 페이징
    public List<Map<String, Object>> listPage(int displayPost, int postNum) throws Exception;

    // 식물백과 총 개수
    public int countPlant();

    // 식물백과 목록 + 페이징
    public List<Map<String, Object>> plantListPage(int displayPost, int postNum) throws Exception;

    // 신고목록 총 개수
    public int countReport();

    // 신고 목록 + 페이징
    public List<Map<String, Object>> reportListPage(int displayPost, int postNum) throws Exception;

    // 신고 상세목록
    public ReportEntity reportDetail(int r_no) throws Exception;

    // 신고처리상태 업데이트
    public int updateReportState(int r_no, int r_state) throws Exception;

    // 회원목록 총 개수
    public int countUser();

    // 회원 목록 + 페이징
    public List<Map<String, Object>> userListPage(int displayPost, int postNum) throws Exception;

    // 회원 상태 변경 (일반회원/관리자 등급 부여)
    public int updateUserState(String u_id, int u_state) throws Exception;

    // 회원 삭제
    public int deleteUser(String u_id) throws Exception;

    // 회원 검색
    public List<LoginEntity> searchUser(String searchword) throws Exception;
    
    // 식물 수정
    public int updatePlant(EncyclopediaEntity encyclopediaEntity) throws Exception;
    
    // 식물 삭제
    public int deletePlant(int pl_id) throws Exception;
}
