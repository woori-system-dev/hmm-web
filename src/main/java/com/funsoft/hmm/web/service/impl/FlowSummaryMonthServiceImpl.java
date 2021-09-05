package com.funsoft.hmm.web.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.db.FlowSummaryMonth;
import com.funsoft.hmm.web.repository.FlowSummaryMonthRepository;
import com.funsoft.hmm.web.service.FlowSummaryMonthService;

@Service
public class FlowSummaryMonthServiceImpl implements FlowSummaryMonthService {
	
	@Autowired
	private FlowSummaryMonthRepository flowSummaryMonthRepository;

	@Override
	public FlowSummaryMonth get(String id) {
		Optional<FlowSummaryMonth> flowSummaryMonths = flowSummaryMonthRepository.findById(id);
		return flowSummaryMonths.isPresent() ? flowSummaryMonths.get() : null;
	}
	
	@Override
	public List<FlowSummaryMonth> getList() {
		return flowSummaryMonthRepository.findAll();
	}

	@Override
	public boolean regist(FlowSummaryMonth domain) {
		if (isNew(domain)) {
			return flowSummaryMonthRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(FlowSummaryMonth domain) {
		if (!isNew(domain)) {
			return flowSummaryMonthRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(FlowSummaryMonth domain) {
		flowSummaryMonthRepository.delete(domain);
		return true;
	}

	private boolean isNew(FlowSummaryMonth flowDevice) {
		return !flowSummaryMonthRepository.existsById(flowDevice.getSummaryYm());
	}
}
