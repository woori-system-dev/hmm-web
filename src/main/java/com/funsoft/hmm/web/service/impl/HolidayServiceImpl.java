package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.Holiday;
import com.funsoft.hmm.web.repository.HolidayRepository;
import com.funsoft.hmm.web.service.HolidayService;

/**
 * 휴일 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class HolidayServiceImpl implements HolidayService {
	
	@Autowired
	private HolidayRepository holidayRepository;

	@Override
	public Holiday get(Integer id) {
		return holidayRepository.findById(id).get();
	}
	
	@Override
	public List<Holiday> getList() {
		return null;
	}

	@Override
	public boolean regist(Holiday domain) {
		if (isNew(domain)) {
			return holidayRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Holiday domain) {
		if (!isNew(domain)) {
			return holidayRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Holiday domain) {
		holidayRepository.delete(domain);
		return true;
	}

	private boolean isNew(Holiday flowDevice) {
		return !holidayRepository.existsById(flowDevice.getIdx());
	}

	@Override
	public Holiday get(String date) {
		String[] dates = date.split("-");
		return holidayRepository.findByYearAndMonthAndDay(dates[0], dates[1], dates[2]);
	}

}
