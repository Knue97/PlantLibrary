package kr.co.plantlibrary.like;

import lombok.Data;

@Data
public class BoardLikeEntity {
	private int bl_no;	// board like number
	private int b_no;	// board Number
	private String u_id;	//user ID
	private String bl_content;	//board or comment content

}
