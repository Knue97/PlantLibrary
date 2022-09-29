/*
 * 파일명 : BookmarkEntity
 * 작성일자 : 2022-09-13
 * 설명 : bookmark테이블에 대한 정보를 담기 위한 클래스
 * 수정일자 :
 * 수정자 :
 * 수정내역 :
 * 
 * Table: bookmark
Columns:
bm_no int AI PK 
ec_id int 
u_id varchar(50) 
bm_name int
 */

package kr.co.plantlibrary.bookmark;

import lombok.Data;

@Data
public class BookmarkEntity {
	
	private int bm_no;
	private int ec_id;
	private String u_id;
	private int bm_name;

}
