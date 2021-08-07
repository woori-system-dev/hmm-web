package com.funsoft.hmm.web.service.info;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.DistributionAnalysisInfo;
import com.funsoft.hmm.web.domain.DistributionAnalysisInfo.DistributionAnalysis;
import com.funsoft.hmm.web.domain.PressureAnalysisInfo;
import com.funsoft.hmm.web.domain.PressureAnalysisInfo.PressureAnalysis;
import com.funsoft.hmm.web.domain.PressurePatternAnalysisInfo;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.Weather;
import com.funsoft.hmm.web.domain.param.PatternSearchParam;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.Holiday;
import com.funsoft.hmm.web.domain.param.PressureAnalysisSearchParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.HolidayService;
import com.funsoft.hmm.web.service.WeatherService;
import com.funsoft.hmm.web.service.chart.HighChartService;

/**
 * 수압분석 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class PressureAnalysisInfoService {
	
	@Autowired
	private HighChartService highChartService;
	
	@Autowired
	private BlockSmallService blockSmallService;
	
	@Autowired
	private WeatherService weatherService;
	
	@Autowired
	private HolidayService holidayService;
	
	/**
	 * 수압분석 정보 가져오기
	 * @param param 
	 * @return
	 */
	public PressureAnalysisInfo createPressureAnalysisInfo(PressureAnalysisSearchParam param) {
		
		HighChartInfo chartInfo = highChartService.createPressureAnalysisChartInfo(param);
		
		PressureAnalysis pressureAnalysis = new PressureAnalysis();
		pressureAnalysis.setHolidayAnalysisMax(chartInfo.getSeriesList().get(0).getData().stream().max(Float::compare).get());
		pressureAnalysis.setHolidayAnalysisMin(chartInfo.getSeriesList().get(0).getData().stream().min(Float::compare).get());
		pressureAnalysis.setWeekdayAnalysisMax(chartInfo.getSeriesList().get(1).getData().stream().max(Float::compare).get());
		pressureAnalysis.setWeekdayAnalysisMin(chartInfo.getSeriesList().get(1).getData().stream().min(Float::compare).get());
		
		PressureAnalysisInfo info = new PressureAnalysisInfo();
		info.setPressureAnalysis(pressureAnalysis);
		info.setHighChartInfo(chartInfo);
		
		return info;
	}
	
	/**
	 * 수압분포분석 정보 가져오기
	 * @param param
	 * @return
	 */
	public DistributionAnalysisInfo createDistributionAnalysisInfo(PressureAnalysisSearchParam param) {
		
		DistributionAnalysisInfo info = new DistributionAnalysisInfo();
		
		HighChartInfo chartInfo = new HighChartInfo("비율(%)");
		chartInfo.addSeries(highChartService.createDistributionAnalysisChartSeries(param));
		info.setHighChartInfo(chartInfo);
		
		List<DistributionAnalysis> analysisList = new ArrayList<>();
		for(String block : param.getBlockList()) {
			DistributionAnalysis analysis = new DistributionAnalysis();
			analysis.setBlockName(blockSmallService.get(Long.parseLong(block)).getBkNm());
			analysisList.add(analysis);
		}
		
		info.setResults(analysisList);
		
		return info;
	}
	
	public PressurePatternAnalysisInfo createPressurePatternAnalysisInfo(PatternSearchParam param) {
		PressurePatternAnalysisInfo info = new PressurePatternAnalysisInfo();
		
		System.err.println(param);
		
		return info;
	}
	
	public PatternSearchParam currentWeatherSetting() {
		Weather weather = weatherService.get(DateUtil.toDateString(new Date()));
		if (weather == null) {
			weather = weatherService.getLastWeather();
		}
		
		System.err.println(weather);
		
		PatternSearchParam param = new PatternSearchParam();
		param.setHoliday(holidayService.get(DateUtil.toSmallDateString(new Date())).isHoliday() ? Holiday.휴일 : Holiday.평일);
		
		return param;
	}
}
