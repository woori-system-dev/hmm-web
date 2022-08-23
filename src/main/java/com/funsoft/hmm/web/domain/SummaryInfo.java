package com.funsoft.hmm.web.domain;

import java.util.List;

import com.funsoft.hmm.web.domain.chart.AmChartInfo;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.FlowSummaryMonth;

import lombok.Data;

/**
 * 종합 요약 정보 클래스
 * 
 * @author hgko
 *
 */
@Data
public class SummaryInfo {
	
	/** 소블록개수 */
	private int smallBlockNum;
	
	/** 관리블록개수 */
	private int manageBlockNum;
	
	/** 관로연장 */
	private int bkPipeEx;
	
	/** 급수전수 */
	private int bkWspPopCo;
	
	/** 1시간적산유량 */
	private String hourSumFlow;
	
	/** 금일적산유량 */
	private String todaySumFlow;
	
	/** 유수율 */
	private double wtrFlowRate;
	
	/** 수압이상알람 블록 리스트 */
	private List<String> pressureAlarm;
	
	/** 기기이상알람 블록 리스트 */
	private List<String> deviceAlarm;
	
	/** 누수이상알람 블록 리스트 */
	private List<String> leakageAlarm;
	
	/** 계측이력정보 */
	private AmChartInfo measurementChartInfo;
	
	/** 수압분포분석 */
	private HighChartInfo pressureChartInfo;
	
	/** 월별 수요량 */
	private List<FlowSummaryMonth> flowSummaryMonths;
	
	/** 금일알람이력 */
	private List<AlarmHistoryTable> alarmHistoryTables;
	
}
