package com.funsoft.hmm.web.service;

import com.funsoft.hmm.web.domain.db.Holiday;

public interface HolidayService extends CRUDService<Holiday, Integer> {
	
	public Holiday get(String date);
}
