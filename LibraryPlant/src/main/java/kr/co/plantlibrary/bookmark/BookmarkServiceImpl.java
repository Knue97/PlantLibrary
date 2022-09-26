package kr.co.plantlibrary.bookmark;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookmarkServiceImpl implements BookmarkService{
	
	@Autowired
	private BookmarkDAO bookmarkDAO;

	@Override
	public int isBookmarked(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return bookmarkDAO.isBookmarked(map);
	}

	@Override
	public int addBookmark(BookmarkEntity bookmarkEntity) throws Exception {
		// TODO Auto-generated method stub
		return bookmarkDAO.addBookmark(bookmarkEntity);
	}

	@Override
	public int removeBookmark(BookmarkEntity bookmarkEntity) throws Exception {
		// TODO Auto-generated method stub
		return bookmarkDAO.removeBookmark(bookmarkEntity);
	}

}
