package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.PredictDemandCollect;
import com.funsoft.hmm.web.domain.db.PredictDemandCollect.PredictDemandCollectPK;
import com.funsoft.hmm.web.repository.PredictDemandCollectRepository;
import com.funsoft.hmm.web.service.PredictDemandCollectService;

@Service
@Transactional
public class PredictDemandCollectServiceImpl implements PredictDemandCollectService {
	
	@Autowired
	private PredictDemandCollectRepository predictDemandCollectRepository;

	@Override
	public PredictDemandCollect get(PredictDemandCollectPK id) {
		return predictDemandCollectRepository.findById(id).get();
	}
	
	@Override
	public List<PredictDemandCollect> getList() {
		return predictDemandCollectRepository.findAll();
	}

	@Override
	public boolean regist(PredictDemandCollect domain) {
		if (isNew(domain)) {
			return predictDemandCollectRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(PredictDemandCollect domain) {
		if (!isNew(domain)) {
			return predictDemandCollectRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(PredictDemandCollect domain) {
		predictDemandCollectRepository.delete(domain);
		return true;
	}

	private boolean isNew(PredictDemandCollect domain) {
		return !predictDemandCollectRepository.existsById(
				new PredictDemandCollectPK(domain.getBkFlctcFm(), domain.getIdx(), domain.getHoliday(), 
						domain.getSky(), domain.getRain(), domain.getTemLow(), domain.getTemHigh(), domain.getHumidity()));
	}

}
