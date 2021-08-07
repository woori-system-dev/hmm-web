package com.funsoft.hmm.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.NightMinFlow;

public interface NightMinFlowRepository extends DefaultRepository<NightMinFlow, CompositePK> {
	
	String form = "(SELECT * FROM FEP_MINFLOW ORDER BY FLOW asc)";
	
	@Query(value = "SELECT * FROM " + form + " WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2 and rownum = 1", nativeQuery = true)
	NightMinFlow findByBlockAndDatetime(long blockId, String selectDate);
	
	@Query(value = "SELECT * FROM FEP_MINFLOW WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') BETWEEN ?2 and ?3", nativeQuery = true)
	List<NightMinFlow> findByBlockAndBetween(long blockId, String startDate, String endDate);
	
	@Query(value = "SELECT * FROM FEP_MINFLOW WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2", nativeQuery = true)
	List<NightMinFlow> findByBkFlctcFmAndDate(long blockId, String date);
}
