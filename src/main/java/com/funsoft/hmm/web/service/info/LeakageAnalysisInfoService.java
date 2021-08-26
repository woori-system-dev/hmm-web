package com.funsoft.hmm.web.service.info;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.LeakageAnalysisInfo;
import com.funsoft.hmm.web.domain.LeakageAnalysisInfo.LeakageAnalysis;
import com.funsoft.hmm.web.domain.NightMinFlowAnalysisInfo;
import com.funsoft.hmm.web.domain.NightMinFlowAnalysisInfo.NightMinFlowAnalysis;
import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.Holiday;
import com.funsoft.hmm.web.domain.db.NightMinFlow;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.domain.param.LeakageAnalysisSearchParam;
import com.funsoft.hmm.web.repository.RealTimeMeasurementRepository;
import com.funsoft.hmm.web.service.AlarmLeakageService;
import com.funsoft.hmm.web.service.HolidayService;
import com.funsoft.hmm.web.service.NightMinFlowService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.funsoft.hmm.web.service.chart.HighChartService;
import com.google.common.collect.Maps;

/**
 * 누수분석 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class LeakageAnalysisInfoService {
	
	private SimpleDateFormat minuteFormat = new SimpleDateFormat("mm");
	
	@Autowired
	private NightMinFlowService nightMinFlowService;
	
	@Autowired
	private HighChartService highChartService;
	
	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;
	
	@Autowired
	private RealTimeMeasurementRepository realTimeMeasurementRepository;
	
	@Autowired
	private AlarmLeakageService alarmLeakageService;
	
	@Autowired
	private HolidayService holidayService;

	/**
	 * 누수분석 조회 결과 가져오기
	 * @param param
	 * @return
	 */
	public LeakageAnalysisInfo createLeakageAnalysisInfo(LeakageAnalysisSearchParam param) {
		String selectDate = param.getSelectDate();
		selectDate = "2014-11-05";
		
		List<String> selectDates = new ArrayList<>();
		if (param.isWeek()) {
			selectDates.add(selectDate);
			Date date = DateUtil.toDate(selectDate);
			for (int i = 1; i <= 6; i++) {
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DATE, -i);
				selectDates.add(DateUtil.toDateString(calendar.getTime()));
			}
		} else {
			String[] dates = param.getSelectDates().split("_");
			selectDates = Arrays.asList(dates);
		}
		
		List<LeakageAnalysis> leakageAnalysisList = new ArrayList<>();
		HighChartInfo highChartInfo = highChartService.createHourSeriesChart();
		
		for (String date : selectDates.stream().sorted().collect(Collectors.toList())) {
			NightMinFlow nightMinFlow = nightMinFlowService.get(param.getBlockId(), date);
			if (nightMinFlow != null) {
				List<RealTimeMeasurement> measurements = realTimeMeasurementRepository.findByBkFlctcFmAndDate(param.getBlockId(), date);
				LeakageAnalysis leakageAnalysis = new LeakageAnalysis(nightMinFlow);
				setFlowData(leakageAnalysis, measurements);
				setPressureData(leakageAnalysis, measurements);
				leakageAnalysis.setJudgment(alarmLeakageService.getList(param.getBlockId(), date).size() == 0 ? "정상" : "이상");
				
				leakageAnalysisList.add(leakageAnalysis);
			}
			
			List<RealTimeAnalysis> realTimeAnalysis = realTimeMeasurementRepository.findByGroupBy(param.getBlockId(), date);
			if (realTimeAnalysis.size() > 0) {
				Map<String, RealTimeAnalysis> realTimeAnalysisMap = Maps.uniqueIndex(realTimeAnalysis, RealTimeAnalysis::getHour);
				highChartInfo.addSeries(highChartService.createLeakageAnalysisChartInfo(date, realTimeAnalysisMap));
			}
		}
		
		LeakageAnalysisInfo analysisInfo = new LeakageAnalysisInfo();
		analysisInfo.setLeakageAnalysis(leakageAnalysisList);
		analysisInfo.setHighChartInfo(highChartInfo);
		
		return analysisInfo;
	}
	
	/**
	 * 유량 최대 증가 분석
	 * @param leakageAnalysis
	 * @param realTimeMeasurements
	 */
	private void setFlowData(LeakageAnalysis leakageAnalysis, List<RealTimeMeasurement> realTimeMeasurements) {
		float maxIncreaseFlow = 0;
		RealTimeMeasurement preMeasurement = null;
		RealTimeMeasurement realTimeMeasurement = realTimeMeasurements.get(0);
		RealTimeMeasurement temp = realTimeMeasurement;
		for (int i = 1; i < realTimeMeasurements.size(); i++) {
			RealTimeMeasurement measurement = realTimeMeasurements.get(i);
			if (Integer.parseInt(minuteFormat.format(measurement.getDatetime())) % 10 == 0) {
				float increaseFlow = measurement.getFlow() - temp.getFlow();
				if (increaseFlow > maxIncreaseFlow) {
					maxIncreaseFlow = increaseFlow;
					
					preMeasurement = temp;
					realTimeMeasurement = measurement;
				}
				
				temp = measurement;
			}
		}
		
		leakageAnalysis.setFlowMaxRatio(round((1 - preMeasurement.getFlow() / realTimeMeasurement.getFlow()) * 100) + " %");
		leakageAnalysis.setFlowMaxTime(DateUtil.toMinuteString(preMeasurement.getDatetime()) + "~" + DateUtil.toMinuteString(realTimeMeasurement.getDatetime()));
	}
	
	/**
	 * 수압 최대감소 분석
	 * @param leakageAnalysis
	 * @param realTimeMeasurements
	 */
	private void setPressureData(LeakageAnalysis leakageAnalysis, List<RealTimeMeasurement> realTimeMeasurements) {
		float maxDecreasePressure = 0;
		RealTimeMeasurement preMeasurement = null;
		RealTimeMeasurement realTimeMeasurement = realTimeMeasurements.get(0);
		RealTimeMeasurement temp = realTimeMeasurement;
		for (int i = 1; i < realTimeMeasurements.size(); i++) {
			RealTimeMeasurement measurement = realTimeMeasurements.get(i);
			if (Integer.parseInt(minuteFormat.format(measurement.getDatetime())) % 10 == 0) {
				float decreasePressure = measurement.getPressure() - temp.getPressure();
				if (decreasePressure < maxDecreasePressure) { 
					maxDecreasePressure = decreasePressure;
					
					preMeasurement = temp;
					realTimeMeasurement = measurement;
				}
				
				temp = measurement;
			}
		}
		
		leakageAnalysis.setPressureRatio(round((1 - realTimeMeasurement.getPressure() / preMeasurement.getPressure()) * 100) + " %");
		leakageAnalysis.setPressureTime(DateUtil.toMinuteString(preMeasurement.getDatetime()) + "~" + DateUtil.toMinuteString(realTimeMeasurement.getDatetime()));
	}
	
	/**
	 * 야간최소 유량분석 정보 가져오기
	 * @param param
	 * @return
	 */
	public NightMinFlowAnalysisInfo createNightMinFlowAnalysisInfo(LeakageAnalysisSearchParam param) {
		String startDate = DateUtil.getWeekAgeDate(param.getSelectDate(), param.getAnalysisPeroid().getValue());
		String endDate = param.getSelectDate();
		startDate = "2014-05-08";
		endDate = "2014-05-15";
		
		List<NightMinFlowAnalysis> analysisList = nightMinFlowService.getList(param.getBlockId(), startDate, endDate)
				.stream().map(data -> {
					NightMinFlowAnalysis analysis = new NightMinFlowAnalysis(data);
					Holiday holiday = holidayService.get(DateUtil.toSmallDateString(analysis.getDatetime()));
					AlarmLeakage alarmLeakage = alarmLeakageService.get(data.getDatetime(), data.getBkFlctcFm());
					RealTimeMeasurement measurement = realTimeMeasurementService.get(data.getBkFlctcFm(), data.getDatetime());
					analysis.setHoliday(holiday.isHoliday() ? "휴일" : "");
					analysis.setLeakageJudgment(alarmLeakage == null ? "정상" : "초과");
					analysis.setSumFlow(measurement.getSumFlow());
					return analysis;
				}).collect(Collectors.toList());
		
		NightMinFlowAnalysisInfo info = new NightMinFlowAnalysisInfo();
		info.setNightMinFlowAnalysisList(analysisList);
		info.setHighChartInfo(highChartService.createMinFlowAnalysisChartInfo(analysisList));
		if (analysisList.size() > 0)
			info.setAllowFlow(analysisList.get(0).getAllowFlow());
		
		return info;
	}
	
	/**
	 * 소수점 첫째자리 반올림
	 * @param value
	 * @return
	 */
	private float round(double value) {
		return Math.round(value * 10f) / 10f;
	}
}
