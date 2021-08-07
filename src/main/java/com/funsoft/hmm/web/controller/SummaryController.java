package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.FlowDeviceService;
import com.funsoft.hmm.web.service.PressureDeviceService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.funsoft.hmm.web.service.WeatherService;

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

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("weather", weatherService.getLastWeather());

		/* 블록 리스트 ABCD.. */
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@RequestMapping(value = "/block", method = RequestMethod.GET)
	public void list(Model model, String block) {

		System.err.println(blockSmallService.getList());

		BlockSmall blockSmall = blockSmallService.getBkNM(block);
		System.err.println(blockSmall);
		List<RealTimeMeasurement> realTimeMeasurementList = realTimeMeasurementService.getList(101004001,
				"2018-06-07 00:00:00", "2018-06-07 15:00:00");
		System.err.println(realTimeMeasurementList);

		/* 유압계 서비스 */
		model.addAttribute("flowDevice", flowDeviceService.get((long)blockSmall.getFmtIdn()));
		/* 수압계 서비스 */
		model.addAttribute("pressureDevice", pressureDeviceService.get((long)blockSmall.getPmtIdn()));
		/* 날씨 서비스 */
		model.addAttribute("weather", weatherService.getLastWeather());
		/* 블록 정보 */
		model.addAttribute("block", blockSmall);
		/* 블록 리스트 ABCD.. */
		model.addAttribute("blockList", blockSmallService.getList());
	}
}
