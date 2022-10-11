package kr.co.plantlibrary.report;

import lombok.Data;

@Data
public class ReportEntity {
	
	private int r_no;
	private int b_no;
	private int c_no;
	private String u_id;
	private String report_user;
	private String rc_content;
	private String r_content;
	private String r_file;
	private int r_state;

}
