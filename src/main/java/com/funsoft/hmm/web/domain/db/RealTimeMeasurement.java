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

	/** 측정시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 입력시간 */
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date inDatetime;
	
	/** 지형지물부호 */
	@Column
	private String bkFlctcCde;
	
	/** 수압 */
	private float pressure;
	
	/** 순시유량 */
	private float flow;
	
	/** 적산유량 */
	private float sumFlow;
	
	/** 공휴일 유무 */
	private boolean holiday;
	
	public RealTimeMeasurement(Date datetime, long bkFlctcFm, float flow) {
		this.datetime = datetime;
		this.bkFlctcFm = bkFlctcFm;
		this.flow = flow;
	}
}
