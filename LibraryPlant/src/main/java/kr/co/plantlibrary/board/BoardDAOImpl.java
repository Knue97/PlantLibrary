package kr.co.plantlibrary.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	SqlSession sqlsession;
	
	private static final String Namespace = "kr.co.plantlibrary.boardMapper";
	
	
	@Override
	public List<BoardDTO> listAll(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".listAll", cri);
	}

	@Override
	public List<BoardDTO> qnaListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace+ ".qnaListAll", cri);
	}
	

	@Override
	public List<BoardDTO> showListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".showListAll", cri);
	}

	@Override
	public List<BoardDTO> shareListAll(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".shareListAll", cri);
	}
	
	@Override
	public BoardDTO detail(int b_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".detail", b_no);
	}

	@Override
	public int register(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlsession.insert(Namespace + ".insert", boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".update" , boardDTO);
	}

	@Override
	public int delete(int b_no) {
		// TODO Auto-generated method stub
		return sqlsession.delete(Namespace + ".delete", b_no);
	}
	@Override
	public int replyDeleteAll(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(Namespace + ".replyDeleteAll", b_no);
	}

	@Override
	public int updateHit(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".updateHit", b_no);
	}

	@Override
	public int cntReply(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".cntReply", b_no);
	}
	
	
	// 페이징
	@Override
	public int countBoardList1(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList1", cri);
	}
	@Override
	public int countBoardList2(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList2", cri);
	}
	@Override
	public int countBoardList3(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList3", cri);
	}
	@Override
	public int countBoardList4(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList4", cri);
	}
	
	
	
	
	
	
	@Override
	public List<ReplyDTO> replyListAll(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".replyListAll", b_no);
	}

	@Override
	public int reply(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.insert(Namespace + ".reply" , replyDTO);
	}


	@Override
	public int replyUpdate(ReplyDTO replyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".replyUpdate", replyDTO);
	}

	@Override
	public int replyDelete(int c_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(Namespace+ ".replyDelete", c_no);
	}
	

	
	

}
