package com.funsoft.hmm.web.domain;

import lombok.Data;

@Data
public class RealTimeAnalysis implements Domain, Comparable<RealTimeAnalysis> {

	private String hour;
	
	private float flow;
	
	private long count;
	
	public RealTimeAnalysis() {
	}
	
	public RealTimeAnalysis(String hour, double flow) {
		this.hour = hour + ":00";
		this.flow = (float) flow;
	}
	
	public RealTimeAnalysis(float flow, long count) {
		this.flow = flow;
		this.count = count;
	}

	@Override
	public int compareTo(RealTimeAnalysis o) {
		return hour.compareTo(o.getHour());
	}
}
