package com.funsoft.hmm.web.domain;

import java.util.List;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.NightMinFlow;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 누수분석 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LeakageAnalysisInfo {

	private HighChartInfo highChartInfo;

	private List<LeakageAnalysis> leakageAnalysis;

	@Data
	public static class LeakageAnalysis {

		private String date;

		private float flow;

		private String flowTime;

		private float pressure;

		private String flowMaxRatio;

		private String flowMaxTime;

		private String pressureRatio;

		private String pressureTime;

		/** 누수판단 */
		private String judgment;

		public LeakageAnalysis(NightMinFlow nightMinFlow) {
			this.date = DateUtil.toDateString(nightMinFlow.getDatetime());
			this.flow = nightMinFlow.getFlow();
			this.pressure = nightMinFlow.getPressure();
			this.flowTime = DateUtil.toMinuteString(nightMinFlow.getDatetime());
		}
	}
}
