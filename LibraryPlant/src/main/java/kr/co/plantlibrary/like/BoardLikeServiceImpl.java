package kr.co.plantlibrary.like;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardLikeServiceImpl implements BoardLikeService{
	@Autowired
	private BoardLikeDAO dao;

	@Override
	public int isliked(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.isliked(map);
	}
	
	@Override
	public int addLike(BoardLikeEntity boardLikeEntity) throws Exception {
		// TODO Auto-generated method stub
		return dao.addLike(boardLikeEntity);
	}
	
	@Override
	public int removeLike(BoardLikeEntity boardLikeEntity) throws Exception {
		// TODO Auto-generated method stub
		return dao.removeLike(boardLikeEntity);
	}
		
		
}
