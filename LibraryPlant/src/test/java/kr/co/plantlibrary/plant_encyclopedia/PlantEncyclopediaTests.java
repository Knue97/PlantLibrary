package kr.co.plantlibrary.plant_encyclopedia;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.plantlibrary.plant_encyclopedia.PlantEncyclopediaDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PlantEncyclopediaTests {

	@Setter(onMethod_ = @Autowired)
	private PlantEncyclopediaDAO dao;
	
	/*
	@Test
	public void testGetList() {
		log.info("getList test");
		List<EncyclopediaEntity> list=dao.listAll();
		log.info(list);
	}
	
	@Test
	public void testGetListOne() {
		log.info("=============getList one===========");
		EncyclopediaEntity entity = dao.listById(1);
		log.info(entity);
	}
	*/
	
	/*
	@Test
	public void testGetPK() {
		log.info("===========getPK============");
		
		int r = dao.getAuto();
		log.info(r);
	}
	*/
}
