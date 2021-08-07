package com.funsoft.hmm.web.service;

import com.funsoft.hmm.web.domain.db.AlarmThreshold;

public interface AlarmThresholdService extends CRUDService<AlarmThreshold, Long> {

	AlarmThreshold get(long flctcFm);
}
