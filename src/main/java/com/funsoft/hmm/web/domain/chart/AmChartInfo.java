package com.funsoft.hmm.web.domain.chart;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * amCharts의 LineChart 정보 클래스
 * 
 * @author hgko
 *
 */
@Data
public class AmChartInfo {
	
	private List<AmChartDualData> chartDualDatas;
	
	public AmChartInfo() {
		chartDualDatas = new ArrayList<>();
	}
	
	public void addDualData(AmChartDualData data) {
		chartDualDatas.add(data);
	}

	@Data
	@AllArgsConstructor
	public static class AmChartDualData {
		
		private String Date; 
		
		private float first;
		
		private float second;
	}
}
