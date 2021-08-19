package com.funsoft.hmm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;

/**
 * 실시간 모니터링 컨트롤 구현 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("/monitoring")
public class MonitoringController {

	/** 소블록 정보 서비스 */
	@Autowired
	private BlockSmallService blockSmallService;
	
	/** 실시간계측 정보 서비스 */
	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;

	/**
	 * 실시간 모니터링 화면
	 * 
	 * @param model
	 */
	@GetMapping(value = "/dashboard")
	public void produceInfo(Model model) {
		model.addAttribute("blockList", blockSmallService.getList());
	}

	/**
	 * 블럭 리스트 조회
	 * 
	 * @return
	 */
	@GetMapping(value = "/getBlockList")
	@ResponseBody
	public List<BlockSmall> getBlockList() {
		return blockSmallService.getList();
	}
	
	/**
	 * 실사간계측정보 조회
	 * 
	 * @return
	 */
	@GetMapping(value = "/getRealTimeMeasurement")
	@ResponseBody
	public RealTimeMeasurement getRealTimeMeasurement(long blockId) {
		return realTimeMeasurementService.getRecentData(blockId);
	}
}
