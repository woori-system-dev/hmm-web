package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.service.BlockSmallService;

/**
 * 실시간 모니터링 컨트롤 구현 클래스
 * 
 * @author hoywon
 *
 */
@Controller
@RequestMapping("/monitoring")
public class MonitoringController {
	
	@Autowired
	private BlockSmallService blockSmallService;
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public void produceInfo(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public void controlMonitoring(Model model) {

	}

	@RequestMapping(value = "/getBlockList", method = RequestMethod.GET)
	@ResponseBody
	public List<BlockSmall> getBlockList(Model model) {
		return blockSmallService.getList();
	}
}
