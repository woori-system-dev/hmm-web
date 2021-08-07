package com.funsoft.hmm.web.domain.param;

import lombok.Data;
import lombok.Getter;

/**
 * 누수 분석 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class LeakageAnalysisSearchParam {

	private String blockCode;
	
	private long blockId;
	
	private String selectDate;
	
	private boolean week;
	
	private String selectDates;
	
	private AnalysisPeroid analysisPeroid;
	
	@Getter
	public enum AnalysisPeroid {
		Peroid_1("일주일", -1),
		Peroid_2("4주", -4),
		Peroid_3("8주", -8);
		
		private String name;
		
		private int value;
		
		private AnalysisPeroid(String name, int value) {
			this.name = name;
			this.value = value;
		}
	}
}
