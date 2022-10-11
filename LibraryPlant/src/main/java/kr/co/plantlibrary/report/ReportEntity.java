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

package kr.co.plantlibrary.report;

import lombok.Data;

@Data
public class ReportEntity {

	private int r_no;	// 신고번호
	private int b_no;	// 게시글 번호
	private int c_no;	// 댓글 번호
	private String u_id;	// 로그인 된 유저 ID
	private String report_user;	// 신고된 유저 ID
	private String rc_content;	// 게시글의 제목 혹은 댓글의 내용
	private String r_content;	// 신고 내용
	private String r_file;	// 파일첨부명
	private int r_state;	// 신고 처리 현황 0. 접수대기 1. 처리중 2. 처리 완료


}
