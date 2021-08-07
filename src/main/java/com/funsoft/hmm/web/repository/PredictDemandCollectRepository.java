package com.funsoft.hmm.web.repository;

import java.util.List;

import com.funsoft.hmm.web.domain.db.PredictDemandCollect;
import com.funsoft.hmm.web.domain.db.PredictDemandCollect.PredictDemandCollectPK;

public interface PredictDemandCollectRepository extends DefaultRepository<PredictDemandCollect, PredictDemandCollectPK> {
	
	List<PredictDemandCollect> findByBkFlctcFm(long bkFlctcFm);
}
