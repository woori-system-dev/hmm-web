package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.domain.chart.AmChartInfo;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;

import lombok.Data;

/**
 * 계측 이력 상세 정보 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class MeasuringHistoryDetail {
	
	private BlockInfo blockInfo;
	
	private HighChartInfo highChartInfo;
	
	private AmChartInfo amChartInfo;
	
	private RealTimeMonitoring realTimeMonitoring;
	
	private float sumFlow;
	
	private float minPressure;
	
	private float maxPressure;
	
	private float avgPressure;
	
	private float minFlow;
	
	private float maxFlow;
	
	private float avgFlow;
	
}
