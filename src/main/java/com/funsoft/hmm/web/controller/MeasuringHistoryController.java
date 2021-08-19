package com.funsoft.hmm.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.BlockInfo;
import com.funsoft.hmm.web.domain.MeasuringHistory;
import com.funsoft.hmm.web.domain.MeasuringHistoryDetail;
import com.funsoft.hmm.web.domain.param.MeasurementSearchParam;
import com.funsoft.hmm.web.domain.param.SearchParam;
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
	@GetMapping(value = "/list")
	public void list(Model model) {
		model.addAttribute("currentTime", dateFormat.format(new Date()));
	}

	/**
	 * 계측 이력 조회 화면
	 * 
	 * @param model
	 * @param blockInfo
	 * @return
	 */
	@PostMapping(value = "/list")
	public String listWithPost(Model model, BlockInfo blockInfo) {
		model.addAttribute("blockInfo", blockInfo);
		model.addAttribute("blockList", blockSmallService.getList());
		model.addAttribute("currentTime", dateFormat.format(new Date()));

		return "measurement/detail";
	}

	/**
	 * 계측 이력 조회
	 * @param param
	 * @return
	 */
	@PostMapping(value = "/history")
	@ResponseBody
	public List<MeasuringHistory> history(@RequestBody SearchParam param) {
		return historyInfoService.createMeasuringHistory(param.getDateTime());
	}

	/**
	 * 블럭정보 조회
	 * 
	 * @param history
	 * @return
	 */
	@PostMapping(value = "/getBlockInfo")
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
	@GetMapping(value = "/detail")
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
	@PostMapping(value = "/detail")
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
	@PostMapping(value = "/searchResult")
	@ResponseBody
	public List<MeasuringHistory> searchResult(MeasurementSearchParam param) {
		return historyInfoService.getMeasuringHistoryList(param);
	}
}
