package com.funsoft.hmm.web.domain.chart;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class LineChartSeries {
	
	private String name;

	private List<int[]> data;
	
	public LineChartSeries(String name) {
		this.name = name;
		
		data = new ArrayList<>();
	}
	
	public void addDataItem(int[] value) {
		data.add(value);
	}
}
