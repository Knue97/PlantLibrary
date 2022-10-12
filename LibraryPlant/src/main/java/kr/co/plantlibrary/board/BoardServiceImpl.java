package kr.co.plantlibrary.board;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.co.plantlibrary.like.BoardLikeDAO;

@Service
public class BoardServiceImpl implements BoardService {
@Inject BoardDAO dao;
@Inject  BoardLikeDAO likeDao;
	
	@Override
	public List<BoardDTO> freeListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.freeListAll(cri);
	}
	
	@Override
	public List<BoardDTO> qnaListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaListAll(cri);
	}

	@Override
	public List<BoardDTO> showListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.showListAll(cri);
	}

	@Override
	public List<BoardDTO> shareListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.shareListAll(cri);
	}


	@Override
	public BoardDTO detail(int b_no) throws Exception {
		// TODO Auto-generated method stub
			dao.updateHit(b_no);
			
		return dao.detail(b_no);
	}

	@Override
	public int register(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.register(boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(boardDTO);
	}

	@Override
	public int delete(int b_no) throws Exception {
		// TODO Auto-generated method stub
//		일단 댓글 완전 삭제
		dao.replyDeleteAll(b_no);
//		해당 게시글 좋아요 전체 취소
		likeDao.removeLikeAll(b_no);
		return dao.delete(b_no);
	}

	
//	페이징
	@Override
	public int countBoardListTotal1() throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList1();
	}
	@Override
	public int countBoardListTotal2() throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList2();
	}
	@Override
	public int countBoardListTotal3() throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList3();
	}
	@Override
	public int countBoardListTotal4() throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList4();
	}
	
//	검색
	@Override
	public List<BoardDTO> searchList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchList(cri);
	}
//	검색 페이징
	@Override
	public int countSearch(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearch(cri);
	}
	

	
	
//	댓글
	@Override
	public List<ReplyDTO> replyListAll(int b_no) throws Exception {
		// TODO Auto-generated method stub
		dao.cntReply(b_no);
		return dao.replyListAll(b_no);
	}

	@Override
	public int reply(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.reply(replyDTO);
	}

	@Override
	public int replyUpdate(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyUpdate(replyDTO);
	}

	@Override
	public int replyDelete(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyDelete(c_no);
	}
	
	

	
	
	
}
