package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.db.SudoGumchim;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis;
import com.funsoft.hmm.web.domain.param.SudoGumchimParam;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.SudoGumchimService;
import com.funsoft.hmm.web.service.WaterFlowAnalysisService;

/**
 * 유량 분석 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/flux")
public class FluxController {

	@Autowired
	private BlockSmallService blockSmallService;
	
	@Autowired
	private WaterFlowAnalysisService waterFlowAnalysisService;
	
	@Autowired
	private SudoGumchimService sudoGumchimService;

	/**
	 * 총괄수량수지분석 화면
	 * @param model
	 */
	@GetMapping(value = "/colligation")
	public void colligation(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	/**
	 * 총괄수량수지분석 조회
	 * @param startDate
	 * @param endDate
	 * @param checkList
	 * @return
	 */
	@GetMapping(value = "/colligation/search")
	@ResponseBody
	public WaterFlowAnalysis colligationSearch(String startDate, String endDate,
			@RequestParam(value = "checkList[]") List<String> checkList) {
		return waterFlowAnalysisService.search(startDate, endDate, checkList );
	}

	/**
	 * 검침데이터 관리 화면
	 * @param model
	 */
	@GetMapping(value = "/administration")
	public void administration(Model model) {
	}
	
	/**
	 * 검침데이터 조회
	 * @param param
	 * @return
	 */
	@PostMapping(value = "/administration/search")
	@ResponseBody
	public List<SudoGumchim> searchAdministration(SudoGumchimParam param) {
		return sudoGumchimService.getList(param);
	}

	/**
	 * 수요패턴 분석 화면
	 * @param model
	 */
	@GetMapping(value = "/demand")
	public void demand(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

}
