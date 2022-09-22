package kr.co.plantlibrary.boardtest;

import java.util.Random;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.plantlibrary.board.BoardDAO;
import kr.co.plantlibrary.board.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class) //속성 경로에 xml파일을 이용해 스프링이 로딩 된다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })

public class BoardCreatTest {
	@Inject
	private BoardDAO boardDAO;
	
	
	@Test
	public void testInsert() throws Exception{
		BoardDTO board;
		Random random = new Random();
		
		for(int i =1; i<50; i++) {
			board = new BoardDTO();
			board.setBc_id(random.nextInt(4)+1);
			board.setB_title("게시글 " + i + "]");
			board.setB_content("test 해봄 " + i);
			board.setU_id("adminboard");
			
			boardDAO.register(board);
			
			Thread.sleep(1000);
		}
		
	
	}
}
