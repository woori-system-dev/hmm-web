package com.funsoft.hmm.web.domain.chart;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class HighChartSeries {

	private String name;

	private List<Float> data;
	
	public HighChartSeries(String name) {
		this.name = name;
		
		data = new ArrayList<>();
	}
	
	public void addDataItem(float value) {
		data.add(value);
	}
}
