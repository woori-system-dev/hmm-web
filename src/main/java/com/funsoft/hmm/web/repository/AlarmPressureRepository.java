package com.funsoft.hmm.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.AlarmPressure;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmPressureRepository extends DefaultRepository<AlarmPressure, CompositePK> {
	
	@Query(value = "SELECT * FROM ALM_PRESSURE WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2", nativeQuery = true)
	List<AlarmPressure> findByBkFlctcFmAndDate(long blockId, String date);

	@Query(value = "SELECT * FROM ALM_PRESSURE WHERE DATETIME BETWEEN to_date(?1, 'yyyy-MM-dd hh24:mi:ss') and to_date(?2, 'yyyy-MM-dd hh24:mi:ss')", nativeQuery = true)
	List<AlarmPressure> findByBetween(String startDate, String endDate);
	
	@Query(value = "SELECT * FROM ALM_PRESSURE WHERE BK_FLCTC_FM = ?1 and to_char(datetime, 'yyyy-MM-dd') BETWEEN to_date(?2, 'yyyy-MM-dd') and to_date(?3, 'yyyy-MM-dd')", nativeQuery = true)
	List<AlarmPressure> findByBkFlctcFmAndDate(long blockId, String startDate, String endDate);
}
