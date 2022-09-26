/*
 * 파일명 : PestEntity
 * 작성일자 : 2022-09-05
 * 설명 : disease테이블에 대한 정보를 담기 위한 클래스
 * 수정일자 :
 * 수정자 :
 * 수정내역 :
 * 
 * Table: pest
Columns:
pe_id int PK 
ec_id int 
pe_name varchar(50) 
pe_image varchar(100) 
pe_cause varchar(100) 
pe_method varchar(100) 
pe_biologicalControl varchar(100) 
pe_naturalEnemy varchar(50) 
pe_carefulPlant varchar(50) 
pe_description varchar(1000) 
pe_hits int
 */
package kr.co.plantlibrary.pest_encyclopedia;

import lombok.Data;

@Data
public class PestEntity {
	
	private int pe_id;
	private int ec_id;
	private String pe_name;
	private String pe_image;
	private String pe_cause;
	private String pe_method;
	private String pe_biologicalControl;
	private String pe_naturalEnemy;
	private String pe_carefulPlant;
	private String pe_description;
	private int pe_hits;

}
