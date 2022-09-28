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
	
//	게시판
	@Override
	public List<BoardDTO> freeListAll(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".freeListAll", cri);
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
	
//	읽기/쓰기/수정/삭제
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
	
//	글 삭제 시 해당 글의 모든 댓글 삭제
	@Override
	public int replyDeleteAll(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete(Namespace + ".replyDeleteAll", b_no);
	}

//	조회수
	@Override
	public int updateHit(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".updateHit", b_no);
	}
	
//	댓글수
	@Override
	public int cntReply(int b_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update(Namespace + ".cntReply", b_no);
	}
	
	
//	 페이징
	@Override
	public int countBoardList1() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList1");
	}
	@Override
	public int countBoardList2() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList2");
	}
	@Override
	public int countBoardList3() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList3");
	}
	@Override
	public int countBoardList4() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countBoardList4");
	}
	
//	검색
	@Override
	public List<BoardDTO> searchList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(Namespace + ".searchList", cri);
	}

	@Override
	public int countSearch(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(Namespace + ".countSearch", cri);
	}
	
	
	
//	댓글
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
