package com.funsoft.hmm.web.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.DistributionAnalysisInfo;
import com.funsoft.hmm.web.domain.PressureAnalysisInfo;
import com.funsoft.hmm.web.domain.PressurePatternAnalysisInfo;
import com.funsoft.hmm.web.domain.db.Weather;
import com.funsoft.hmm.web.domain.param.PatternSearchParam;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.HighestTemp;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.Humidity;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.LowestTemp;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.Rainfall;
import com.funsoft.hmm.web.domain.param.PatternSearchParam.Sky;
import com.funsoft.hmm.web.domain.param.PressureAnalysisSearchParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.WeatherService;
import com.funsoft.hmm.web.service.info.PressureAnalysisInfoService;

/**
 * 수압 분석 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/pressure")
public class PressureAnalysisController {

	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private PressureAnalysisInfoService pressureAnalysisInfoService;

	@Autowired
	private WeatherService weatherService;

	/**
	 * 수압분석 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public void analysis(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@RequestMapping(value = "/analysis", method = RequestMethod.POST)
	@ResponseBody
	public PressureAnalysisInfo analysis(@RequestBody PressureAnalysisSearchParam param) {
		return pressureAnalysisInfoService.createPressureAnalysisInfo(param);
	}

	/**
	 * 수압분포분석 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/distribution", method = RequestMethod.GET)
	public void distribution(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@RequestMapping(value = "/distribution", method = RequestMethod.POST)
	@ResponseBody
	public DistributionAnalysisInfo distribution(@RequestBody PressureAnalysisSearchParam param) {
		return pressureAnalysisInfoService.createDistributionAnalysisInfo(param);
	}

	/**
	 * 수압패턴분석 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/pattern", method = RequestMethod.GET)
	public void pattern(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
		Weather weather = weatherService.get(DateUtil.toDateString(new Date()));
		if (weather == null) {
			weather = weatherService.getLastWeather();
		}
		model.addAttribute("weatherImage", weatherService.getImage(weather));
		model.addAttribute("weather", weather);
		model.addAttribute("skys", Sky.values());
		model.addAttribute("rainfalls", Rainfall.values());
		model.addAttribute("lowestTemps", LowestTemp.values());
		model.addAttribute("highestTemps", HighestTemp.values());
		model.addAttribute("humiditys", Humidity.values());
	}

	@RequestMapping(value = "/weather/setting", method = RequestMethod.POST)
	@ResponseBody
	public PatternSearchParam currentWeatherSetting() {
		return pressureAnalysisInfoService.currentWeatherSetting();
	}

	@RequestMapping(value = "/pattern", method = RequestMethod.POST)
	@ResponseBody
	public PressurePatternAnalysisInfo pattern(@RequestBody PatternSearchParam param) {
		return pressureAnalysisInfoService.createPressurePatternAnalysisInfo(param);
	}
}
