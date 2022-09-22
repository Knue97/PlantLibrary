/*

c_no int AI PK 
u_id varchar(50) 
b_no int 
c_content varchar(500) 
c_regdate datetime 
c_likeCnt int 
 int 
 int
 */

package kr.co.plantlibrary.board;

import lombok.Data;

@Data
public class ReplyDTO {

	private int c_no;
	private String u_id;
	private int b_no;
	private String c_content;
	private String c_regdate;
	private int c_likeCnt;
	private int c_state;
	private int c_choose;
}
