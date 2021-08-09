package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.HanamBaseShp;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.HanamBaseShpService;

/**
 * 시설 정보 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/facility")
public class FacilityController {

	@Autowired
	private HanamBaseShpService hanamBaseShpService;

	@Autowired
	private BlockSmallService blockSmallService;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	@ResponseBody
	@RequestMapping(value = "/layer", method = RequestMethod.GET)
	public Object layer(Model model, String layer) {
		List<HanamBaseShp> hanamBaseShpList = hanamBaseShpService.getList();
		return hanamBaseShpList;
	}

	@ResponseBody
	@RequestMapping(value = "/blockInsert", method = RequestMethod.POST)
	public boolean blockInsert(@RequestBody BlockSmall blockSmall) {
		if (blockSmallService.isNew(blockSmall)) {
			return blockSmallService.regist(blockSmall);
		}
		
		return false;
	}
}
