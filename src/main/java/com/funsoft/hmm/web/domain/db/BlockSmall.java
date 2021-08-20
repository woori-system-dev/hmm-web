package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 소블록 정보
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "WTL_BLOKS_AS")
@Data
public class BlockSmall implements Domain {
	
	/** 시설물번호 */
	@Id
	private long flctcFm;

	/** 지형지물부호 */
	@Column(nullable = false, length = 5)
	private String flctcCde;
	
	/** 블록명칭 */
	@Column(length = 255)
	private String bkNm;
	
	/** 지역코드(구역코드) */
	@Column(length = 10)
	private String zoneZn;
	
	/** 소재지주소 */
	@Column(length = 200)
	private String addressArDc;
	
	/** 중블록번호 - 상위블록(중블록)의 시설물 번호 */
	private long usFlctcFm;
	
	/** 도입시기 */
	@Column(length = 8)
	private String itoDe;
	
	/** TM/TC 설치여부 */
	@Column(length = 1)
	private String tmtcSwAt;
	
	/** TM/TC 설치개수 */
	private long tmtcSwCo;
	
	/** 블록관로연장 */
	@Column(length = 20)
	private String bkPipeEx;
	
	/** 블록급수인구 */
	private int bkWspPopCo;
	
	/** 유량계 번호 */
	private int fmtIdn;
	
	/** 수압계 번호 */
	private int pmtIdn;
	
	/** 수질계측기 번호 */
	private int cmtIdn;
	
	/** 유입지점 개수 - 해당 블록으로 들어오는 유입지점의 개수(단위:개) */
	private int inpNum;
	
	/** 유입관로 번호 - 해당 블록으로 들어오는 유입관로의 관리번호 */
	private int ipiIdn;
	
	/** 좌표값 - WKT 타입의 좌표값 */
	private String coords;
}
