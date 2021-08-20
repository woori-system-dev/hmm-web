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
 * 기기이상 알람
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "ALM_DEVICE")
@Data
@IdClass(CompositePK.class)
public class AlarmDevice implements Domain {

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
	
	/** 문열림알람(0:닫힘, 1:열림) */
	private boolean opnDr;
	
	/** 기기연결불가알람(0:정상, 1:비정상) */
	private boolean deviceErr;
}
