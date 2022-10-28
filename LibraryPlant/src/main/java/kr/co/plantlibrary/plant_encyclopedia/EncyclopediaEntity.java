package kr.co.plantlibrary.plant_encyclopedia;

import lombok.Data;

@Data
public class EncyclopediaEntity {

	private int pl_id;
	private int ec_id;
	private String pl_koreanName;
	private String pl_englishName;
	private String pl_scientificName;
	private String pl_familyName;
	private String pl_classification;
	private String pl_nativeHome;
	private String pl_feature;
	private String pl_level;
	private String pl_reproduction;
	private String pl_water;
	private String pl_growthTemperature;
	private String pl_light;
	private String pl_placement;
	private String pl_summary;
	private String pl_tip;
	private String pl_detailLight;
	private String pl_detailTemperature;
	private String pl_detailWater;
	private String pl_detailReproduction;
	private String pl_detailSupport;
	private String pl_detailSoil;
	private String pl_detailPottingAndRoot;
	private String pl_detailFertilizer;
	private String pl_detailCaution;
	private String pl_image = "가울테리아.jpg";
	private String pl_imageSource;
	private String pl_contentSource;	
	private int pl_hits;
	private int pl_bookmarkCnt;
	
	
}
