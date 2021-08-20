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
import lombok.NoArgsConstructor;

/**
 * 야간최소유량
 * - 24시간에 한번씩 야간 최소유량을 산정하여 데이터를 갖는 테이블
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "FEP_MINFLOW")
@Data
@IdClass(CompositePK.class)
@NoArgsConstructor
public class NightMinFlow implements Domain {

	/** 측정시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 지형지물부호 */
	@Column(length = 5)
	private String bkFlctcCde;
	
	/** 허용유량 데이터(m3/s) */
	private float allowFlow;
	
	/** 순시유량 데이터(m3/s) */
	private float flow;
	
	/** 수압 데이터(kg/cm2) */
	private float pressure;
	
	/** 공휴일 */
	private boolean holiday;
	
	public NightMinFlow(RealTimeMeasurement measurement) {
		this.datetime = measurement.getDatetime();
		this.bkFlctcCde = measurement.getBkFlctcCde();
		this.bkFlctcFm = measurement.getBkFlctcFm();
		this.flow = measurement.getFlow();
		this.pressure = measurement.getPressure();
	}
}
