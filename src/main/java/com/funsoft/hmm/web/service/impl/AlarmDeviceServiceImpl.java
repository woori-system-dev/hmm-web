package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.repository.AlarmDeviceRepository;
import com.funsoft.hmm.web.service.AlarmDeviceService;

@Service
@Transactional
public class AlarmDeviceServiceImpl implements AlarmDeviceService {
	
	@Autowired
	private AlarmDeviceRepository alarmDeviceRepository;

	@Override
	public AlarmDevice get(CompositePK id) {
		return alarmDeviceRepository.findById(id).get();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AlarmDevice> getList() {
		return alarmDeviceRepository.findAll();
	}

	@Override
	public boolean regist(AlarmDevice domain) {
		if (isNew(domain)) {
			return alarmDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(AlarmDevice domain) {
		if (!isNew(domain)) {
			return alarmDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(AlarmDevice domain) {
		alarmDeviceRepository.delete(domain);
		return true;
	}

	private boolean isNew(AlarmDevice domain) {
		return !alarmDeviceRepository.existsById(new CompositePK(domain.getDatetime(), domain.getBkFlctcFm()));
	}

	@Transactional(readOnly = true)
	@Override
	public List<AlarmDevice> getList(long blockId, String date) {
		return alarmDeviceRepository.findByBkFlctcFmAndDate(blockId, date);
	}

	@Override
	public List<AlarmDevice> getList(String startDate, String endDate) {
		return alarmDeviceRepository.findByBetween(startDate, endDate);
	}

	@Override
	public List<AlarmDevice> getList(long blockId, String startDate, String endDate) {
		return alarmDeviceRepository.findByBkFlctcFmAndDate(blockId, startDate, endDate);
	}

}
