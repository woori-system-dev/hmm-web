package com.funsoft.hmm.web.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;

public interface RealTimeMeasurementRepository extends DefaultRepository<RealTimeMeasurement, CompositePK> {
	
	String select = "SELECT new com.funsoft.hmm.web.domain.RealTimeAnalysis(to_char(datetime, 'hh24'), ROUND(avg(flow), 2))";
	String form = "(SELECT * FROM FEP_REAL ORDER BY DATETIME desc)";
	
	RealTimeMeasurement findByBkFlctcFmAndDatetime(long bkFlctcFm, Date date);
	
	@Query(value = "SELECT * FROM " + form + " WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd hh24:mi:ss') <= ?2 and rownum = 1", nativeQuery = true)
	RealTimeMeasurement getRecentData(long blockId, String dateTime);
	
	@Query(value = "SELECT * FROM " + form + " WHERE BK_FLCTC_FM = ?1 and rownum = 1", nativeQuery = true)
	RealTimeMeasurement getRecentData(long blockId);
	
	@Query(value = "SELECT * FROM " + form + " WHERE BK_FLCTC_FM = ?1 and DATETIME BETWEEN to_date(?2, 'yyyy-MM-dd hh24:mi:ss') and to_date(?3, 'yyyy-MM-dd hh24:mi:ss')", nativeQuery = true)
	List<RealTimeMeasurement> findByBkFlctcFmAndBetween(long blockId, String startDate, String endDate);
	
	@Query(value = "SELECT * FROM " + form + " WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd hh24:mi:ss') <= ?2 and rownum <= ?3", nativeQuery = true)
	List<RealTimeMeasurement> findByBkFlctcFmAndDateAndRownum(long blockId, String dateTime, int rownum);

	@Query(select + " FROM RealTimeMeasurement WHERE bkFlctcFm = ?1 and to_char(datetime, 'yyyy-MM-dd') = ?2 GROUP BY to_char(datetime, 'hh24')")
	List<RealTimeAnalysis> findByGroupBy(long blockId, String date);
	
	@Query(select + " FROM RealTimeMeasurement WHERE bkFlctcFm = ?1 and to_char(datetime, 'yyyy-MM-dd') BETWEEN ?2 and ?3 and holiday = ?4 GROUP BY to_char(datetime, 'hh24')")
	List<RealTimeAnalysis> findByGroupBy(long blockId, String startDate, String endDate, boolean holiday);
	
	@Query("SELECT new com.funsoft.hmm.web.domain.RealTimeAnalysis(round(flow), count(*)) FROM RealTimeMeasurement WHERE bkFlctcFm = ?1 and to_char(datetime, 'yyyy-MM-dd') BETWEEN ?2 and ?3 GROUP BY flow ORDER BY flow")
	List<RealTimeAnalysis> findByGroupBy(long blockId, String startDate, String endDate);
	
	@Query(value = "SELECT * FROM FEP_REAL WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2", nativeQuery = true)
	List<RealTimeMeasurement> findByBkFlctcFmAndDate(long blockId, String date);

	@Query(value = "SELECT * FROM " + form + " WHERE DATETIME BETWEEN to_date(?1, 'yyyy-MM-dd hh24:mi:ss') and to_date(?2, 'yyyy-MM-dd hh24:mi:ss')", nativeQuery = true)
	List<RealTimeMeasurement> findByBetween(String startDate, String endDate);
}
