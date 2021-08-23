package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis.AnalysisCompositePK;
import com.funsoft.hmm.web.repository.WaterFlowAnalysisRepository;
import com.funsoft.hmm.web.service.WaterFlowAnalysisService;

/**
 * 총괄수량수지분석 서비스
 * 
 * @author hgko
 *
 */
@Service
public class WaterFlowAnalysisServiceImpl implements WaterFlowAnalysisService {
	
	@Autowired
	private WaterFlowAnalysisRepository waterFlowAnalysisRepository;

	@Override
	public WaterFlowAnalysis get(AnalysisCompositePK id) {
		return waterFlowAnalysisRepository.findById(id).get();
	}

	@Override
	public List<WaterFlowAnalysis> getList() {
		return waterFlowAnalysisRepository.findAll();
	}

	@Override
	public boolean regist(WaterFlowAnalysis domain) {
		return false;
	}

	@Override
	public boolean update(WaterFlowAnalysis domain) {
		return false;
	}

	@Override
	public boolean delete(WaterFlowAnalysis domain) {
		return false;
	}

}
