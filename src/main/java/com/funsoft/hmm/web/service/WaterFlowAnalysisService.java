package com.funsoft.hmm.web.service;

import java.util.List;

import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis.AnalysisCompositePK;

public interface WaterFlowAnalysisService extends CRUDService<WaterFlowAnalysis, AnalysisCompositePK> {

	WaterFlowAnalysis search(String startDate, String endDate, List<String> checkList);

	List<WaterFlowAnalysis> getList(long flctcFm, String format);

}
