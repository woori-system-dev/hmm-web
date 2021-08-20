package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 소블록 정보 - 유량계
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "WTL_FLOW_PS")
@Data
public class FlowDevice implements Domain {
	
	/** 시설물번호 */
	@Id
	private long ftrIdn;

	/** 지형지물부호 */
	@Column(nullable = false, length = 5)
	private String ftrCde;
	
	@Column(length = 10)
	private String hjdCde;
	
	@Column(length = 10)
	private String shtNum;

	@Column(length = 6)
	private String mngCde;

	@Column(length = 8)
	private String istYmd;

	@Column(length = 6)
	private String gagCde;
	
	@Column(length = 6)
	private String mofCde;
	
	private int floDip;

	@Column(length = 5)
	private String pipCde;
	
	private int pipIdn;
	
	@Column(length = 10)
	private String cntNum;
	
	@Column(length = 1)
	private String sysChk;
	
	private int angDir;
	
	@Column(length = 50)
	private String ftrUsr;
	
	@Column(length = 10)
	private String ftrTim;

	@Column(length = 50)
	private String attUsr;

	@Column(length = 10)
	private String attTim;

	@Column(length = 15)
	private String sdtNum;
	
	private int lFlctcFm;

	private int mFlctcFm;
	
	private int sFlctcFm;
	
	private int ssFlctcFm;
	
	/** 좌표값 */
	private String coords;
}
