package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.domain.chart.HighChartInfo;

import lombok.Data;

/**
 * 수압분석 정보 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class PressureAnalysisInfo {

	private HighChartInfo highChartInfo;
	
	private PressureAnalysis pressureAnalysis;
	
	@Data
	public static class PressureAnalysis {
		
		private float holidayAnalysisMin;
		
		private float holidayAnalysisMax;
		
		private float weekdayAnalysisMin;
		
		private float weekdayAnalysisMax;
	}
}
