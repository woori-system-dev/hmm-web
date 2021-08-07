package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.Weather;

import lombok.Data;

/**
 * 수압패턴분석 정보 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class PressurePatternAnalysisInfo {

	private Weather weather;
	
	private HighChartInfo highChartInfo;
}
