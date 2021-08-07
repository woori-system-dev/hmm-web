package com.funsoft.hmm.web.domain;

import java.util.List;

import com.funsoft.hmm.web.domain.chart.HighChartInfo;

import lombok.Data;

/**
 * 수압분포분석 결과 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class DistributionAnalysisInfo {

	private HighChartInfo highChartInfo;
	
	private List<DistributionAnalysis> results;
	
	@Data
	public static class DistributionAnalysis {
		
		private String blockName;
		
		private int hydrant;
		
		private int pipe;
		
		private int sumFlow;
	}
}
