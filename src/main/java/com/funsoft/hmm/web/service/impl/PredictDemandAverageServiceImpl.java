package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.db.PredictDemandAverage;
import com.funsoft.hmm.web.domain.db.PredictDemandAverage.PredictDemandAveragePK;
import com.funsoft.hmm.web.repository.PredictDemandAverageRepository;
import com.funsoft.hmm.web.service.PredictDemandAverageService;

@Service
public class PredictDemandAverageServiceImpl implements PredictDemandAverageService {
	
	@Autowired
	private PredictDemandAverageRepository predictDemandAverageRepository;
	
	@Override
	public PredictDemandAverage get(PredictDemandAveragePK id) {
		return predictDemandAverageRepository.findById(id).get();
	}
	
	@Override
	public List<PredictDemandAverage> getList() {
		return predictDemandAverageRepository.findAll();
	}

	@Override
	public boolean regist(PredictDemandAverage domain) {
		if (isNew(domain)) {
			return predictDemandAverageRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(PredictDemandAverage domain) {
		if (!isNew(domain)) {
			return predictDemandAverageRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(PredictDemandAverage domain) {
		predictDemandAverageRepository.delete(domain);
		return true;
	}

	private boolean isNew(PredictDemandAverage domain) {
		return !predictDemandAverageRepository.existsById(
				new PredictDemandAveragePK(domain.getBkFlctcFm(), domain.getHoliday(), domain.getSky(), 
						domain.getRain(), domain.getTemLow(), domain.getTemHigh(), domain.getHumidity()));
	}
	
}
