package com.funsoft.hmm.web.service;

import java.util.Date;
import java.util.List;

import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;

public interface RealTimeMeasurementService extends CRUDService<RealTimeMeasurement, CompositePK> {
	
	RealTimeMeasurement get(long bkFlctcFm, Date date);
	
	RealTimeMeasurement getRecentData(long blockId);

	RealTimeMeasurement getRecentData(long blockId, String dateTime);
	
	List<RealTimeMeasurement> findByBkFlctcFmAndDate(long blockId, String date);
	
	List<RealTimeMeasurement> getList(long blockId, String dateTime);
	
	List<RealTimeMeasurement> getList(long blockId, String startDate, String endDate);
	
	List<RealTimeAnalysis> findByGroupBy(long blockId, String startDate, String endDate);
}
