package kr.co.plantlibrary.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
@Inject BoardDAO dao;
	
	@Override
	public List<BoardDTO> listAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll(cri);
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
		return dao.delete(b_no);
	}

	
//	페이징
	@Override
	public int countBoardListTotal1(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList1(cri);
	}
	@Override
	public int countBoardListTotal2(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList2(cri);
	}
	@Override
	public int countBoardListTotal3(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList3(cri);
	}
	@Override
	public int countBoardListTotal4(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoardList4(cri);
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
