package com.funsoft.hmm.web.service.chart;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.MeasuringHistory;
import com.funsoft.hmm.web.domain.NightMinFlowAnalysisInfo.NightMinFlowAnalysis;
import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.chart.HighChartSeries;
import com.funsoft.hmm.web.domain.chart.LineChartSeries;
import com.funsoft.hmm.web.domain.param.PressureAnalysisSearchParam;
import com.funsoft.hmm.web.repository.RealTimeMeasurementRepository;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;

/**
 * HighCharts 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class HighChartService {
	
	@Autowired
	private RealTimeMeasurementRepository realTimeMeasurementRepository;
	
	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;

	/**
	 * 계측이력 LineChart 정보
	 * @param histories
	 * @return
	 */
	public HighChartInfo createMeasurementChartInfo(List<MeasuringHistory> histories) {
		HighChartInfo chartInfo = new HighChartInfo("", "");
		
		HighChartSeries flowSeries = new HighChartSeries("유량");
		HighChartSeries pressureSeries = new HighChartSeries("수압");
		
		histories.stream().sorted().forEach(history -> {
			chartInfo.addCategoty(history.getDateTime());
			flowSeries.addDataItem(history.getFlow());
			pressureSeries.addDataItem(history.getPressure());
		});
		
		chartInfo.setFirstSeries(flowSeries);
		chartInfo.setSecondSeries(pressureSeries);
		
		return chartInfo;
	}
	
	/**
	 * 타임라인
	 * @return
	 */
	public HighChartInfo createHourSeriesChart() {
		HighChartInfo highChartInfo = new HighChartInfo("", "");
		for (int i = 0; i < 24; i++) {
			String categoty = i < 10 ? "0" + i + ":00" : i + ":00";
			highChartInfo.addCategoty(categoty);
		}
		
		return highChartInfo;
	}
	
	/**
	 * 누수분석 차트 생성
	 */
	public HighChartSeries createLeakageAnalysisChartInfo(String date, Map<String, RealTimeAnalysis> RealTimeAnalysisMap) {
		HighChartSeries series = new HighChartSeries(date);
		for (int i = 0; i < 24; i++) {
			String key = i < 10 ? "0" + i + ":00" : i + ":00";
			RealTimeAnalysis analysis =  RealTimeAnalysisMap.get(key);
			if (analysis != null) {
				series.addDataItem((float) analysis.getFlow());
			} else {
				series.addDataItem(0);
			}
		}
		
		return series;
	}
	
	/**
	 * 야간최소유량분석 차트 생성
	 * @param analysisList
	 * @return
	 */
	public HighChartInfo createMinFlowAnalysisChartInfo(List<NightMinFlowAnalysis> analysisList) {
		HighChartInfo chartInfo = new HighChartInfo("", "최소유량");
		
		HighChartSeries thresholdSeries = new HighChartSeries("기준허용야간유량값");
		HighChartSeries flowSeries = new HighChartSeries("최소유량");
		
		analysisList.stream().forEach(data -> {
			chartInfo.addCategoty(data.getDate());
			
			thresholdSeries.addDataItem(data.getAllowFlow());
			flowSeries.addDataItem(data.getFlow());
		});
		
		chartInfo.addSeries(thresholdSeries);
		chartInfo.addSeries(flowSeries);
		
		return chartInfo;
	}
	
	/**
	 * 수압 분석 차트 정보 생성
	 * @param param
	 * @return
	 */
	public HighChartInfo createPressureAnalysisChartInfo(PressureAnalysisSearchParam param) {
		String startDate = DateUtil.getWeekAgeDate(param.getFixedDate(), param.getAnalysisPeroid().getValue());
		String endDate = param.getSelectDate();
		
		HighChartInfo chartInfo = new HighChartInfo("", "수압");
		
		HighChartSeries series1 = new HighChartSeries("평일(분석기간)");
		HighChartSeries series2 = new HighChartSeries("휴일(분석기간)");
		HighChartSeries series3 = new HighChartSeries("평일(비교기간)");
		HighChartSeries series4 = new HighChartSeries("휴일(비교기간)");
		
		List<RealTimeAnalysis> analysisWeekdayList = realTimeMeasurementRepository.findByGroupBy(param.getBlockId(), "2014-05-08", "2014-05-15", false);
		List<RealTimeAnalysis> analysisHolidayList = realTimeMeasurementRepository.findByGroupBy(param.getBlockId(), "2014-05-08", "2014-05-15", true);
		
		Map<String, RealTimeAnalysis> analysisWeekdayMap = analysisWeekdayList.stream().collect(Collectors.toMap(RealTimeAnalysis::getHour, x -> x));
		Map<String, RealTimeAnalysis> analysisHolidayMap = analysisHolidayList.stream().collect(Collectors.toMap(RealTimeAnalysis::getHour, x -> x));
		
		for (int i = 0; i < 24; i++) {
			chartInfo.addCategoty(i < 10 ? "0" + i : i + "");
			
			String key = i < 10 ? "0" + i + ":00" : i + ":00";
			RealTimeAnalysis analysisWeekday = analysisWeekdayMap.get(key);
			if (analysisWeekday != null) {
				series1.addDataItem((float) analysisWeekday.getFlow());
			} else {
				series1.addDataItem(0);
			}
			
			RealTimeAnalysis analysisHoliday = analysisHolidayMap.get(key);
			if (analysisHoliday != null) {
				series2.addDataItem((float) analysisHoliday.getFlow());
			} else {
				series2.addDataItem(0);
			}
		}
		
		chartInfo.addSeries(series1);
		chartInfo.addSeries(series2);
		chartInfo.addSeries(series3);
		chartInfo.addSeries(series4);
		
		return chartInfo;
	}
	
	/**
	 * 수압분포분석 LineChartSeries 정보 생성
	 * @param param
	 * @return
	 */
	public LineChartSeries createDistributionAnalysisChartSeries(PressureAnalysisSearchParam param) {
		String startDate = DateUtil.getWeekAgeDate(param.getFixedDate(), param.getAnalysisPeroid().getValue());
		String endDate = param.getSelectDate();
		
		LineChartSeries chartSeries = new LineChartSeries("소블록A");
		
		List<RealTimeAnalysis> list = realTimeMeasurementService.findByGroupBy(101006000, "2014-05-08", "2014-05-15");
		long countSum = list.stream().mapToLong(data -> data.getCount()).sum();
		System.err.println(countSum);
		
		list.stream().forEach(data -> {
			int[] odds = {(int) data.getFlow(), (int) data.getCount()};
			chartSeries.addDataItem(odds);
		});
		
		return chartSeries;
	}
}
