package com.funsoft.hmm.web.service.chart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.MeasuringHistory;
import com.funsoft.hmm.web.domain.chart.AmChartInfo;
import com.funsoft.hmm.web.domain.chart.AmChartInfo.AmChartDualData;

/**
 * AmCharts 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class AmChartService {

	public AmChartInfo createMeasurementChart(List<MeasuringHistory> histories) {
		AmChartInfo amChartInfo = new AmChartInfo();
		
		histories.stream().sorted().forEach(data -> {
			amChartInfo.addDualData(new AmChartDualData(data.getDateTime(), data.getFlow(), data.getPressure()));
		});
		
		return amChartInfo;
	}
}
