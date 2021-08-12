package com.funsoft.hmm.web.service.impl;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.funsoft.hmm.web.domain.db.Weather;
import com.funsoft.hmm.web.domain.db.Weather.WeatherType;
import com.funsoft.hmm.web.repository.WeatherRepository;
import com.funsoft.hmm.web.service.WeatherService;

@Service
public class WeatherServiceImpl implements WeatherService {

	private DateFormat baseSaveFormat = new SimpleDateFormat("yyyyMMdd HHmm");
	private DateFormat dateDayFormat = new SimpleDateFormat("yyyyMMdd");
	private DateFormat dateHourFormat = new SimpleDateFormat("HHmm");

	@Autowired
	private WeatherRepository weatherRepository;

	private static final int ALIVE_CHECK_TIME_MILLISECONDS = 1 * 60 * 60 * 1000; // 1시간

	@Scheduled(fixedDelay = ALIVE_CHECK_TIME_MILLISECONDS, initialDelay = ALIVE_CHECK_TIME_MILLISECONDS)
	public void restTemplate() throws IOException {
		Date date = new Date();

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, -2);

		String responseStr = "";
		String baseUrl = "newsky2.kma.go.kr";
		String svcKey = "MaaMRUGv3%2BKhRIQwrofI8uDLbm0O%2BO9lTDfgV6ruU%2FGp%2B73vwoBEdlJXNPmYy4VbUXxoiLh2%2FtSs%2Fah05Ww1rw%3D%3D";
		RestTemplate restTpl = new RestTemplate();
		URI uri = UriComponentsBuilder.newInstance().scheme("http").host(baseUrl)
				.path("/service/SecndSrtpdFrcstInfoService2/ForecastGrib")
				.queryParam("ServiceKey", URLDecoder.decode(svcKey, "UTF-8"))
				.queryParam("base_date", dateDayFormat.format(date))
				.queryParam("base_time", dateHourFormat.format(cal.getTime())).queryParam("nx", 63)
				.queryParam("ny", 127).queryParam("pageNo", 1).queryParam("numOfRows", 100).queryParam("_type", "json")
				.build().encode().toUri();

		responseStr = restTpl.getForObject(uri, String.class);
		System.err.println(responseStr);
		// 동네예보
		// T3H : 기온
		// TMN : 최고 기온
		// TMX : 최저기온
		// REH : 습도
		// VEC :
		// WSD :
		// POP : 강수확률

		// 초단기 예보
		// T1H : 기온
		// RN1 : 1시간 강우량
		// REH : 습도
		// VEC : 풍속
		// WSD : 풍향
		try {
			Weather weatherLog = new Weather();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(responseStr);
			jsonObject = (JSONObject) jsonObject.get("response");
            jsonObject = (JSONObject) jsonObject.get("body");
            jsonObject = (JSONObject) jsonObject.get("items");
            
			JSONArray itemInfoArray = (JSONArray) jsonObject.get("item");
			for (int i = 0; i < itemInfoArray.size(); i++) {
				JSONObject itemObject = (JSONObject) itemInfoArray.get(i);

				String saveTime = itemObject.get("baseDate").toString() + " " + itemObject.get("baseTime").toString();

				Date saveRecv = null;
				try {
					saveRecv = baseSaveFormat.parse(saveTime);
				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
				weatherLog.setDatetime(saveRecv);
				// System.out.println("=Save Time " + saveRecv);

				if (itemObject.get("category").equals("T1H")) {
					// System.out.println("itemInfo: T1H value==>" + itemObject.get("obsrValue"));
					weatherLog.setTemperature(Float.parseFloat(itemObject.get("obsrValue").toString()));
				} else if (itemObject.get("category").equals("RN1")) {
					// System.out.println("itemInfo: RN1 value==>" + itemObject.get("obsrValue"));
					weatherLog.setRain(Integer.parseInt(itemObject.get("obsrValue").toString()));
				} else if (itemObject.get("category").equals("REH")) {
					// System.out.println("itemInfo: REH value==>" + itemObject.get("obsrValue"));
					weatherLog.setHumidity(Float.parseFloat(itemObject.get("obsrValue").toString()));
				} else if (itemObject.get("category").equals("WSD")) {
					// System.out.println("itemInfo: VEC value==>" + itemObject.get("obsrValue"));
					weatherLog.setWindspeed(Float.parseFloat(itemObject.get("obsrValue").toString()));
				} else if (itemObject.get("category").equals("SKY")) {
					// System.out.println("itemInfo: SKY value==>" + itemObject.get("obsrValue"));
					int skyCode = Integer.parseInt(itemObject.get("obsrValue").toString());
					String sky = "";
					if (skyCode == 1) {
						sky = "맑음";
					} else if (skyCode == 2) {
						sky = "흐림";
					} else if (skyCode == 3) {
						sky = "구름조금";
					} else {
						sky = "구름많음";
					}
					weatherLog.setSky(sky);
					
				} else if (itemObject.get("category").equals("PTY")) {
					//System.out.println("itemInfo: SKY value==>" + itemObject.get("obsrValue"));
					int ptyCode = Integer.parseInt(itemObject.get("obsrValue").toString());
					String pty = "";
					if (ptyCode == 0) {
						pty = "없음";
					} else if (ptyCode == 1) {
						pty = "비";
					} else if (ptyCode == 2) {
						pty = "비/눈";
					} else {
						pty = "눈";
					}
					weatherLog.setPercipitationform(pty);
				}
			}
			System.err.println(weatherLog);
			regist(weatherLog);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Weather get(Date id) {
		return weatherRepository.findById(id).get();
	}

	@Override
	public List<Weather> getList() {
		return weatherRepository.findAll();
	}

	@Override
	public boolean regist(Weather domain) {
		if (isNew(domain)) {
			return weatherRepository.save(domain) != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean update(Weather domain) {
		if (!isNew(domain)) {
			return weatherRepository.save(domain) != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean delete(Weather domain) {
		weatherRepository.delete(domain);
		return true;
	}

	private boolean isNew(Weather domain) {
		return !weatherRepository.existsById(domain.getDatetime());
	}

	@Override
	public Weather getLastWeather() {
		return weatherRepository.getLastWeather();
	}

	@Override
	public Weather get(String date) {
		return weatherRepository.findByDate(date);
	}
	
	@Override
	public String getImage(Weather weather) {
		String image = "";
		if (weather != null) {
			if (weather.getPercipitationform().equals("없음")) {
				if (weather.getSky() != null)
					image = WeatherType.value(weather.getSky()).getImage();
			} else {
				image = WeatherType.value(weather.getPercipitationform()).getImage();
			}
		}
		
		return image;
	}

}
