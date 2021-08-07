package com.funsoft.hmm.web.domain.param;

import java.util.List;

import com.funsoft.hmm.web.domain.param.LeakageAnalysisSearchParam.AnalysisPeroid;

import lombok.Data;

/**
 * 수압 분석 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class PressureAnalysisSearchParam {

	private long blockId;
	
	/** 기준일 */
	private String fixedDate;
	
	private AnalysisPeroid analysisPeroid;
	
	private CompareDate compareDate;
	
	private String selectDate;
	
	private List<String> blockList;
	
	public enum CompareDate {
		이전주기, 일자선택;
	}
}
