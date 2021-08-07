package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String listWithPost(Model model, BlockInfo blockInfo) {
		model.addAttribute("blockInfo", blockInfo);
		model.addAttribute("blockList", blockSmallService.getList());
		return "alarm/detail";
	}

	@RequestMapping(value = "/history", method = RequestMethod.POST)
	@ResponseBody
	public List<AlarmHistory> history(String date) {
		return historyInfoService.createAlarmHistory(date);
	}

	@RequestMapping(value = "/getBlockInfo", method = RequestMethod.POST)
	@ResponseBody
	public BlockInfo getBlockInfo(@RequestBody AlarmHistory history) {
		return historyInfoService.getBlockInfo(history);
	}

	@RequestMapping(value = "/searchResult", method = RequestMethod.POST)
	@ResponseBody
	public List<AlarmHistoryTable> searchResult() {
		return dummyTestService.createAlarmHistoryInfoList();
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public AlarmHistoryDetail detail(@RequestBody AlarmSearchParam param) {
		return historyInfoService.createAlarmHistoryDetail(param);
	}
}
