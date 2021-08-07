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
	
	@RequestMapping(value = "/colligation", method = RequestMethod.GET)
	public void colligation(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@ResponseBody
	@RequestMapping(value = "/colligation/search", method = RequestMethod.GET)
	public String colligationSearch(Model model, String startDate, String endDate,
			@RequestParam(value = "checkList[]") ArrayList<String> checkList) {
		System.err.println(startDate);
		System.err.println(endDate);
		System.err.println(checkList);
		/* model.addAttribute("blockList" , blockList()); */
		return null;
	}

	@RequestMapping(value = "/administration", method = RequestMethod.GET)
	public void administration(Model model) {
	}

	@RequestMapping(value = "/demand", method = RequestMethod.GET)
	public void demand(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

}
