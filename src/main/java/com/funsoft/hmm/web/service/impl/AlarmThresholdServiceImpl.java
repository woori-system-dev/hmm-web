package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.AlarmThreshold;
import com.funsoft.hmm.web.repository.AlarmThresholdRepository;
import com.funsoft.hmm.web.service.AlarmThresholdService;

/**
 * 임계치 알람 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class AlarmThresholdServiceImpl implements AlarmThresholdService {
	
	@Autowired
	private AlarmThresholdRepository alarmThresholdRepository;

	@Override
	public AlarmThreshold get(Long id) {
		return alarmThresholdRepository.findById(id).get();
	}

	@Override
	public List<AlarmThreshold> getList() {
		return alarmThresholdRepository.findAll();
	}

	@Override
	public boolean regist(AlarmThreshold domain) {
		if (isNew(domain)) {
			return alarmThresholdRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(AlarmThreshold domain) {
		if (!isNew(domain)) {
			return alarmThresholdRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(AlarmThreshold domain) {
		alarmThresholdRepository.delete(domain);
		return true;
	}

	private boolean isNew(AlarmThreshold domain) {
		return !alarmThresholdRepository.existsById(domain.getFlctcFm());
	}

	@Override
	public AlarmThreshold get(long flctcFm) {
		return alarmThresholdRepository.findById(flctcFm).get();
	}
}
