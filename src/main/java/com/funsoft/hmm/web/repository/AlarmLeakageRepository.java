package com.funsoft.hmm.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmLeakageRepository extends DefaultRepository<AlarmLeakage, CompositePK> {
	
	@Query(value = "SELECT * FROM ALM_LEAKAGE WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2", nativeQuery = true)
	List<AlarmLeakage> findByBlockAndDate(long blockId, String date);
	
	AlarmLeakage findByDatetimeAndBkFlctcFm(Date date, long bkFlctcFm);

	@Query(value = "SELECT * FROM ALM_LEAKAGE WHERE DATETIME BETWEEN to_date(?1, 'yyyy-MM-dd hh24:mi:ss') and to_date(?2, 'yyyy-MM-dd hh24:mi:ss')", nativeQuery = true)
	List<AlarmLeakage> findByBetween(String startDate, String endDate);

	@Query(value = "SELECT * FROM ALM_LEAKAGE WHERE BK_FLCTC_FM = ?1 and DATETIME BETWEEN to_date(?2, 'yyyy-MM-dd hh24:mi:ss') and to_date(?3, 'yyyy-MM-dd hh24:mi:ss')", nativeQuery = true)
	List<AlarmLeakage> findByBlockAndDate(long blockId, String startDate, String endDate);
}
