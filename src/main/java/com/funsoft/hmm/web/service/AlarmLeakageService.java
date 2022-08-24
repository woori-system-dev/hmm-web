package com.funsoft.hmm.web.service;

import java.util.Date;
import java.util.List;

import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmLeakageService extends CRUDService<AlarmLeakage, CompositePK> {

	AlarmLeakage get(Date date, long bkFlctcFm);
	
	List<AlarmLeakage> getList(long blockId, String date);

	List<AlarmLeakage> getList(String startDate, String endDate);
}
