package com.funsoft.hmm.web.service;

import java.util.List;

import com.funsoft.hmm.web.domain.db.AlarmPressure;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmPressureService extends CRUDService<AlarmPressure, CompositePK> {

	List<AlarmPressure> getList(long blockId, String date);

	List<AlarmPressure> getList(String startDate, String endDate);
}
