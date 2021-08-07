package com.funsoft.hmm.web.domain.db;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 야간최소유량
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "FEP_MINFLOW")
@Data
@IdClass(CompositePK.class)
public class NightMinFlow implements Domain {

	/** 측정시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 지형지물부호 */
	@Column(length = 5)
	private String bkFlctcCde;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 허용유량 */
	private float allowFlow;
	
	/** 순시유량 */
	private float flow;
	
	/** 수압 */
	private float pressure;
	
	private boolean holiday;
	
	public NightMinFlow() {
	}
	
	public NightMinFlow(RealTimeMeasurement measurement) {
		this.datetime = measurement.getDatetime();
		this.bkFlctcCde = measurement.getBkFlctcCde();
		this.bkFlctcFm = measurement.getBkFlctcFm();
		this.flow = measurement.getFlow();
		this.pressure = measurement.getPressure();
	}
}
