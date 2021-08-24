package com.funsoft.hmm.web.domain.param;

import lombok.Data;

/**
 * 수도 검침 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class SudoGumchimParam {
	
	/** 관리번호 */
	private String suyNo;
	
	/** 상수업종 */
	private String sangBiz;
	
	/** 계기번호 */
	private String metaNum;

	private String startDate;
	
	private String endDate;
}
