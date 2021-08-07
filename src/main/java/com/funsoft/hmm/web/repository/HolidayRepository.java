package com.funsoft.hmm.web.repository;

import com.funsoft.hmm.web.domain.db.Holiday;

public interface HolidayRepository extends DefaultRepository<Holiday, Integer> {
	
	Holiday findByYearAndMonthAndDay(String year, String month, String day);
}
