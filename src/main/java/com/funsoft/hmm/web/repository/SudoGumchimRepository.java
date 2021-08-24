package com.funsoft.hmm.web.repository;

import java.util.List;

import com.funsoft.hmm.web.domain.db.SudoGumchim;
import com.funsoft.hmm.web.domain.db.SudoGumchim.SudoGumchimCompositePK;

public interface SudoGumchimRepository extends DefaultRepository<SudoGumchim, SudoGumchimCompositePK> {

	List<SudoGumchim> findBySuyNoAndMetaNumAndGumchimYmdBetween(String suyNo, String metaNum, String startDate,
			String endDate);

	List<SudoGumchim> findBySuyNoAndSangBizAndMetaNumAndGumchimYmdBetween(String suyNo, String sangBiz, String metaNum,
			String startDate, String endDate);

	List<SudoGumchim> findByMetaNumAndGumchimYmdBetween(String metaNum, String startDate, String endDate);

	List<SudoGumchim> findByGumchimYmdBetween(String startDate, String endDate);

}
