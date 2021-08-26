package com.funsoft.hmm.web.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.repository.AlarmLeakageRepository;
import com.funsoft.hmm.web.service.AlarmLeakageService;

/**
 * 누수 알람 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class AlarmLeakageServiceImpl implements AlarmLeakageService {
	
	@Autowired
	private AlarmLeakageRepository alarmLeakageRepository;

	@Override
	public AlarmLeakage get(CompositePK id) {
		return alarmLeakageRepository.findById(id).get();
	}
	
	@Override
	public List<AlarmLeakage> getList() {
		return alarmLeakageRepository.findAll();
	}

	@Override
	public boolean regist(AlarmLeakage domain) {
		if (isNew(domain)) {
			return alarmLeakageRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(AlarmLeakage domain) {
		if (!isNew(domain)) {
			return alarmLeakageRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(AlarmLeakage domain) {
		alarmLeakageRepository.delete(domain);
		return true;
	}

	private boolean isNew(AlarmLeakage domain) {
		return !alarmLeakageRepository.existsById(new CompositePK(domain.getDatetime(), domain.getBkFlctcFm()));
	}

	@Override
	public AlarmLeakage get(Date date, long bkFlctcFm) {
		return alarmLeakageRepository.findByDatetimeAndBkFlctcFm(date, bkFlctcFm);
	}

	@Override
	public List<AlarmLeakage> getList(long blockId, String date) {
		return alarmLeakageRepository.findByBlockAndDate(blockId, date);
	}

	@Override
	public List<AlarmLeakage> getList(String startDate, String endDate) {
		return alarmLeakageRepository.findByBetween(startDate, endDate);
	}

}
