package com.funsoft.hmm.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 알람 이력 테이블
 * 
 * @author hgko
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmHistoryTable {
	
	/** 블록명 */
	private String blockName;

	/** 시작시간 */
	private String startTime;
	
	/** 종료시간 */
	private String endTime;
	
	/** 알람타입 */
	private String alarmType;
	
	/** 단계 */
	private String step;
	
	/** 지속시간 */
	private String durationTime;
	
	/** 건수 */
	private int count;
}
