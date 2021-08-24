package com.funsoft.hmm.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis.AnalysisCompositePK;

public interface WaterFlowAnalysisRepository extends DefaultRepository<WaterFlowAnalysis, AnalysisCompositePK> {

	@Query(value = "SELECT * FROM WATER_FLOW_ANALYSIS WHERE FLCTC_FM = ?1 AND ANA_YM BETWEEN ?2 AND ?3", nativeQuery = true)
	List<WaterFlowAnalysis> findByStartDateAndEndDate(String flctcFm, String startDate, String endDate);

}
