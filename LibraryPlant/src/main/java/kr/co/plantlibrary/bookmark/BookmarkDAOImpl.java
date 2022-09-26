package kr.co.plantlibrary.bookmark;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "kr.co.plantlibrary.bookmarkMapper";
	
	@Override
	public int isBookmarked(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".isbookmarked", map);
	}

	@Override
	public int addBookmark(BookmarkEntity bookmarkEntity) throws Exception {
		return sqlSession.insert(NAMESPACE + ".addbookmark", bookmarkEntity);
	}

	@Override
	public int removeBookmark(BookmarkEntity bookmarkEntity) throws Exception {
		return sqlSession.delete(NAMESPACE + ".removebookmark", bookmarkEntity);
	}
	
	

}
