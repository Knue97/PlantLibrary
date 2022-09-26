/*
 * Table: modify_requst
Columns:
mr_no int AI PK 
ec_id int 
u_id varchar(50) 
mr_name varchar(50) 
mr_content varchar(1000) 
mr_file varchar(100) 
mr_source varchar(100)
 */

package kr.co.plantlibrary.modifyrequest;

import lombok.Data;

@Data
public class ModifyRequestEntity {
	
	private int mr_no; // 수정요청id,number
	private int ec_id; // 백과사전 카테고리 id
	private String u_id; // 유저 id
	private String mr_name; // 변경 항목 이름 ex)산세베리아
	private String mr_content; // 수정요청내용
	private String mr_file; // 파일첨부명
	private String mr_source; // 출처

}
