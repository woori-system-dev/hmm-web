package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;

import lombok.Data;

/**
 * 실시간 모니터링 정보 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class RealTimeMonitoring {

	private String blockName;

	private String dateTime;

	/** 수압 */
	private float pressure;

	/** 유량 */
	private float flow;

	public RealTimeMonitoring(String blockName, RealTimeMeasurement measurement) {
		this.blockName = blockName;
		
		if (measurement != null) {
			this.pressure = measurement.getPressure();
			this.flow = measurement.getFlow();
			this.dateTime = DateUtil.toDateTimeString(measurement.getDatetime());
		}
			
	}
}
