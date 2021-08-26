package com.funsoft.hmm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.SummaryInfo;
import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.Weather;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.FlowDeviceService;
import com.funsoft.hmm.web.service.PressureDeviceService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.funsoft.hmm.web.service.WeatherService;
import com.funsoft.hmm.web.service.info.SummaryInfoService;

/**
 * 종합 요약 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/summary")
public class SummaryController {

	@Autowired
	private WeatherService weatherService;

	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;

	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private FlowDeviceService flowDeviceService;

	@Autowired
	private PressureDeviceService pressureDeviceService;
	
	@Autowired
	private SummaryInfoService summaryInfoService;

	/**
	 * 종합 요약 화면(전체)
	 * @param model
	 */
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public void list(Model model) {
		/* 블록 리스트 ABCD.. */
		model.addAttribute("blockList", blockSmallService.getList());
		model.addAttribute("summaryInfo", summaryInfoService.getSummaryInfo());
		
		Weather weather = weatherService.getLastWeather();
		model.addAttribute("weather", weather);
		model.addAttribute("weatherImage", weatherService.getImage(weather));
	}
	
	/**
	 * 알람 정보 조회
	 */
	@RequestMapping(value = "/all/alarm", method = RequestMethod.GET)
	@ResponseBody
	public SummaryInfo alarmInfo() {
		return summaryInfoService.getAlarmInfo();
	}
	
	/**
	 * 블록 선택 시 화면
	 * @param model
	 * @param block
	 */
	@RequestMapping(value = "/block", method = RequestMethod.GET)
	public void list(Model model, String block) {

		BlockSmall blockSmall = blockSmallService.getBkNM(block);
		
		/* 블록 정보 */
		model.addAttribute("block", blockSmall);
		/* 블록 리스트 ABCD.. */
		model.addAttribute("blockList", blockSmallService.getList());
		/* 유압계 서비스 */
		model.addAttribute("flowDevice", flowDeviceService.get((long) blockSmall.getFmtIdn()));
		/* 수압계 서비스 */
		model.addAttribute("pressureDevice", pressureDeviceService.get((long) blockSmall.getPmtIdn()));
		/* 날씨 서비스 */
		model.addAttribute("weather", weatherService.getLastWeather());
		/* 실시간모니터링 */
		model.addAttribute("realTimeMeasurement", realTimeMeasurementService.getRecentData(blockSmall.getFlctcFm()));
		
		model.addAttribute("summaryInfo", summaryInfoService.getBlockBySummaryInfo(blockSmall));
	}
	
	/**
	 * 블록별 요약 정보 조회
	 */
	@RequestMapping(value = "/block/info", method = RequestMethod.GET)
	@ResponseBody
	public SummaryInfo getSummaryInfo(long blockId) {
		return summaryInfoService.getSummaryInfo(blockId);
	}
}
