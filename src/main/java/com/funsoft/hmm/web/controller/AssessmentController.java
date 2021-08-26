package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.db.AgemngBlock;
import com.funsoft.hmm.web.service.AgemngBlockService;

/**
 * 건전도 평가 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/assessment")
public class AssessmentController {

	@Autowired
	private AgemngBlockService agemngBlockService;
	
	@RequestMapping(value = "/block", method = RequestMethod.GET)
	public void analysis(Model model) {
	}

	@RequestMapping(value = "/block/getList", method = RequestMethod.GET)
	@ResponseBody
	public List<AgemngBlock> getList() {
		return agemngBlockService.getList();
	}

	@RequestMapping(value = "/block/detail", method = RequestMethod.POST)
	@ResponseBody
	public AgemngBlock blockDetail(long blockId) {
		return agemngBlockService.get(blockId);
	}

}
