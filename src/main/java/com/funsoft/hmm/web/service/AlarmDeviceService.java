package com.funsoft.hmm.web.service;

import java.util.List;

import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmDeviceService extends CRUDService<AlarmDevice, CompositePK> {

	List<AlarmDevice> getList(long blockId, String date);

	List<AlarmDevice> getList(String startDate, String endDate);

	List<AlarmDevice> getList(long blockId, String startDate, String endDate);
}
