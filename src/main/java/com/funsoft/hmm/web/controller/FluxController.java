package com.funsoft.hmm.web.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.service.BlockSmallService;

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

	/**
	 * 총괄수량수지분석 화면
	 * @param model
	 */
	@RequestMapping(value = "/colligation", method = RequestMethod.GET)
	public void colligation(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@ResponseBody
	@RequestMapping(value = "/colligation/search", method = RequestMethod.GET)
	public String colligationSearch(String startDate, String endDate,
			@RequestParam(value = "checkList[]") ArrayList<String> checkList) {
		return null;
	}

	/**
	 * 검침데이터 관리 화면
	 * @param model
	 */
	@RequestMapping(value = "/administration", method = RequestMethod.GET)
	public void administration(Model model) {
	}

	/**
	 * 수요패턴 분석 화면
	 * @param model
	 */
	@RequestMapping(value = "/demand", method = RequestMethod.GET)
	public void demand(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

}
