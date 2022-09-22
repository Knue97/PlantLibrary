package kr.co.plantlibrary.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

//	목록 리스트
	public List<BoardDTO> listAll(Criteria cri) throws Exception;
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

//	페이징
	public int countBoardListTotal1(Criteria cri) throws Exception;
	public int countBoardListTotal2(Criteria cri) throws Exception;
	public int countBoardListTotal3(Criteria cri) throws Exception;
	public int countBoardListTotal4(Criteria cri) throws Exception;
	
	
	
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
