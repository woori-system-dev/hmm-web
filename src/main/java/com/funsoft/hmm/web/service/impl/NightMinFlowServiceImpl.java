package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.NightMinFlow;
import com.funsoft.hmm.web.repository.NightMinFlowRepository;
import com.funsoft.hmm.web.service.NightMinFlowService;

@Service
@Transactional
public class NightMinFlowServiceImpl implements NightMinFlowService {
	
	@Autowired
	private NightMinFlowRepository nightMinFlowRepository;

	@Override
	public NightMinFlow get(CompositePK id) {
		return nightMinFlowRepository.findById(id).get();
	}
	
	@Override
	public List<NightMinFlow> getList() {
		return nightMinFlowRepository.findAll();
	}

	@Override
	public boolean regist(NightMinFlow domain) {
		if (isNew(domain)) {
			return nightMinFlowRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(NightMinFlow domain) {
		if (!isNew(domain)) {
			return nightMinFlowRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(NightMinFlow domain) {
		nightMinFlowRepository.delete(domain);
		return true;
	}

	private boolean isNew(NightMinFlow domain) {
		return !nightMinFlowRepository.existsById(new CompositePK(domain.getDatetime(), domain.getBkFlctcFm()));
	}

	@Override
	public NightMinFlow get(long blockId, String selectDate) {
		return nightMinFlowRepository.findByBlockAndDatetime(blockId, selectDate);
	}

	@Override
	public List<NightMinFlow> getList(long blockId, String startDate, String endDate) {
		return nightMinFlowRepository.findByBlockAndBetween(blockId, startDate, endDate);
	}

	@Override
	public List<NightMinFlow> findByBkFlctcFmAndDate(long blockId, String date) {
		return nightMinFlowRepository.findByBkFlctcFmAndDate(blockId, date);
	}

}
