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
	
	/** 지형지물부호 */
	@Column(nullable = false, length = 5)
	private String bkFlctcCde;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 누수판단알람 */
	private boolean leakPrdt;
	
	/** 설정허용유량 */
	private float allowFlowSet;
	
	/** 계측된최저유량 */
	private float flow;
	
	/** 허용유량차 */
	private float flowGap;
	
	/** 수압 */
	private float pressure;
	
	/** 지속시간 */
	private int lastPeriod;
}
