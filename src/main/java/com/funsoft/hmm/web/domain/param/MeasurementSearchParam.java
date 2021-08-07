package com.funsoft.hmm.web.domain.param;

import lombok.Data;

/**
 * 계측 이력 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class MeasurementSearchParam {
	
	private long blockId;
	
	private String startDate;
	
	private String endDate;
}
