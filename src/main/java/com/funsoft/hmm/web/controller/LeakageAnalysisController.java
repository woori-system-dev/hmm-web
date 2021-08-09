package com.funsoft.hmm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.LeakageAnalysisInfo;
import com.funsoft.hmm.web.domain.NightMinFlowAnalysisInfo;
import com.funsoft.hmm.web.domain.param.LeakageAnalysisSearchParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.info.LeakageAnalysisInfoService;

/**
 * 누수 분석 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/leakage")
public class LeakageAnalysisController {

	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private LeakageAnalysisInfoService leakageAnalysisInfoService;

	/**
	 * 누수 분석 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public void analysis(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	/**
	 * 야간최소유량분석 화면
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/minFlow", method = RequestMethod.GET)
	public void flowAnalysis(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	/**
	 * 누수분석에서 분석 버튼 클릭 시
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/analysis", method = RequestMethod.POST)
	@ResponseBody
	public LeakageAnalysisInfo getLeakageAnalysisInfo(@RequestBody LeakageAnalysisSearchParam param) {
		return leakageAnalysisInfoService.createLeakageAnalysisInfo(param);
	}

	/**
	 * 야간최소 유량분석에서 분석 버튼 클릭 시
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/minFlow/analysis", method = RequestMethod.POST)
	@ResponseBody
	public NightMinFlowAnalysisInfo getMinFlowAnalysisInfo(@RequestBody LeakageAnalysisSearchParam param) {
		return leakageAnalysisInfoService.createNightMinFlowAnalysisInfo(param);
	}
}
