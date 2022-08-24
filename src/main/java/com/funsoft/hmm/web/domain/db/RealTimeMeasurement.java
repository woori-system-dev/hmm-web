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
 * 실시간 계측
 * - 실시간 계측된 순시유량, 적산유량, 수압 데이터 테이블
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "FEP_REAL")
@Data
@IdClass(CompositePK.class)
@NoArgsConstructor
public class RealTimeMeasurement implements Domain {

	/** 측정시간 - 실시간 수집된 데이터의 측정시간(00초로 끝나도록 보정된 시간) */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 입력시간 - 실시간 수집된 데이터의 입력시간(실제 데이터를 받아 입력하는 시간) */
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date inDatetime;
	
	/** 지형지물부호 */
	@Column
	private String bkFlctcCde;
	
	/** 수압 데이터(kg/cm2) */
	private float pressure;
	
	/** 순시유량 데이터(m3/s) */
	private float flow;
	
	/** 적산유량 데이터(m3/s) */
	private float sumFlow;
	
	/** 공휴일 유무 */
//	private boolean holiday;
	
	public RealTimeMeasurement(Date datetime, long bkFlctcFm, float flow) {
		this.datetime = datetime;
		this.bkFlctcFm = bkFlctcFm;
		this.flow = flow;
	}
}
