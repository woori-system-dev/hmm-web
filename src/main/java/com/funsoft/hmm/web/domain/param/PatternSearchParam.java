package com.funsoft.hmm.web.domain.param;

import lombok.Data;
import lombok.Getter;

/**
 * 수압패턴분석 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class PatternSearchParam {
	
	private long blockId;
	
	private Holiday holiday;
	
	private Sky sky;
	
	private Rainfall rainfall;
	
	private LowestTemp lowestTemp;
	
	private HighestTemp highestTemp;
	
	private Humidity humidity;
	
	public enum Sky {
		맑음, 흐림, 구름조금, 구름많음;
	}

	public enum Holiday {
		평일, 휴일
	}
	
	@Getter
	public enum Rainfall {
		없음("없음"),
		비("비"),
		비_눈("비/눈"),
		눈("눈");
		
		private String name;
		
		private Rainfall(String name) {
			this.name = name;
		}
	}
	
	@Getter
	public enum LowestTemp {
		TYPE_1("0~5"),
		TYPE_2("6~10"),
		TYPE_3("11~15"),
		TYPE_4("16~20");
		
		private String name;
		
		private LowestTemp(String name) {
			this.name = name;
		}
	}
	
	@Getter
	public enum HighestTemp {
		TYPE_1("11~15"),
		TYPE_2("16~20"),
		TYPE_3("21~25"),
		TYPE_4("26~30"),
		TYPE_5("31~35"),
		TYPE_6("36~40");
		
		private String name;
		
		private HighestTemp(String name) {
			this.name = name;
		}
	}
	
	@Getter
	public enum Humidity {
		TYPE_0("0~9"),
		TYPE_1("10~19"),
		TYPE_2("20~29"),
		TYPE_3("30~39"),
		TYPE_4("40~49"),
		TYPE_5("50~59"),
		TYPE_6("60~69"),
		TYPE_7("70~79"),
		TYPE_8("80~89"),
		TYPE_9("90~99");
		
		private String name;
		
		private Humidity(String name) {
			this.name = name;
		}
	}
}
