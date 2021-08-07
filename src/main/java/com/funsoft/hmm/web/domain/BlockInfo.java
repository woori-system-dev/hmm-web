package com.funsoft.hmm.web.domain;

import lombok.Data;

/**
 * 블록 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class BlockInfo implements Domain {
	
	private String dateTime;
	
	/** 시설물번호 */
	private long flctcFm;
	
	/** 블록명칭 */
	private String bkNm;
	
	/** 유량계 번호 */
	private int fmtIdn;
	
	/** 유량계 설치일자 */
	private String flowDate;
	
	/** 수압계 번호 */
	private int pmtIdn;
	
	/** 수압계 설치일자 */
	private String prgaDate;
	
	private String pressureDate;
	
	public BlockInfo() {
	}
	
	public BlockInfo(String bkNm) {
		this.bkNm = bkNm;
	}
	
	public BlockInfo(long flctcFm, String bkNm) {
		this.flctcFm = flctcFm;
		this.bkNm = bkNm;
	}
	
}
