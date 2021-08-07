package com.funsoft.hmm.web.domain.param;

import lombok.Data;

/**
 * 알람 이력 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class AlarmSearchParam {

	private long blockId;
	
	private String startDate;
	
	private String endDate;
	
	/** 수압이상 */
	private boolean pressure;
	
	/** 문열림 */
	private boolean openDoor;
	
	/** 통신이상 */
	private boolean deviceError;
}
