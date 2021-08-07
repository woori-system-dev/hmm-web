package com.funsoft.hmm.web.domain;

import java.util.Date;
import java.util.List;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.chart.HighChartInfo;
import com.funsoft.hmm.web.domain.db.NightMinFlow;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 야간최소유량분석 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class NightMinFlowAnalysisInfo {

	private List<NightMinFlowAnalysis> nightMinFlowAnalysisList;

	private HighChartInfo highChartInfo;

	private float allowFlow;

	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class NightMinFlowAnalysis {

		private Date datetime;

		private String date;

		private float flow;

		private float pressure;

		private String time;

		/** 허용유량 */
		private float allowFlow;

		private float sumFlow;

		private String holiday;

		private String over;

		private String leakageJudgment;

		private String leakageAmount;

		public NightMinFlowAnalysis(NightMinFlow flow) {
			this.datetime = flow.getDatetime();
			this.date = DateUtil.toMonthString(flow.getDatetime());
			this.time = DateUtil.toMinuteString(flow.getDatetime());
			this.flow = flow.getFlow();
			this.pressure = flow.getPressure();
			this.allowFlow = flow.getAllowFlow();
		}
	}
}
