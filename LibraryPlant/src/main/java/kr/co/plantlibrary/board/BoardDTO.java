/*
type varchar(15) 
bno int AI PK 
title varchar(45) 
content varchar(100) 
id varchar(20) 
regdate datetime 
reupdate datetime 
readcnt int 
etc varchar(50) 
del int
*
*
*
String type;
	int bno;
	String title;
	String content;
	String id;
	String regdate;
	String reupdate;
	int readcnt;
	String ect;
	int del;
	삭제
 */
/*
 b_no int 
bc_id int 
b_title varchar(50) 
b_content varchar(1000) 
b_regdate datetime 
b_image varchar(100) 
b_hits int 
b_recommendedNumber int 
b_report int 
b_state int
 */

package kr.co.plantlibrary.board;

import lombok.Data;

@Data
public class BoardDTO {

	 private int b_no;
	 private int bc_id;
	 private String u_id;
	 private String b_title;
	 private String b_content;
	 private String b_regdate;
	 private String b_image;
	 private int b_hits;				// 조회수
	 private int b_recommendedNumber;	// 추천수
	 private int b_report;				// 누적 신고수
	 private int b_state;				// 게시글 상태
	 private int b_commentcnt;			// 댓글 개수
	 
		public void setB_image(String b_image) {
			if (b_image == "") {
				this.b_image = null;
			} else {
				this.b_image = b_image;
			}
		}
}
