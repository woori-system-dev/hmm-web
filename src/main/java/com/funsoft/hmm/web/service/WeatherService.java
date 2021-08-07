package com.funsoft.hmm.web.service;

import java.util.Date;

import com.funsoft.hmm.web.domain.db.Weather;

public interface WeatherService extends CRUDService<Weather, Date> {
	
	Weather getLastWeather();
	
	Weather get(String date);
	
	String getImage(Weather weather);
}
