package com.funsoft.hmm.web.domain;

import java.text.SimpleDateFormat;

import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.AlarmPressure;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 알람 이력 테이블
 * 
 * @author hgko
 *
 */
@Data
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
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	
	public AlarmHistoryTable(AlarmDevice data, String alarmType) {
		this.startTime = dateFormat.format(data.getDatetime());
		this.alarmType = alarmType;
	}

	public AlarmHistoryTable(AlarmPressure data) {
		this.startTime = dateFormat.format(data.getDatetime());
		this.alarmType = "수압이상";
		this.step = data.getPrsAbnm().toString();
	}
}
