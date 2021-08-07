package com.funsoft.hmm.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlarmHistoryTable {

	private String startTime;
	
	private String endTime;
	
	private String alarmType;
	
	private String step;
	
	private String durationTime;
}
