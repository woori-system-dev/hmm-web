package com.funsoft.hmm.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.BlockInfo;
import com.funsoft.hmm.web.domain.MeasuringHistory;
import com.funsoft.hmm.web.domain.MeasuringHistoryDetail;
import com.funsoft.hmm.web.domain.param.MeasurementSearchParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.info.HistoryInfoService;

/**
 * 계측 이력 정보 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/measurement")
public class MeasuringHistoryController {

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");

	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private HistoryInfoService historyInfoService;

	/**
	 * 계측 이력 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("currentTime", dateFormat.format(new Date()));
	}

	/**
	 * 계측 이력 조회
	 * 
	 * @param model
	 * @param blockInfo
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String listWithPost(Model model, BlockInfo blockInfo) {
		model.addAttribute("blockInfo", blockInfo);
		model.addAttribute("blockList", blockSmallService.getList());
		model.addAttribute("currentTime", dateFormat.format(new Date()));

		return "measurement/detail";
	}

	@RequestMapping(value = "/history", method = RequestMethod.POST)
	@ResponseBody
	public List<MeasuringHistory> history(String dateTime) {
		return historyInfoService.createMeasuringHistory(dateTime);
	}

	@RequestMapping(value = "/getBlockInfo", method = RequestMethod.POST)
	@ResponseBody
	public BlockInfo getBlockInfo(@RequestBody MeasuringHistory history) {
		return historyInfoService.getBlockInfo(history);
	}

	/**
	 * 계측 이력 상세 정보 화면
	 * 
	 * @param model
	 * @param blockInfo
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detail(Model model, BlockInfo blockInfo) {
		model.addAttribute("blockInfo", blockInfo);
		model.addAttribute("blockList", blockSmallService.getList());
		model.addAttribute("currentTime", dateFormat.format(new Date()));
	}

	/**
	 * 계측 이력 정보 검색
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public MeasuringHistoryDetail detail(@RequestBody MeasurementSearchParam param) {
		return historyInfoService.createMeasuringHistoryDetail(param);
	}

	/**
	 * 계측 이력 검색 결과 리스트
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/searchResult", method = RequestMethod.POST)
	@ResponseBody
	public List<MeasuringHistory> searchResult(MeasurementSearchParam param) {
		return historyInfoService.getMeasuringHistoryList(param);
	}
}
