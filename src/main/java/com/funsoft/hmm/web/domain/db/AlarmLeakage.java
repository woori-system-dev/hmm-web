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
 * 누수판단 알람
 * - 누수판단 알람정보
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "ALM_LEAKAGE")
@Data
@IdClass(CompositePK.class)
public class AlarmLeakage implements Domain {

	/** 측정시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 지형지물부호 */
	@Column(nullable = false, length = 5)
	private String bkFlctcCde;
	
	/** 누수판단알람(0:정상, 1:누수) */
	private boolean leakPrdt;
	
	/** 설정된 허용유량 데이터(m3/s) */
	private float allowFlowSet;
	
	/** 계측된 최저유량 데이터(m3/s) */
	private float flow;
	
	/** 허용유량차(계측된 최저유량 - 설정된 허용유량 차) */
	private float flowGap;
	
	/** 수압 - 최저유량 시 수압 데이터(m3/s) */
	private float pressure;
	
	/** 지속시간 - 허용유량을 넘어서 지속된 기간(날짜) */
	private int lastPeriod;
}
