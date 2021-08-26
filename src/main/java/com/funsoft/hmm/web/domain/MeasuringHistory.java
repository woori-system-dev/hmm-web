package com.funsoft.hmm.web.domain;

import java.text.DecimalFormat;
import java.util.Date;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 계측 이력 리스트 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
@NoArgsConstructor
public class MeasuringHistory implements Domain, Comparable<MeasuringHistory> {
	
	private DecimalFormat format = new DecimalFormat("#,##0");
	
	private Date date;
	
	private String dateTime;
	
	private long blockId;
	
	private String blockName;
	
	private float pressure;
	
	private float flow;
	
	private String sumFlowString;
	
	private float sumFlow;
	
	private int alarmPressure;
	
	private int alarmDevice;
	
	private int alarmLeakage;
	
	public MeasuringHistory(String blockName, RealTimeMeasurement measurement) {
		this.date = measurement.getDatetime();
		this.dateTime = DateUtil.toDateTimeString(measurement.getDatetime());
		this.blockName = blockName;
		this.blockId = measurement.getBkFlctcFm();
		this.pressure = measurement.getPressure();
		this.flow = measurement.getFlow();
		this.sumFlowString = format.format(measurement.getSumFlow());
		this.sumFlow = measurement.getSumFlow();
	}
	
	public MeasuringHistory(RealTimeMeasurement measurement) {
		this.date = measurement.getDatetime();
		this.dateTime = DateUtil.toDateTimeString(measurement.getDatetime());
		this.blockId = measurement.getBkFlctcFm();
		this.pressure = measurement.getPressure();
		this.flow = measurement.getFlow();
		this.sumFlowString = format.format(measurement.getSumFlow());
		this.sumFlow = measurement.getSumFlow();
	}

	@Override
	public int compareTo(MeasuringHistory o) {
		return dateTime.compareTo(o.getDateTime());
	}
			
}
