package com.funsoft.hmm.web.domain.chart;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * Highcharts의 LineChart 정보 클래스
 * 
 * @author hgko
 *
 */
@Data
public class HighChartInfo {

	private String title;
	
	private String yAxis;

	private List<String> categories;
	
	private List<HighChartSeries> seriesList;
	
	private HighChartSeries firstSeries;
	
	private HighChartSeries secondSeries;
	
	private List<LineChartSeries> lineSeriesList;
	
	public HighChartInfo(String title, String yAxis) {
		this.title = title;
		this.yAxis = yAxis;
		
		categories = new ArrayList<>();
		seriesList = new ArrayList<>();
	}
	
	public HighChartInfo(String yAxis) {
		this.yAxis = yAxis;
		
		lineSeriesList = new ArrayList<>();
	}
	
	public void addCategoty(String value) {
		categories.add(value);
	}
	
	public void addSeries(HighChartSeries series) {
		seriesList.add(series);
	}
	
	public void addSeries(LineChartSeries series) {
		lineSeriesList.add(series);
	}
}
