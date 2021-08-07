package com.funsoft.hmm.web.service;

import java.util.List;

import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.NightMinFlow;

public interface NightMinFlowService extends CRUDService<NightMinFlow, CompositePK> {

	NightMinFlow get(long blockId, String selectDate);
	
	List<NightMinFlow> getList(long blockId, String startDate, String endDate);
	
	List<NightMinFlow> findByBkFlctcFmAndDate(long blockId, String date);
}
