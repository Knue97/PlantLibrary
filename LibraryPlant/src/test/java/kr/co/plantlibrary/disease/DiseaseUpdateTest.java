package kr.co.plantlibrary.disease;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.plantlibrary.disease_encyclopedia.DiseaseDAO;
import kr.co.plantlibrary.disease_encyclopedia.DiseaseEntity;

@RunWith(SpringJUnit4ClassRunner.class) //속성 경로에 xml파일을 이용해 스프링이 로딩 된다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })

public class DiseaseUpdateTest {
	@Autowired
	private DiseaseDAO diseaseDAO;
	
	
	@Test
	public void testInsert() throws Exception{
		DiseaseEntity disease;
		
		for(int i =1; i<=300; i++) {
			
			disease = new DiseaseEntity();
			disease = diseaseDAO.detail(i);
			
			int x = i%7;
			
			switch (x) {
			case 0:
				disease.setDi_image("1.jfif,2.jfif,3.jfif");
				break;
			case 1:
				disease.setDi_image("4.jpg,5.jfif,6.jfif");
				break;	
			case 2:
				disease.setDi_image("7.jfif,8.jpg,9.jfif");
				break;	
			case 3:
				disease.setDi_image("10.jfif,11.jfif,12.jfif,13.jfif");
				break;
			case 4:
				disease.setDi_image("14.jfif,15.jfif");
				break;	
			case 5:
				disease.setDi_image("16.jfif,17.jfif");
				break;	
			default:
				disease.setDi_image("18.jfif,19.jpg");
				break;
			}
			
			
			diseaseDAO.update(disease);
			
			
			Thread.sleep(3000);
		}
		
	
	}
}