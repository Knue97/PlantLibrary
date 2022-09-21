package kr.co.plantlibrary.login;

import lombok.Data;

@Data
public class LoginEntity {
	private String u_id;
	private String u_nickname;
	private String u_password;
	private String u_name;
	private String u_email;
	private String u_address;
	private int u_findPasswordQ;
	private String u_findPasswordA;
	private int u_state;
}
