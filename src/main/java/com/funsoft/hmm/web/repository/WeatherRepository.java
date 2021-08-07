package com.funsoft.hmm.web.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.Weather;

public interface WeatherRepository extends DefaultRepository<Weather, Date> {
	
	@Query(value = "SELECT * FROM (SELECT * FROM DAT_WEATHER ORDER BY DATETIME desc) WHERE rownum = 1", nativeQuery = true)
	Weather getLastWeather();
	
	@Query(value = "SELECT * FROM (SELECT * FROM DAT_WEATHER ORDER BY DATETIME desc) WHERE to_char(DATETIME, 'yyyy-MM-dd') = ?1 and rownum = 1", nativeQuery = true)
	Weather findByDate(String date);
}
