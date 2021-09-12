package com.funsoft.hmm.web.domain;

import com.funsoft.hmm.web.domain.db.BlockSmall;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 알람 이력 도메인 클래스
 * 
 * @author hgko
 *
 */
@Getter
@Setter
@NoArgsConstructor
public class AlarmHistory {

	/** 블록Id */
	private long blockId;

	/** 블록명 */
	private String blockName;
	
	/** 고수압 */
	private String highPressure;
	
	/** 저수압 */
	private String lowPressure;
	
	/** 문열림 */
	private String doorOpen;
	
	/** 통신이상 */
	private String deviceError;
	
	public AlarmHistory(BlockSmall blockSmalle, long highPressure, long lowPressure, long doorOpen, long deviceError) {
		this.blockId = blockSmalle.getFlctcFm();
		this.blockName = blockSmalle.getBkNm();
		this.highPressure = highPressure + " 건";
		this.lowPressure = lowPressure + " 건";
		this.doorOpen = doorOpen + " 건";
		this.deviceError = deviceError + " 건";
	}
}
