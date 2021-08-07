package com.funsoft.hmm.web.domain.db;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;
import lombok.Getter;

/**
 * 날씨 정보
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "DAT_WEATHER")
@Data
public class Weather implements Domain {

	/** 시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 기온 */
	private float temperature;
	
	/** 1시간강수량 */
	private float rain;
	
	/** 하늘상태 */
	@Column(length = 20)
	private String sky;
	
	/** 습도 */
	private float humidity;
	
	/** 강수형태 */
	@Column(length = 20)
	private String percipitationform;
	
	/** 풍속 */
	private float windspeed;
	
	@Getter
	public enum WeatherType {
		맑음("맑음", "weather_sun.png"), 
		흐림("흐림", "weather_cloud.png"), 
		구름조금("구름조금","weather_cloud_su.pngn"), 
		구름많음("구름많음", "weather_cloud_much.png"),
		비("비", "weather_rainy.png"),
		비_눈("비/눈", "weather_snow.png"),
		눈("눈", "weather_snow.png");
		
		private String name;
		
		private String image;
		
		private WeatherType(String name, String image) {
			this.name= name;
			this.image = image;
		}
		
		public static WeatherType value(String name) {
			for (WeatherType type : WeatherType.values()) {
				if (type.getName().equals(name)) {
					return type;
				}
			}
			
			return null;
		}
	}
}
