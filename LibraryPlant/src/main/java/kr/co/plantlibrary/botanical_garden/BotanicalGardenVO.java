package kr.co.plantlibrary.botanical_garden;

import lombok.Data;

@Data
public class BotanicalGardenVO {
	
	private String g_id;
	private String g_name;
	private String g_detailedAddress;
	private String g_url;
	private String g_summary;
	private double g_latitude;
	private double g_longitude;
}
