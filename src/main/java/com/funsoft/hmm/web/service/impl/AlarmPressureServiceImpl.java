package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.AlarmPressure;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.repository.AlarmPressureRepository;
import com.funsoft.hmm.web.service.AlarmPressureService;

@Service
@Transactional
public class AlarmPressureServiceImpl implements AlarmPressureService {
	
	@Autowired
	private AlarmPressureRepository alarmPressureRepository;

	@Override
	public AlarmPressure get(CompositePK id) {
		return alarmPressureRepository.findById(id).get();
	}
	
	@Override
	public List<AlarmPressure> getList() {
		return alarmPressureRepository.findAll();
	}

	@Override
	public boolean regist(AlarmPressure domain) {
		if (isNew(domain)) {
			return alarmPressureRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(AlarmPressure domain) {
		if (!isNew(domain)) {
			return alarmPressureRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(AlarmPressure domain) {
		alarmPressureRepository.delete(domain);
		return true;
	}

	private boolean isNew(AlarmPressure domain) {
		return !alarmPressureRepository.existsById(new CompositePK(domain.getDatetime(), domain.getBkFlctcFm()));
	}

	@Override
	public List<AlarmPressure> getList(long blockId, String date) {
		return alarmPressureRepository.findByBkFlctcFmAndDate(blockId, date);
	}

}
