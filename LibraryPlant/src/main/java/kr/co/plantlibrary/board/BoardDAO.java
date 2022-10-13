package kr.co.plantlibrary.board;

import java.util.List;
import java.util.Map;


public interface BoardDAO {
	
//	목록 리스트
	public List<BoardDTO> freeListAll(Criteria cri) throws Exception;
	public List<BoardDTO> qnaListAll(Criteria cri) throws Exception;
	public List<BoardDTO> showListAll(Criteria cri) throws Exception;
	public List<BoardDTO> shareListAll(Criteria cri) throws Exception;
	
//	게시글 보기
	public BoardDTO detail(int b_no) throws Exception;
	
//	게시글 쓰기
	public int register(BoardDTO boardDTO) throws Exception;
	
//	게시글 수정
	public int update(BoardDTO boardDTO) throws Exception;
	
//	게시글 삭제
	public int delete(int b_no) throws Exception;
//	게시글 내 댓글 전체 삭제
	public int replyDeleteAll(int b_no) throws Exception;

	
	
//	조회수 증가
	public int updateHit(int b_no) throws Exception;
//	댓글 수
	public int cntReply(int b_no) throws Exception;
	
//	페이징 - 총 게시글의 개수 구하기
	public int countBoardList1() throws Exception;
	public int countBoardList2() throws Exception;
	public int countBoardList3() throws Exception;
	public int countBoardList4() throws Exception;
	
//	검색 기능
	public List<BoardDTO> searchList(Criteria cri) throws Exception;
	public int countSearch(Criteria cri) throws Exception;
	

	

	
	
//	댓글 기능들
//	댓글 리스트
	public List<ReplyDTO> replyListAll(int b_no) throws Exception;
//	댓글 작성
	public int reply(ReplyDTO replyDTO) throws Exception;

//	댓글 수정
	public int replyUpdate(ReplyDTO replyDTO) throws Exception;
//	댓글 삭제
	public int replyDelete(int c_no) throws Exception;
	
	

}
