package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.domain.chart.AmChartInfo;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;

import lombok.Data;

/**
 * 알람이력 상세정보 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class AlarmHistoryDetail {
	
	private BlockInfo blockInfo;
	
	private RealTimeMonitoring realTimeMonitoring;

	private HighChartInfo highChartInfo;
	
	private AmChartInfo amChartInfo;
	
	private String alarmType;
	
	private int durationTime;
	
	private int total;
	
	private int highPressureWarning;
	
	private int highPressureCaution;
	
	private int lowPressureWarning;
	
	private int lowPressureCaution;
	
	private int openDoor;
	
	private int deviceError;
}
