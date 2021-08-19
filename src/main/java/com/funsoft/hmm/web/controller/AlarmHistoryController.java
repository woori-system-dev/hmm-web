package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.AlarmHistory;
import com.funsoft.hmm.web.domain.AlarmHistoryDetail;
import com.funsoft.hmm.web.domain.AlarmHistoryTable;
import com.funsoft.hmm.web.domain.BlockInfo;
import com.funsoft.hmm.web.domain.param.AlarmSearchParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.info.DummyTestService;
import com.funsoft.hmm.web.service.info.HistoryInfoService;

/**
 * 알람 이력 정보
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/alarm")
public class AlarmHistoryController {

	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private HistoryInfoService historyInfoService;

	@Autowired
	private DummyTestService dummyTestService;

	/**
	 * 알람 이력 화면
	 * 
	 * @param model
	 */
	@GetMapping(value = "/list")
	public void list(Model model) {
	}

	/**
	 * 알람 이력 조회 화면
	 * 
	 * @param model
	 * @param blockInfo
	 * @return
	 */
	@PostMapping(value = "/list")
	public String listWithPost(Model model, BlockInfo blockInfo) {
		model.addAttribute("blockInfo", blockInfo);
		model.addAttribute("blockList", blockSmallService.getList());
		return "alarm/detail";
	}

	/**
	 * 알람 이력 조회
	 * 
	 * @param date
	 * @return
	 */
	@PostMapping(value = "/history")
	@ResponseBody
	public List<AlarmHistory> history(String date) {
		return historyInfoService.createAlarmHistory(date);
	}

	/**
	 * 블럭 정보 조회
	 * 
	 * @param history
	 * @return
	 */
	@PostMapping(value = "/getBlockInfo")
	@ResponseBody
	public BlockInfo getBlockInfo(@RequestBody AlarmHistory history) {
		return historyInfoService.getBlockInfo(history);
	}

	@PostMapping(value = "/searchResult")
	@ResponseBody
	public List<AlarmHistoryTable> searchResult() {
		return dummyTestService.createAlarmHistoryInfoList();
	}

	/**
	 * 알람 이력 상세 조회
	 */
	@PostMapping(value = "/detail")
	@ResponseBody
	public AlarmHistoryDetail detail(@RequestBody AlarmSearchParam param) {
		return historyInfoService.createAlarmHistoryDetail(param);
	}
}
