/*
 * 파일명 : DiseaseEntity
 * 작성일자 : 2022-09-05
 * 설명 : disease테이블에 대한 정보를 담기 위한 클래스
 * 수정일자 :
 * 수정자 :
 * 수정내역 :
 * 
 * Table: disease
Columns:
di_id int PK 병해id
ec_id int 백과카테고리id(외래키)
di_alias varchar(50) 병명
di_image varchar(100) 이미지
di_cause varchar(100) 원인
di_symptomOfDisease varchar(100) 병징 및 표징
di_biologicalControl varchar(100) 방제법
di_carefulPlant varchar(50) 조심해야할 식물
di_descripton varchar(1000) 상세설명
di_hits int 조회수
 */
package kr.co.plantlibrary.disease_encyclopedia;

import lombok.Data;

@Data
public class DiseaseEntity {
	
	private int di_id;
	private int ec_id;
	private String di_alias;
	private String di_image;
	private String di_cause;
	private String di_symptomOfDisease;
	private String di_biologicalControl;
	private String di_carefulPlant;
	private String di_descripton;
	private String di_hits;
}
